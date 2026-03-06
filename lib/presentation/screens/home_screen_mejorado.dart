// lib/presentation/screens/home_screen_mejorado.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sirega_app/nucleo/servicios/firebase_sync_service.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/nucleo/servicios/auth_service.dart';
import 'package:sirega_app/modulos/3_registro_evento/presentation/pantallas/seleccionar_tipo_evento_screen.dart';
import 'package:sirega_app/presentation/screens/agregar_animal/agregar_animal_screen.dart';
import 'package:sirega_app/debug/sync_debug_screen_simple.dart';
import 'package:sirega_app/presentation/screens/profile_screen.dart';
import 'package:sirega_app/presentation/animations/circular_reveal_clipper.dart';

import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'dart:async';

// Import the new widgets
import 'package:sirega_app/presentation/widgets/home/quick_stats_bar.dart';
import 'package:sirega_app/presentation/widgets/home/primary_action_card.dart';
import 'package:sirega_app/presentation/widgets/home/sync_status_card.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentation/pantallas/cattle_list_screen.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/presentation/screens/escaneo_nfc_screen.dart';
import 'package:sirega_app/modulos/5_reporte_aereo/presentation/pantallas/aerial_report_screen.dart';

class HomeScreenMejorado extends StatefulWidget {
  const HomeScreenMejorado({super.key});

  @override
  State<HomeScreenMejorado> createState() => _HomeScreenMejoradoState();
}

