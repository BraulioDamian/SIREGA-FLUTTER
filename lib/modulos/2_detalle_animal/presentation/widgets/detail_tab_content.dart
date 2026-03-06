import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/tabs/general_tab.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/tabs/health_tab.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/tabs/reproduction_tab.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/tabs/production_tab.dart';

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
    final padding = _getListPadding();

    switch (tabType) {
      case TabType.general:
        return GeneralTab(animal: animal, padding: padding);
      case TabType.health:
        return HealthTab(animal: animal, padding: padding);
      case TabType.reproduction:
        return ReproductionTab(animal: animal, padding: padding);
      case TabType.production:
        return ProductionTab(animal: animal, padding: padding);
    }
  }

  EdgeInsets _getListPadding() {
    return EdgeInsets.fromLTRB(
      16,
      24,
      16,
      // Padding dinámico para que la lista empiece con espacio desde arriba
      // y no sea tapada por el FAB ni el bottom navbar al final
      _calculateDynamicPadding(),
    );
  }

  double _calculateDynamicPadding() {
    // Si estamos en portrait, dejamos espacio para el bottom navbar (si lo hay)
    if (isPortrait) {
      return 100.0;
    }
    // En landscape, el bottom navbar no ocupa tanto espacio vertical
    return 30.0;
  }
}
