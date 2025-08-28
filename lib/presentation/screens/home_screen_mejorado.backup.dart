// lib/presentation/screens/home_screen_mejorado.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/presentation/screens/register_animal_screen.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';

class HomeScreenMejorado extends StatefulWidget {
  const HomeScreenMejorado({super.key});

  @override
  State<HomeScreenMejorado> createState() => _HomeScreenMejoradoState();
}

class _HomeScreenMejoradoState extends State<HomeScreenMejorado>
    with TickerProviderStateMixin {
  // Controladores de animación
  late AnimationController _animationController;
  late AnimationController _syncAnimationController;
  late Animation<double> _fadeAnimation;

  // Datos del dashboard
  int totalAnimales = 0;
  int animalesActivos = 0;
  int machos = 0;
  int hembras = 0;
  int alertasSanitarias = 0;
  int eventosPendientes = 0;
  int animalesEnfermos = 0;
  double produccionLecheHoy = 0.0;

  // Estado de sincronización
  bool sincronizando = false;
  DateTime? ultimaSync;
  int registrosPendientesSync = 0;

  // Timer para actualización automática
  Timer? _refreshTimer;

  // Controlador de búsqueda
  final _searchController = TextEditingController();
  bool _isSearching = false;

  IsarService? isarService;
  bool _isDataInitialized = false;

  @override
  void initState() {
    super.initState();

    // Inicializar animaciones
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _syncAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();

    // La carga de datos ahora se inicia en didChangeDependencies
    
    // Configurar actualización automática cada 30 segundos
    _refreshTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => _cargarDatos(),
    );
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
    _searchController.dispose();
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _cargarDatos() async {
    if (isarService == null) return;

    try {
      // Cargar todos los animales
      final animales = await isarService!.obtenerTodosLosAnimales();

      if (mounted) {
        setState(() {
          totalAnimales = animales.length;
          animalesActivos =
              animales.where((a) => a.estado == EstadoAnimal.activo).length;
          machos = animales.where((a) => a.sexo == Sexo.macho).length;
          hembras = animales.where((a) => a.sexo == Sexo.hembra).length;

          // TODO: Calcular estos valores desde la BD
          alertasSanitarias = 3; // Placeholder
          eventosPendientes = 5; // Placeholder
          animalesEnfermos = 2; // Placeholder
          produccionLecheHoy = 245.5; // Placeholder
          registrosPendientesSync = 12; // Placeholder
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
      // Simular sincronización
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
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Error al sincronizar: $e'),
            backgroundColor: Colors.red,
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                // App Bar personalizado con búsqueda
                SliverAppBar(
                  expandedHeight: 200,
                  floating: false,
                  pinned: true,
                  elevation: 0,
                  backgroundColor: theme.primaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    title: _isSearching
                        ? _buildSearchField()
                        : const Text('SIREGA',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            theme.primaryColor,
                            theme.primaryColor.withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Patrón de fondo
                          Positioned(
                            right: -50,
                            top: -50,
                            child: Icon(
                              Icons.pets,
                              size: 250,
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                          // Información del header
                          Positioned(
                            left: 20,
                            bottom: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rancho Los Alamos',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Oaxaca, México',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    if (!_isSearching)
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () => setState(() => _isSearching = true),
                      ),
                    if (_isSearching)
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _isSearching = false;
                            _searchController.clear();
                          });
                        },
                      ),
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_outlined,
                              color: Colors.white),
                          onPressed: () => _mostrarNotificaciones(),
                        ),
                        if (alertasSanitarias > 0)
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                '$alertasSanitarias',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onSelected: (value) => _handleMenuOption(value),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'perfil',
                          child: Row(
                            children: [
                              Icon(Icons.person, size: 20),
                              SizedBox(width: 12),
                              Text('Mi Perfil'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'configuracion',
                          child: Row(
                            children: [
                              Icon(Icons.settings, size: 20),
                              SizedBox(width: 12),
                              Text('Configuración'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'ayuda',
                          child: Row(
                            children: [
                              Icon(Icons.help_outline, size: 20),
                              SizedBox(width: 12),
                              Text('Ayuda'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'salir',
                          child: Row(
                            children: [
                              Icon(Icons.logout, size: 20, color: Colors.red),
                              SizedBox(width: 12),
                              Text('Cerrar Sesión',
                                  style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Contenido principal
                SliverToBoxAdapter(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Estado de sincronización
                            _buildSyncStatusCard(),
                            const SizedBox(height: 16),

                            // Tarjetas de resumen
                            _buildSummaryCards(constraints),
                            const SizedBox(height: 20),

                            // Gráfico de distribución
                            _buildChartCard(constraints),
                            const SizedBox(height: 20),

                            // Acciones rápidas
                            _buildQuickActions(),
                            const SizedBox(height: 20),

                            // Alertas y eventos pendientes
                            _buildAlertsSection(),
                            const SizedBox(height: 20),

                            // Actividad reciente
                            _buildRecentActivity(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      // FAB con menú expandible
      floatingActionButton: _buildExpandableFAB(),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _searchController,
        autofocus: true,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Buscar por nombre, arete o ID...',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          suffixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.7)),
        ),
        onSubmitted: (value) => _buscarAnimal(value),
      ),
    );
  }

  Widget _buildSyncStatusCard() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: sincronizando ? Colors.blue[50] : Colors.green[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: sincronizando ? Colors.blue[200]! : Colors.green[200]!,
        ),
      ),
      child: Row(
        children: [
          if (sincronizando)
            RotationTransition(
              turns: _syncAnimationController,
              child: const Icon(Icons.sync, color: Colors.blue),
            )
          else
            Icon(
              registrosPendientesSync > 0
                  ? Icons.sync_problem
                  : Icons.check_circle,
              color:
                  registrosPendientesSync > 0 ? Colors.orange : Colors.green,
            ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sincronizando
                      ? 'Sincronizando...'
                      : registrosPendientesSync > 0
                          ? '$registrosPendientesSync registros pendientes'
                          : 'Todo sincronizado',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (ultimaSync != null)
                  Text(
                    'Última sync: ${_formatearTiempo(ultimaSync!)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: sincronizando ? null : _sincronizarDatos,
            icon: const Icon(Icons.refresh, size: 18),
            label: const Text('Sincronizar'),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards(BoxConstraints constraints) {
    final crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
    final childAspectRatio = constraints.maxWidth > 600 ? 1.2 : 1.5;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: childAspectRatio,
      children: [
        _buildMetricCard(
          title: 'Total Animales',
          value: totalAnimales.toString(),
          subtitle: '$animalesActivos activos',
          icon: Icons.pets,
          color: Colors.blue,
          trend: '+2',
          trendUp: true,
        ),
        _buildMetricCard(
          title: 'Alertas Sanitarias',
          value: alertasSanitarias.toString(),
          subtitle: '$eventosPendientes pendientes',
          icon: Icons.warning_amber,
          color: Colors.orange,
          trend: '-1',
          trendUp: false,
        ),
        _buildMetricCard(
          title: 'Producción Hoy',
          value: '${produccionLecheHoy.toStringAsFixed(1)} L',
          subtitle: 'Leche recolectada',
          icon: Icons.water_drop,
          color: Colors.green,
          trend: '+5%',
          trendUp: true,
        ),
        _buildMetricCard(
          title: 'Estado Sanitario',
          value: animalesActivos > 0
              ? '${((animalesActivos - animalesEnfermos) / animalesActivos * 100).toStringAsFixed(0)}%'
              : '100%',
          subtitle: '$animalesEnfermos enfermos',
          icon: Icons.health_and_safety,
          color: animalesEnfermos > 0 ? Colors.red : Colors.teal,
          trend: animalesEnfermos > 0 ? '$animalesEnfermos' : 'OK',
          trendUp: animalesEnfermos == 0,
        ),
      ],
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
    String? trend,
    bool trendUp = true,
  }) {
    return Container(
      padding: const EdgeInsets.all(12), // Reduced padding slightly
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              if (trend != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: trendUp ? Colors.green[50] : Colors.red[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        trendUp ? Icons.trending_up : Icons.trending_down,
                        size: 12,
                        color: trendUp ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        trend,
                        style: TextStyle(
                          fontSize: 11,
                          color: trendUp ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8), // Added a fixed space
          Expanded( // Use Expanded to allow content to take available space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              children: [
                FittedBox( // Ensures text scales down if too large
                  fit: BoxFit.scaleDown,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 22, // Slightly reduced font size
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    maxLines: 1, // Ensure it stays on one line
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[500],
            ),
            maxLines: 1, // Ensure it stays on one line
            overflow: TextOverflow.ellipsis, // Add ellipsis if overflows
          ),
        ],
      ),
    );
  }

  Widget _buildChartCard(BoxConstraints constraints) {
    return Container(
      height: constraints.maxHeight * 0.3,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Distribución del Ganado',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: machos.toDouble(),
                    title: totalAnimales > 0
                        ? '${(machos / totalAnimales * 100).toStringAsFixed(0)}%'
                        : '0%',
                    color: Colors.blue[400],
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    value: hembras.toDouble(),
                    title: totalAnimales > 0
                        ? '${(hembras / totalAnimales * 100).toStringAsFixed(0)}%'
                        : '0%',
                    color: Colors.pink[300],
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
                sectionsSpace: 2,
                centerSpaceRadius: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Acciones Rápidas',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActionChip(
              icon: Icons.add_circle_outline,
              label: 'Registrar Animal',
              onTap: () => _registrarAnimal(),
            ),
            _buildActionChip(
              icon: Icons.event_note,
              label: 'Registrar Evento',
              onTap: () => _registrarEvento(),
            ),
            _buildActionChip(
              icon: Icons.list_alt,
              label: 'Ver Inventario',
              onTap: () => _verInventario(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionChip({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: Theme.of(context).primaryColor, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAlertsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Alertas y Eventos',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _buildAlertCard(
          title: 'Vacunación pendiente',
          subtitle: 'Lote 5 - Fiebre aftosa',
          date: DateTime.now().add(const Duration(days: 3)),
          type: 'Vacunación',
          color: Colors.orange,
        ),
        const SizedBox(height: 8),
        _buildAlertCard(
          title: 'Revisión veterinaria',
          subtitle: 'Animal ID: 12345 - Cojera',
          date: DateTime.now().add(const Duration(days: 1)),
          type: 'Salud',
          color: Colors.red,
        ),
      ],
    );
  }

  Widget _buildAlertCard({
    required String title,
    required String subtitle,
    required DateTime date,
    required String type,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: color, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${date.day}/${date.month}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                type,
                style: TextStyle(fontSize: 11, color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    // Placeholder
    return const SizedBox.shrink();
  }

  Widget _buildExpandableFAB() {
    // Placeholder
    return FloatingActionButton(
      onPressed: () => _registrarAnimal(),
      child: const Icon(Icons.add),
    );
  }

  // --- Lógica de navegación y acciones ---

  void _registrarAnimal() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterAnimalScreen()),
    );
  }

  void _registrarEvento() {
    // TODO: Navegar a la pantalla de registro de eventos
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Función no implementada')),
    );
  }

  void _verInventario() {
    // TODO: Navegar a la pantalla de inventario
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Función no implementada')),
    );
  }

  void _buscarAnimal(String query) {
    // TODO: Implementar lógica de búsqueda
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Buscando: $query')),
    );
  }

  void _mostrarNotificaciones() {
    // TODO: Mostrar panel de notificaciones
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Función no implementada')),
    );
  }

  void _handleMenuOption(String value) {
    switch (value) {
      case 'perfil':
        // TODO
        break;
      case 'configuracion':
        // TODO
        break;
      case 'ayuda':
        // TODO
        break;
      case 'salir':
        // TODO
        break;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opción seleccionada: $value')),
    );
  }

  String _formatearTiempo(DateTime dt) {
    final now = DateTime.now();
    final difference = now.difference(dt);

    if (difference.inSeconds < 60) {
      return 'hace un momento';
    } else if (difference.inMinutes < 60) {
      return 'hace ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'hace ${difference.inHours} h';
    } else {
      return '${dt.day}/${dt.month}/${dt.year}';
    }
  }
}
