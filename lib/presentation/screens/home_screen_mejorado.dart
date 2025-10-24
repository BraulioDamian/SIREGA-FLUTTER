// lib/presentation/screens/home_screen_mejorado.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/presentation/screens/agregar_animal/agregar_animal_screen.dart';

import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'dart:async';

// Import the new widgets
import 'package:sirega_app/presentation/widgets/home/quick_stats_bar.dart';
import 'package:sirega_app/presentation/widgets/home/primary_action_card.dart';
import 'package:sirega_app/presentation/widgets/home/sync_status_card.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentacion/pantallas/cattle_list_screen.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/presentation/screens/escaneo_nfc_screen.dart';


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
    if (isarService == null) return;
    try {
      final animales = await isarService!.obtenerTodosLosAnimales();
      if (mounted) {
        setState(() {
          totalAnimales = animales.length;
          animalesActivos =
              animales.where((a) => a.estado == EstadoAnimal.activo).length;
          // Placeholder data
          alertasSanitarias = 3;
          registrosPendientesSync = 12;
        });
      }
    } catch (e) {
      debugPrint('Error cargando datos: $e');
    }
  }

  Future<void> _sincronizarDatos() async {
    if (sincronizando) return;

    setState(() => sincronizando = true);
    _syncAnimationController.repeat();

    try {
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) {
        setState(() {
          ultimaSync = DateTime.now();
          registrosPendientesSync = 0;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Sincronización completada'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.fixed,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Error al sincronizar: $e'),
            backgroundColor: Colors.red,
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
    // TODO: Navigate to event registration screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Función no implementada'),
        behavior: SnackBarBehavior.fixed,
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                formatearTiempo: (dt) => 'hace 5 min', // Placeholder
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
                gradientStart: theme.primaryColor,
                gradientEnd: theme.primaryColorDark,
                onTap: () => _onActionTap(_scanNFC),
                showPulse: true,
              ),
              PrimaryActionCard(
                icon: Icons.event_note,
                title: 'Registrar Evento',
                subtitle: 'Vacunas, pesajes, tratamientos, etc.',
                gradientStart: Colors.blue,
                gradientEnd: Colors.blue.shade800,
                onTap: () => _onActionTap(_registrarEvento),
              ),
              PrimaryActionCard(
                icon: Icons.inventory_2,
                title: 'Ver Inventario',
                subtitle: 'Consulta todo tu ganado',
                gradientStart: Colors.orange,
                gradientEnd: Colors.orange.shade800,
                onTap: () => _onActionTap(_verInventario),
              ),
              const SizedBox(height: 24),
              _buildSectionTitle('Herramientas Secundarias', theme),
              // Placeholder for secondary tools
              _buildSecondaryTool(Icons.bar_chart, 'Reportes', () {}),
              _buildSecondaryTool(Icons.medication, 'Botiquín', () {}),
              // Espacio adicional para evitar que el SnackBar se salga de pantalla
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _registrarAnimal,
        backgroundColor: theme.primaryColor,
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
            IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getGreeting(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            Text(
              'Bienvenido a SIREGA',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
        const CircleAvatar(
          child: Icon(Icons.person),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSecondaryTool(IconData icon, String title, VoidCallback onTap) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}