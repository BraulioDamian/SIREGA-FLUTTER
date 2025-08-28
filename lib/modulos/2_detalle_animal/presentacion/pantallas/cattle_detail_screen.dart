import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/widgets/detail_tab_content.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/widgets/custom_sliver_header.dart';
import 'package:flutter/rendering.dart';

class CattleDetailScreen extends StatefulWidget {
  final int id;
  const CattleDetailScreen({super.key, required this.id});

  @override
  State<CattleDetailScreen> createState() => _CattleDetailScreenState();
}

class _CattleDetailScreenState extends State<CattleDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late AnimationController _floatingButtonController;
  
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _floatingButtonAnimation;
  
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  double _scrollOffset = 0.0;
  double _scrollPercentage = 0.0;
  bool _showFloatingButtons = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _setupAnimations();
    _startAnimations();
    _setupListeners();
  }

  void _initializeControllers() {
    _tabController = TabController(length: 4, vsync: this);
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _floatingButtonController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void _setupAnimations() {
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));
    
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));
    
    _floatingButtonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _floatingButtonController,
      curve: Curves.easeOutBack,
    ));
  }

  void _startAnimations() {
    _fadeController.forward();
    _slideController.forward();
    _scaleController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _floatingButtonController.forward();
        setState(() => _showFloatingButtons = true);
      }
    });
  }

  void _setupListeners() {
    _scrollController.addListener(() {
      final size = MediaQuery.of(context).size;
      final double expandedHeight = size.height * 0.45;
      
      setState(() {
        _scrollOffset = _scrollController.offset;
        _isScrolled = _scrollController.offset > 50;
        
        // Calcular el porcentaje de scroll (0.0 = completamente expandido, 1.0 = completamente contraído)
        _scrollPercentage = (_scrollController.offset / expandedHeight).clamp(0.0, 1.0);
      });
    });
    
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        HapticFeedback.selectionClick();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    _floatingButtonController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CattleDetailBloc>(
      create: (context) => CattleDetailBloc(
        isarService: RepositoryProvider.of<IsarService>(context),
      )..add(LoadCattleDetail(widget.id)),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            surface: Colors.grey[50],
          ),
        ),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.grey[50],
          body: BlocBuilder<CattleDetailBloc, CattleDetailState>(
            builder: (context, state) {
              if (state is CattleDetailLoading) {
                return _buildLoadingState();
              }
              if (state is CattleDetailError) {
                return _buildErrorState(state.message);
              }
              if (state is CattleDetailLoaded) {
                return _buildLoadedBody(context, state.animal);
              }
              return _buildLoadingState();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).primaryColor.withOpacity(0.05),
          ],
        ),
      ),
      child: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 1),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).primaryColor.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Cargando información',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Por favor espere...',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.red.shade50,
            Colors.orange.shade50,
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 600),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.error_outline,
                        size: 50,
                        color: Colors.red.shade400,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Text(
                '¡Ups! Algo salió mal',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.red.shade600,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('Regresar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedBody(BuildContext context, Animal animal) {
    final size = MediaQuery.of(context).size;
    final double expandedHeight = size.height * 0.45;
    
    return Stack(
      children: [
        NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            final double scrollOffset = _scrollController.offset;

            // Only trigger snap scrolling when the user has stopped scrolling
            if (direction == ScrollDirection.idle) {
              // Check if the scroll offset is within the expandable area
              if (scrollOffset > 0 && scrollOffset < expandedHeight) {
                // Define the snap point (e.g., 50% of the expandable area)
                final double snapThreshold = expandedHeight * 0.5;

                if (scrollOffset > snapThreshold) {
                  // If past the threshold, snap to fully collapsed
                  _scrollController.animateTo(
                    expandedHeight, // Animate to the end of the sliver's extent
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                } else {
                  // If before the threshold, snap to fully expanded
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                }
              }
            }
            return true;
          },
          child: NestedScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                _buildSliverAppBar(context, animal, size),
                _buildSliverTabBar(context),
              ];
            },
            body: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SafeArea(
                  top: false,  // Cambiado a false para evitar padding adicional
                  bottom: false,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      DetailTabContent(
                        animal: animal,
                        tabType: TabType.general,
                        scaleAnimation: _scaleAnimation,
                        isScrolled: _isScrolled,
                        scrollPercentage: _scrollPercentage,
                      ),
                      DetailTabContent(
                        animal: animal,
                        tabType: TabType.health,
                        scaleAnimation: _scaleAnimation,
                        isScrolled: _isScrolled,
                        scrollPercentage: _scrollPercentage,
                      ),
                      DetailTabContent(
                        animal: animal,
                        tabType: TabType.reproduction,
                        scaleAnimation: _scaleAnimation,
                        isScrolled: _isScrolled,
                        scrollPercentage: _scrollPercentage,
                      ),
                      DetailTabContent(
                        animal: animal,
                        tabType: TabType.production,
                        scaleAnimation: _scaleAnimation,
                        isScrolled: _isScrolled,
                        scrollPercentage: _scrollPercentage,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (_showFloatingButtons) _buildFloatingActionButtons(context, animal),
      ],
    );
  }

  Widget _buildSliverAppBar(BuildContext context, Animal animal, Size size) {
    return SliverAppBar(
      expandedHeight: size.height * 0.45,
      pinned: true,
      stretch: true,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      leading: _buildBackButton(context),
      actions: [
        _buildActionButton(Icons.edit_rounded, () => _editAnimal(animal)),
        _buildActionButton(Icons.share_rounded, () => _shareAnimal(animal)),
        _buildActionButton(Icons.more_vert_rounded, () => _showMoreOptions(animal)),
      ],
      flexibleSpace: CustomSliverHeader(
        animal: animal,
        scrollOffset: _scrollOffset,
        isScrolled: _isScrolled,
        fadeAnimation: _fadeAnimation,
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Material(
        color: Colors.black.withOpacity(0.2),
        shape: const CircleBorder(),
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.pop(context);
          },
          customBorder: const CircleBorder(),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Material(
        color: Colors.black.withOpacity(0.2),
        shape: const CircleBorder(),
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            onPressed();
          },
          customBorder: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverTabBar(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverTabBarDelegate(
        TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).primaryColor,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[600],
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 16),
          tabs: [
            _buildTab(Icons.info_outline_rounded, 'General'),
            _buildTab(Icons.favorite_outline_rounded, 'Salud'),
            _buildTab(Icons.child_care_rounded, 'Reproducción'),
            _buildTab(Icons.trending_up_rounded, 'Producción'),
          ],
        ),
      ),
    );
  }

  Tab _buildTab(IconData icon, String label) {
    return Tab(
      height: 48,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButtons(BuildContext context, Animal animal) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: ScaleTransition(
        scale: _floatingButtonAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSmallFAB(
              Icons.qr_code_scanner_rounded,
              Colors.blue,
              () => _scanNFC(animal),
              'Escanear NFC',
            ),
            const SizedBox(height: 12),
            _buildSmallFAB(
              Icons.medical_services_rounded,
              Colors.orange,
              () => _registerEvent(animal),
              'Registrar Evento',
            ),
            const SizedBox(height: 12),
            _buildMainFAB(
              Icons.add_a_photo_rounded,
              Theme.of(context).primaryColor,
              () => _addPhoto(animal),
              'Añadir Foto',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallFAB(IconData icon, Color color, VoidCallback onPressed, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 300),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    onPressed();
                  },
                  customBorder: const CircleBorder(),
                  child: Icon(icon, color: Colors.white, size: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainFAB(IconData icon, Color color, VoidCallback onPressed, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              color.withOpacity(0.8),
            ],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              HapticFeedback.heavyImpact();
              onPressed();
            },
            customBorder: const CircleBorder(),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
        ),
      ),
    );
  }

  // Métodos de acción
  void _editAnimal(Animal animal) {
    HapticFeedback.mediumImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.edit, color: Colors.white),
            SizedBox(width: 12),
            Text('Función de edición próximamente'),
          ],
        ),
        backgroundColor: Colors.orange,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _shareAnimal(Animal animal) {
    HapticFeedback.mediumImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.share, color: Colors.white),
            SizedBox(width: 12),
            Text('Compartiendo información...'),
          ],
        ),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _showMoreOptions(Animal animal) {
    HapticFeedback.mediumImpact();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            _buildOptionTile(
              Icons.print_rounded,
              'Imprimir ficha',
              Colors.blue,
              () => _printAnimalCard(animal),
            ),
            _buildOptionTile(
              Icons.qr_code_rounded,
              'Generar código QR',
              Colors.purple,
              () => _generateQRCode(animal),
            ),
            _buildOptionTile(
              Icons.archive_rounded,
              'Archivar',
              Colors.grey,
              () => _archiveAnimal(animal),
            ),
            const Divider(height: 1),
            _buildOptionTile(
              Icons.delete_rounded,
              'Eliminar',
              Colors.red,
              () => _deleteAnimal(animal),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(IconData icon, String title, Color color, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: color == Colors.red ? Colors.red : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _scanNFC(Animal animal) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            SizedBox(width: 12),
            Text('Iniciando escaneo NFC...'),
          ],
        ),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _registerEvent(Animal animal) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.event_note, color: Colors.white),
            SizedBox(width: 12),
            Text('Abriendo registro de eventos...'),
          ],
        ),
        backgroundColor: Colors.orange,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _addPhoto(Animal animal) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.camera_alt, color: Colors.white),
            SizedBox(width: 12),
            Text('Abriendo cámara...'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _printAnimalCard(Animal animal) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Preparando impresión...'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _generateQRCode(Animal animal) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Generando código QR...'),
        backgroundColor: Colors.purple,
      ),
    );
  }

  void _archiveAnimal(Animal animal) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Animal archivado correctamente'),
        backgroundColor: Colors.grey,
      ),
    );
  }

  void _deleteAnimal(Animal animal) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Icon(Icons.warning_rounded, color: Colors.red.shade400),
            const SizedBox(width: 12),
            const Text('Confirmar eliminación'),
          ],
        ),
        content: Text('¿Está seguro de eliminar a ${animal.nombre}? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<CattleDetailBloc>().add(DeactivateAnimal(animal));
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  
  _SliverTabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height; // Eliminado el espacio extra
  
  @override
  double get maxExtent => _tabBar.preferredSize.height; // Eliminado el espacio extra

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: overlapsContent
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: _tabBar, // Eliminado el padding completamente
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => false;
}