class _HomeScreenMejoradoState extends State<HomeScreenMejorado>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _syncAnimationController;
  late Animation<double> _fadeAnimation;

  // Dashboard data
  int totalAnimales = 0;
  int animalesActivos = 0;
  int alertasSanitarias = 0;
  int registrosPendientesSync = 0;
  bool sincronizando = false;
  DateTime? ultimaSync;

  IsarService? isarService;
  FirebaseSyncService? _syncService;
  bool _isDataInitialized = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _syncAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isDataInitialized) {
      isarService = RepositoryProvider.of<IsarService>(context);
      _syncService = RepositoryProvider.of<FirebaseSyncService>(context);
      _cargarDatos();
      _isDataInitialized = true;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _syncAnimationController.dispose();
    super.dispose();
  }

  Future<void> _cargarDatos() async {
    if (isarService == null || _syncService == null) return;
    try {
      final animales = await isarService!.obtenerTodosLosAnimales();
      final pendientes = await _syncService!.getPendingCount();
      if (mounted) {
        setState(() {
          totalAnimales = animales.length;
          animalesActivos = animales
              .where((a) => a.estado == EstadoAnimal.activo)
              .length;

          // Calcular alertas sanitarias reales basadas en el estado de salud
          alertasSanitarias = animales.where((animal) {
            return animal.estadoSalud == EstadoSalud.critico ||
                animal.estadoSalud == EstadoSalud.enfermo ||
                animal.estadoSalud == EstadoSalud.enTratamiento;
          }).length;

          registrosPendientesSync = pendientes;
        });
      }
    } catch (e) {
      debugPrint('Error cargando datos: $e');
    }
  }

  Future<void> _sincronizarDatos() async {
    if (sincronizando || _syncService == null) return;

    setState(() => sincronizando = true);
    _syncAnimationController.repeat();

    try {
      await _syncService!.syncPendingChanges();
      await _cargarDatos(); // Recargar datos para reflejar cambios
      if (mounted) {
        setState(() {
          ultimaSync = DateTime.now();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '✅ Sincronización completada',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            backgroundColor: AppColors.success,
            behavior: SnackBarBehavior.fixed,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '❌ Error al sincronizar: $e',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.fixed,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => sincronizando = false);
        _syncAnimationController.stop();
      }
    }
  }

  void _onActionTap(VoidCallback action) {
    HapticFeedback.mediumImpact();
    action();
  }

  void _scanNFC() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EscaneoNfcScreen()),
    );
  }

  void _registrarAnimal() {
    Navigator.push(
      context,
      //MaterialPageRoute(builder: (context) => const RegisterAnimalScreen()),
      MaterialPageRoute(builder: (context) => const AgregarAnimalScreen()),
    ).then((_) => _cargarDatos());
  }

  void _registrarEvento() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SeleccionarTipoEventoScreen(),
      ),
    );
  }

  void _verInventario() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CattleListScreen()),
    ).then((_) => _cargarDatos());
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Buenos Días';
    if (hour < 18) return 'Buenas Tardes';
    return 'Buenas Noches';
  }

  String _formatearTiempoTranscurrido(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'hace ${difference.inSeconds} seg';
    } else if (difference.inMinutes < 60) {
      return 'hace ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'hace ${difference.inHours} h';
    } else if (difference.inDays < 7) {
      return 'hace ${difference.inDays} día${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return 'hace $weeks semana${weeks > 1 ? 's' : ''}';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return 'hace $months mes${months > 1 ? 'es' : ''}';
    } else {
      final years = (difference.inDays / 365).floor();
      return 'hace $years año${years > 1 ? 's' : ''}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              SyncStatusCard(
                sincronizando: sincronizando,
                registrosPendientesSync: registrosPendientesSync,
                ultimaSync: ultimaSync,
                syncAnimationController: _syncAnimationController,
                onSyncPressed: _sincronizarDatos,
                formatearTiempo: _formatearTiempoTranscurrido,
              ),
              const SizedBox(height: 20),
              QuickStatsBar(
                totalAnimales: totalAnimales,
                animalesActivos: animalesActivos,
                alertas: alertasSanitarias,
                onStatTap: _verInventario,
              ),
              const SizedBox(height: 24),
              _buildSectionTitle('Acciones Principales', theme),
              PrimaryActionCard(
                icon: Icons.nfc,
                title: 'Escanear Arete (NFC)',
                subtitle: 'Identifica un animal rápidamente',
                gradientStart: theme.colorScheme.primary,
                gradientEnd: theme.colorScheme.primaryContainer,
                onTap: () => _onActionTap(_scanNFC),
                showPulse: true,
              ),
              PrimaryActionCard(
                icon: Icons.event_note,
                title: 'Registrar Evento',
                subtitle: 'Vacunas, pesajes, tratamientos, etc.',
                gradientStart: theme.colorScheme.secondary,
                gradientEnd: theme.colorScheme.secondaryContainer,
                onTap: () => _onActionTap(_registrarEvento),
              ),
              PrimaryActionCard(
                icon: Icons.inventory_2,
                title: 'Ver Inventario',
                subtitle: 'Consulta todo tu ganado',
                gradientStart: theme.colorScheme.tertiary,
                gradientEnd: theme.colorScheme.tertiary.withValues(alpha: 0.8),
                onTap: () => _onActionTap(_verInventario),
              ),
              const SizedBox(height: 24),
              _buildSectionTitle('Herramientas Secundarias', theme),
              // Placeholder for secondary tools
              _buildSecondaryTool(Icons.bar_chart, 'Reportes', () {}),
              _buildSecondaryTool(Icons.medication, 'Botiquín', () {}),
              _buildSecondaryTool(
                Icons.flight,
                'Reporte Aéreo (Dron + IA)',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AerialReportScreen(),
                    ),
                  );
                },
              ),
              // Espacio adicional para evitar que el SnackBar se salga de pantalla
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _registrarAnimal,
        backgroundColor: theme.colorScheme.secondary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.home), onPressed: () {}),
            IconButton(
              icon: const Icon(Icons.bug_report),
              tooltip: 'Debug',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SyncDebugScreenSimple(
                      syncService: _syncService!,
                      authService: RepositoryProvider.of<AuthService>(context),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getGreeting(),
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Bienvenido a SIREGA', style: theme.textTheme.bodyMedium),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const ProfileScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  // Animación tipo "gota" que sale del avatar
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return ClipPath(
                        clipper: CircularRevealClipper(
                          fraction: animation.value,
                          // Posición aproximada del avatar (esquina superior derecha)
                          centerOffset: Offset(
                            MediaQuery.of(context).size.width - 40,
                            80, // Ajusta esto si el avatar está más arriba/abajo
                          ),
                          minRadius: 25.0, // Radio inicial (tamaño del avatar)
                        ),
                        child: child,
                      );
                    },
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 600),
                reverseTransitionDuration: const Duration(milliseconds: 400),
              ),
            );
          },
          child: Hero(
            tag: 'profile_avatar',
            child: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child: Icon(Icons.person, color: theme.colorScheme.onPrimary),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSecondaryTool(IconData icon, String title, VoidCallback onTap) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
