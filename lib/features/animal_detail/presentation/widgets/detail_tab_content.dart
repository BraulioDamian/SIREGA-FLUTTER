import 'package:flutter/material.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/tabs/general_tab.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/tabs/health_tab.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/tabs/reproduction_tab.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/tabs/production_tab.dart';

enum TabType { general, health, reproduction, production }

class DetailTabContent extends StatelessWidget {
  final Animal animal;
  final TabType tabType;
  final bool isPortrait;

  const DetailTabContent({
    super.key,
    required this.animal,
    required this.tabType,
    this.isPortrait = true,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPad = isPortrait ? 100.0 : 30.0;

    // Builder needed so NestedScrollView.sliverOverlapAbsorberHandleFor
    // gets the correct inner ScrollController context.
    return Builder(
      builder: (context) {
        return CustomScrollView(
          // The key ties each tab to its own scroll position.
          key: PageStorageKey<TabType>(tabType),
          physics: const BouncingScrollPhysics(),
          slivers: [
            // This pushes the content down by the height of pinned headers
            // (collapsed SliverAppBar + TabBar) so it never hides behind them.
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, bottomPad),
              sliver: SliverToBoxAdapter(child: _buildTabChild(context)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTabChild(BuildContext context) {
    switch (tabType) {
      case TabType.general:
        return GeneralTabContent(animal: animal);
      case TabType.health:
        return HealthTabContent(animal: animal);
      case TabType.reproduction:
        return ReproductionTabContent(animal: animal);
      case TabType.production:
        return ProductionTabContent(animal: animal);
    }
  }
}
