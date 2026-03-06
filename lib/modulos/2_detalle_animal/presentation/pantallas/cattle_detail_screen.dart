import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/detail_tab_content.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/custom_sliver_header.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/delete_animal_dialog.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/pantallas/editar_animal/editar_animal_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

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
            surface: AppColors.background,
          ),
        ),
        child: BlocListener<CattleDetailBloc, CattleDetailState>(
          listenWhen: (previous, current) => current is CattleDetailActionState,
          listener: (context, state) {
            if (state is ShowInfoSnackbar) {
              try {
                final scaffoldMessenger = ScaffoldMessenger.maybeOf(context);
                if (scaffoldMessenger != null) {
                  scaffoldMessenger.showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      behavior: SnackBarBehavior.fixed,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              } catch (e) {
                debugPrint('Error mostrando snackbar: ${state.message}');
              }
            }
            if (state is AnimalDeactivationSuccess) {
              Navigator.of(context).pop(); // Pop after successful deactivation
            }
            if (state is NavigateToEditScreen) {
              final bloc = context.read<CattleDetailBloc>();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditarAnimalScreen(animal: state.animal),
                ),
              ).then((result) {
                if (result != null && result is Animal) {
                  // Recargar los detalles del animal actualizado
                  bloc.add(LoadCattleDetail(result.id));
                }
              });
            }
          },
          child: Scaffold(
              extendBodyBehindAppBar: true,
            backgroundColor: AppColors.background,
            body: BlocBuilder<CattleDetailBloc, CattleDetailState>(
              buildWhen: (previous, current) => current is! CattleDetailActionState,
              builder: (context, state) {
                if (state is CattleDetailLoading || state is CattleDetailInitial) {
                  return _buildLoadingState();
                }
                if (state is CattleDetailError) {
                  return _buildErrorState(state.message);
                }
                if (state is CattleDetailLoaded) {
                  return _buildLoadedBody(context, state.animal);
                }
                return const SizedBox.shrink(); // Should not happen
              },
            ),
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
            Theme.of(context).primaryColor.withAlpha(26), // withOpacity(0.1)
            Theme.of(context).primaryColor.withAlpha(13), // withOpacity(0.05)
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
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).primaryColor.withAlpha(51), // withOpacity(0.2)
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
                      color: Theme.of(context).primaryColor.withAlpha(153), // withOpacity(0.6)
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
            AppColors.error.withValues(alpha: 0.1),
            AppColors.warning.withValues(alpha: 0.1),
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
                        color: AppColors.surface,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.error.withAlpha(51), // withOpacity(0.2)
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.error_outline,
                        size: 50,
                        color: AppColors.error,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Text(
                '¡Ups! Algo salió mal',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.error,
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
                  backgroundColor: AppColors.error,
                  foregroundColor: AppColors.surface,
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

            if (direction == ScrollDirection.idle) {
              if (scrollOffset > 0 && scrollOffset < expandedHeight) {
                final double snapThreshold = expandedHeight * 0.5;

                if (scrollOffset > snapThreshold) {
                  _scrollController.animateTo(
                    expandedHeight,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                } else {
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
                  top: false,
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
        _buildActionButton(Icons.edit_rounded, () => _editAnimal(context, animal)),
        _buildActionButton(Icons.share_rounded, () => _shareAnimal(context, animal)),
        _buildActionButton(Icons.more_vert_rounded, () => _showMoreOptions(context, animal)),
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
        color: AppColors.textPrimary.withValues(alpha: 0.2), // withOpacity(0.2)
        shape: const CircleBorder(),
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.pop(context);
          },
          customBorder: const CircleBorder(),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_rounded, color: AppColors.surface, size: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Material(
        color: AppColors.textPrimary.withValues(alpha: 0.2), // withOpacity(0.2)
        shape: const CircleBorder(),
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            onPressed();
          },
          customBorder: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: AppColors.surface, size: 24),
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
          labelColor: AppColors.surface,
          unselectedLabelColor: AppColors.textSecondary,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 12),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              Icons.medical_services_rounded,
              AppColors.warning,
              () => _registerEvent(context, animal),
              'Registrar Evento',
            ),
            const SizedBox(height: 12),
            _buildMainFAB(
              Icons.add_a_photo_rounded,
              Theme.of(context).primaryColor,
              () => _addPhoto(context, animal),
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
                    color: color.withAlpha(102), // withOpacity(0.4)
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
                  child: Icon(icon, color: AppColors.surface, size: 24),
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
              color.withAlpha(204), // withOpacity(0.8)
            ],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(102), // withOpacity(0.4)
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
            child: Icon(icon, color: AppColors.surface, size: 28),
          ),
        ),
      ),
    );
  }

  // --- Métodos de Acción Refactorizados ---
  // Ahora solo envían eventos al BLoC.

  void _editAnimal(BuildContext context, Animal animal) {
    HapticFeedback.mediumImpact();
    context.read<CattleDetailBloc>().add(EditAnimalClicked(animal));
  }

  void _shareAnimal(BuildContext context, Animal animal) {
    HapticFeedback.mediumImpact();
    context.read<CattleDetailBloc>().add(ShareAnimalClicked(animal));
  }

  void _showMoreOptions(BuildContext context, Animal animal) {
    HapticFeedback.mediumImpact();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (modalContext) => Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
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
                color: AppColors.divider,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            _buildOptionTile(
              Icons.print_rounded,
              'Imprimir ficha',
              AppColors.info,
              () => _printAnimalCard(context, animal),
            ),
            _buildOptionTile(
              Icons.qr_code_rounded,
              'Generar código QR',
              AppColors.secondary,
              () => _generateQRCode(context, animal),
            ),
            _buildOptionTile(
              Icons.archive_rounded,
              'Archivar',
              AppColors.textHint,
              () => _archiveAnimal(context, animal),
            ),
            const Divider(height: 1),
            _buildOptionTile(
              Icons.delete_rounded,
              'Eliminar',
              AppColors.error,
              () => _deleteAnimal(context, animal),
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
          Navigator.pop(context); // Cierra el BottomSheet
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
                  color: color.withValues(alpha: 0.1), // withOpacity(0.1)
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
                  color: color == AppColors.error ? AppColors.error : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  

  void _registerEvent(BuildContext context, Animal animal) {
    context.read<CattleDetailBloc>().add(RegisterEventClicked(animal));
  }

  void _addPhoto(BuildContext context, Animal animal) {
    context.read<CattleDetailBloc>().add(AddPhotoClicked(animal));
  }

  void _printAnimalCard(BuildContext context, Animal animal) {
    context.read<CattleDetailBloc>().add(PrintAnimalCardClicked(animal));
  }

  void _generateQRCode(BuildContext context, Animal animal) {
    context.read<CattleDetailBloc>().add(GenerateQRCodeClicked(animal));
  }

  void _archiveAnimal(BuildContext context, Animal animal) {
    context.read<CattleDetailBloc>().add(ArchiveAnimalClicked(animal));
  }

  void _deleteAnimal(BuildContext context, Animal animal) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<CattleDetailBloc>(),
        child: DeleteAnimalDialog(animal: animal),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height + 24; // +24 para el padding vertical (12 + 12)

  @override
  double get maxExtent => _tabBar.preferredSize.height + 24;

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
                    color: AppColors.textPrimary.withValues(alpha: 0.05), // withOpacity(0.05)
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: _tabBar,
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => false;
}