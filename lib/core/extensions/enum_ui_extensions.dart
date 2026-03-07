import 'package:flutter/material.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

// ─── EstadoSalud ────────────────────────────────────────

extension EstadoSaludUI on EstadoSalud {
  String get displayName => switch (this) {
    EstadoSalud.sano => 'Sano',
    EstadoSalud.enfermo => 'Enfermo',
    EstadoSalud.critico => 'Crítico',
    EstadoSalud.convaleciente => 'Convaleciente',
    EstadoSalud.enTratamiento => 'En Tratamiento',
    EstadoSalud.enObservacion => 'En Observación',
  };

  IconData get icon => switch (this) {
    EstadoSalud.sano => Icons.check_circle_outline,
    EstadoSalud.enfermo => Icons.sick_outlined,
    EstadoSalud.critico => Icons.warning_amber_rounded,
    EstadoSalud.convaleciente => Icons.health_and_safety_outlined,
    EstadoSalud.enTratamiento => Icons.medical_services_outlined,
    EstadoSalud.enObservacion => Icons.visibility_outlined,
  };

  Color get color => switch (this) {
    EstadoSalud.sano => Colors.green,
    EstadoSalud.enfermo => Colors.orange,
    EstadoSalud.critico => Colors.red,
    EstadoSalud.convaleciente => Colors.blue,
    EstadoSalud.enTratamiento => Colors.purple,
    EstadoSalud.enObservacion => Colors.grey,
  };
}

// ─── EstadoAnimal ───────────────────────────────────────

extension EstadoAnimalUI on EstadoAnimal {
  String get displayName => switch (this) {
    EstadoAnimal.activo => 'Activo',
    EstadoAnimal.vendido => 'Vendido',
    EstadoAnimal.muerto => 'Muerto',
    EstadoAnimal.perdido => 'Perdido',
    EstadoAnimal.enfermo => 'Enfermo',
    EstadoAnimal.cuarentena => 'Cuarentena',
    EstadoAnimal.prestado => 'Prestado',
    EstadoAnimal.enTransito => 'En Tránsito',
  };

  IconData get icon => switch (this) {
    EstadoAnimal.activo => Icons.check_circle_outline,
    EstadoAnimal.vendido => Icons.sell_outlined,
    EstadoAnimal.muerto => Icons.cancel_outlined,
    EstadoAnimal.perdido => Icons.search_off,
    EstadoAnimal.enfermo => Icons.sick_outlined,
    EstadoAnimal.cuarentena => Icons.shield_outlined,
    EstadoAnimal.prestado => Icons.swap_horiz,
    EstadoAnimal.enTransito => Icons.local_shipping_outlined,
  };

  Color get color => switch (this) {
    EstadoAnimal.activo => Colors.green,
    EstadoAnimal.vendido => Colors.blue,
    EstadoAnimal.muerto => Colors.red,
    EstadoAnimal.perdido => Colors.orange,
    EstadoAnimal.enfermo => Colors.deepOrange,
    EstadoAnimal.cuarentena => Colors.amber,
    EstadoAnimal.prestado => Colors.teal,
    EstadoAnimal.enTransito => Colors.indigo,
  };
}

// ─── EstadoReproductivo ─────────────────────────────────

extension EstadoReproductivoUI on EstadoReproductivo {
  String get displayName => switch (this) {
    EstadoReproductivo.virgen => 'Virgen',
    EstadoReproductivo.servida => 'Servida',
    EstadoReproductivo.gestante => 'Gestante',
    EstadoReproductivo.lactante => 'Lactante',
    EstadoReproductivo.seca => 'Seca',
    EstadoReproductivo.descarte => 'Descarte',
    EstadoReproductivo.reproductorActivo => 'Reproductor Activo',
    EstadoReproductivo.reproductorInactivo => 'Reproductor Inactivo',
  };

  IconData get icon => switch (this) {
    EstadoReproductivo.virgen => Icons.spa_outlined,
    EstadoReproductivo.servida => Icons.favorite_outline,
    EstadoReproductivo.gestante => Icons.pregnant_woman,
    EstadoReproductivo.lactante => Icons.water_drop_outlined,
    EstadoReproductivo.seca => Icons.wb_sunny_outlined,
    EstadoReproductivo.descarte => Icons.cancel_outlined,
    EstadoReproductivo.reproductorActivo => Icons.male,
    EstadoReproductivo.reproductorInactivo => Icons.male,
  };

  Color get color => switch (this) {
    EstadoReproductivo.virgen => AppColors.info,
    EstadoReproductivo.servida => Colors.pink,
    EstadoReproductivo.gestante => Colors.purple,
    EstadoReproductivo.lactante => Colors.teal,
    EstadoReproductivo.seca => Colors.orange,
    EstadoReproductivo.descarte => AppColors.error,
    EstadoReproductivo.reproductorActivo => AppColors.success,
    EstadoReproductivo.reproductorInactivo => AppColors.textHint,
  };
}

// ─── Sexo ───────────────────────────────────────────────

extension SexoUI on Sexo {
  String get displayName => switch (this) {
    Sexo.macho => 'Macho',
    Sexo.hembra => 'Hembra',
    Sexo.castrado => 'Castrado',
  };

  IconData get icon => switch (this) {
    Sexo.macho => Icons.male,
    Sexo.hembra => Icons.female,
    Sexo.castrado => Icons.content_cut,
  };

  Color get color => switch (this) {
    Sexo.macho => AppColors.info,
    Sexo.hembra => AppColors.error,
    Sexo.castrado => AppColors.textHint,
  };
}
