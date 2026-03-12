import 'package:sirega_app/nucleo/modelos/enums.dart';

/// Typed DTO for weight records in the animal form.
class WeightRecord {
  final int? isarId;
  final DateTime date;
  final double weightKg;
  final String? notes;

  const WeightRecord({
    this.isarId,
    required this.date,
    required this.weightKg,
    this.notes,
  });
}

/// Typed DTO for milk production records in the animal form.
class MilkRecord {
  final int? isarId;
  final DateTime date;
  final double litersPerDay;
  final String? notes;

  const MilkRecord({
    this.isarId,
    required this.date,
    required this.litersPerDay,
    this.notes,
  });
}

/// Typed DTO for birth/offspring records in the animal form.
class BirthRecord {
  final int? isarId;
  final DateTime date;
  final String? offspringId;
  final Sexo? offspringSex;
  final double? weightKg;
  final String? notes;

  const BirthRecord({
    this.isarId,
    required this.date,
    this.offspringId,
    this.offspringSex,
    this.weightKg,
    this.notes,
  });
}

/// Typed DTO for medical event records in the animal form.
/// Stores TipoEvento directly — no string conversion needed.
class MedicalEventRecord {
  final int? isarId;
  final TipoEvento eventType;
  final DateTime date;
  final String product;
  final String? notes;

  const MedicalEventRecord({
    this.isarId,
    required this.eventType,
    required this.date,
    required this.product,
    this.notes,
  });
}
