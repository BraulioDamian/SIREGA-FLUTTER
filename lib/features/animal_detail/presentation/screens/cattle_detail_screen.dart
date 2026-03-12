import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/services/isar_service.dart';
import 'package:sirega_app/features/animal_detail/presentation/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/detail_tab_content.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/custom_sliver_header.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/delete_animal_dialog.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/detail_loading_state.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/detail_error_state.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/detail_floating_buttons.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/detail_action_sheets.dart';
import 'package:sirega_app/features/animal_detail/presentation/screens/editar_animal/edit_animal_screen.dart';
import 'package:sirega_app/features/event_registration/presentation/screens/select_event_type_screen.dart';
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

  late Animation<double> _floatingButtonAnimation;

  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  final ValueNotifier<double> _scrollOffsetNotifier = ValueNotifier(0.0);

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
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _floatingButtonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _floatingButtonController,
        curve: Curves.easeOutBack,
      ),
    );
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
      _scrollOffsetNotifier.value = _scrollController.offset;
      final scrolled = _scrollController.offset > 50;
      if (scrolled != _isScrolled) {
        setState(() => _isScrolled = scrolled);
      }
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
    _scrollOffsetNotifier.dispose();
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
          colorScheme: Theme.of(
            context,
          ).colorScheme.copyWith(surface: AppColors.background),
        ),
        child: BlocListener<CattleDetailBloc, CattleDetailState>(
          listenWhen: (previous, current) => current is CattleDetailActionState,
          listener: _handleBlocAction,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: AppColors.background,
            body: BlocBuilder<CattleDetailBloc, CattleDetailState>(
              buildWhen: (previous, current) =>
                  current is! CattleDetailActionState,
              builder: (context, state) {
                if (state is CattleDetailLoading ||
                    state is CattleDetailInitial) {
                  return const DetailLoadingState();
                }
                if (state is CattleDetailError) {
                  return DetailErrorState(message: state.message);
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

  Widget _buildLoadedBody(BuildContext context, Animal animal) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            final double scrollOffset = _scrollController.offset;
            final double maxExtent = _scrollController.position.maxScrollExtent;

            if (direction == ScrollDirection.idle) {
              // Only snap when header is partially visible, not fully collapsed
              if (scrollOffset > 0 && scrollOffset < maxExtent) {
                final double snapThreshold = maxExtent * 0.5;

                if (scrollOffset > snapThreshold) {
                  _scrollController.animateTo(
                    maxExtent,
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
            return false;
          },
          child: NestedScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context,
                      ),
                      sliver: _buildSliverAppBar(
                        context,
                        animal,
                        size,
                        innerBoxIsScrolled,
                      ),
                    ),
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
                      ),
                      DetailTabContent(animal: animal, tabType: TabType.health),
                      DetailTabContent(
                        animal: animal,
                        tabType: TabType.reproduction,
                      ),
                      DetailTabContent(
                        animal: animal,
                        tabType: TabType.production,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (_showFloatingButtons)
          DetailFloatingButtons(
            scaleAnimation: _floatingButtonAnimation,
            onRegisterEvent: () => context.read<CattleDetailBloc>().add(
              RegisterEventClicked(animal),
            ),
            onAddPhoto: () =>
                context.read<CattleDetailBloc>().add(AddPhotoClicked(animal)),
          ),
      ],
    );
  }

  Widget _buildSliverAppBar(
    BuildContext context,
    Animal animal,
    Size size,
    bool innerBoxIsScrolled,
  ) {
    return SliverAppBar(
      expandedHeight: size.height * 0.45,
      pinned: true,
      stretch: true,
      forceElevated: innerBoxIsScrolled,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0,
      leadingWidth: 48,
      leading: const _BackButton(),
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: _isScrolled ? 1.0 : 0.0,
        child: Text(
          animal.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      actions: [
        _AppBarAction(
          icon: Icons.edit_rounded,
          onPressed: () {
            HapticFeedback.mediumImpact();
            context.read<CattleDetailBloc>().add(EditAnimalClicked(animal));
          },
        ),
        _AppBarAction(
          icon: Icons.share_rounded,
          onPressed: () {
            HapticFeedback.mediumImpact();
            context.read<CattleDetailBloc>().add(ShareAnimalClicked(animal));
          },
        ),
        _AppBarAction(
          icon: Icons.more_vert_rounded,
          onPressed: () => _onMoreOptions(context, animal),
        ),
      ],
      flexibleSpace: ValueListenableBuilder<double>(
        valueListenable: _scrollOffsetNotifier,
        builder: (context, scrollOffset, _) {
          return CustomSliverHeader(
            animal: animal,
            scrollOffset: scrollOffset,
            isScrolled: _isScrolled,
            fadeAnimation: _fadeAnimation,
          );
        },
      ),
      bottom: _buildTabBar(context),
    );
  }

  // ── Actions ─────────────────────────────────────────────────────────────

  void _handleBlocAction(BuildContext context, CattleDetailState state) {
    if (state is ShowInfoSnackbar) {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(
          content: Text(state.message),
          behavior: SnackBarBehavior.fixed,
          duration: const Duration(seconds: 2),
        ),
      );
    }
    if (state is AnimalDeactivationSuccess) {
      Navigator.of(context).pop();
    }
    if (state is NavigateToEditScreen) {
      final bloc = context.read<CattleDetailBloc>();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => EditAnimalScreen(animal: state.animal),
        ),
      ).then((result) {
        if (result != null && result is Animal) {
          bloc.add(LoadCattleDetail(result.id));
        }
      });
    }
    if (state is NavigateToRegisterEvent) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SelectEventTypeScreen()),
      );
    }
    if (state is ShowImagePickerBottomSheet) {
      showImageSourceSheet(
        context,
        state.animal,
        context.read<CattleDetailBloc>(),
      );
    }
  }

  void _onMoreOptions(BuildContext context, Animal animal) {
    final bloc = context.read<CattleDetailBloc>();
    showMoreOptionsSheet(
      context,
      animal,
      onPrint: () => bloc.add(PrintAnimalCardClicked(animal)),
      onQR: () => bloc.add(GenerateQRCodeClicked(animal)),
      onArchive: () => bloc.add(ArchiveAnimalClicked(animal)),
      onDelete: () => showDialog(
        context: context,
        builder: (_) => BlocProvider.value(
          value: bloc,
          child: DeleteAnimalDialog(animal: animal),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildTabBar(BuildContext context) {
    final tabBar = TabBar(
      controller: _tabController,
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 0,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.surface.withValues(alpha: 0.2),
      ),
      dividerColor: Colors.transparent,
      labelColor: AppColors.surface,
      unselectedLabelColor: AppColors.surface.withValues(alpha: 0.7),
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      tabs: [
        _TabItem(icon: Icons.info_outline_rounded, label: 'General'),
        _TabItem(icon: Icons.favorite_outline_rounded, label: 'Salud'),
        _TabItem(icon: Icons.child_care_rounded, label: 'Reproducción'),
        _TabItem(icon: Icons.trending_up_rounded, label: 'Producción'),
      ],
    );

    return PreferredSize(
      preferredSize: tabBar.preferredSize,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.85),
        ),
        child: tabBar,
      ),
    );
  }
}

// ── Small private widgets ─────────────────────────────────────────────────

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Material(
        color: AppColors.textPrimary.withValues(alpha: 0.2),
        shape: const CircleBorder(),
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.pop(context);
          },
          customBorder: const CircleBorder(),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.surface,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _AppBarAction({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Material(
        color: AppColors.textPrimary.withValues(alpha: 0.2),
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
}

class _TabItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _TabItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
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
}
