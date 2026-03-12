import 'package:flutter/material.dart';

/// Catálogo de vacunas para ganado bovino en México.
/// Basado en campañas oficiales de SENASICA y práctica veterinaria estándar mexicana.
///
/// México está libre de Fiebre Aftosa sin vacunación desde 1954 (OIE/OMSA),
/// por lo que NO se incluye en este catálogo.
class VacunaInfo {
  final String name;
  final bool esAplicacionUnica;
  final int? dayInterval;
  final String description;
  final IconData icono;
  final Color color;
  final String? edadRecomendada;
  final bool esCampanaObligatoria;

  const VacunaInfo({
    required this.name,
    required this.esAplicacionUnica,
    this.dayInterval,
    required this.description,
    this.icono = Icons.vaccines,
    this.color = Colors.blue,
    this.edadRecomendada,
    this.esCampanaObligatoria = false,
  });

  /// Calcula la date de próxima aplicación a partir de la date dada.
  DateTime? proximaAplicacion(DateTime fechaAplicacion) {
    if (esAplicacionUnica || dayInterval == null) return null;
    return fechaAplicacion.add(Duration(days: dayInterval!));
  }

  /// Texto legible del intervalo de aplicación.
  String get intervaloTexto {
    if (esAplicacionUnica) return 'Aplicación única';
    if (dayInterval == null) return 'Según indicación veterinaria';
    if (dayInterval! >= 365) {
      final anios = dayInterval! ~/ 365;
      return anios == 1 ? 'Cada año' : 'Cada $anios años';
    }
    if (dayInterval! >= 30) {
      final meses = dayInterval! ~/ 30;
      return meses == 1 ? 'Cada mes' : 'Cada $meses meses';
    }
    return 'Cada $dayInterval días';
  }
}

/// Catálogo de vacunas bovinas para México.
///
/// Campañas oficiales SENASICA:
///   - Campaña Nacional contra la Brucelosis (NOM-041-ZOO-1995)
///   - Campaña Nacional contra la Tuberculosis Bovina (NOM-031-ZOO-1995)
///   - Campaña Nacional para la Prevención de la Rabia en Bovinos (Derriengue) (NOM-067-ZOO-2007)
///
/// Vacunas de práctica veterinaria común:
///   - Clostridiosis (pierna negra, edema maligno) - polivalente 7 u 8 vías
///   - Complejo Respiratorio Bovino (IBR, DVB, PI3, BRSV)
///   - Leptospirosis
///   - Carbunco bacteridiano (Ántrax) - en zonas endémicas
///   - Anaplasmosis - en trópico húmedo
///   - Babesiosis - en trópico húmedo
class CatalogoVacunas {
  CatalogoVacunas._();

  // ════════════════════════════════════════════════════════════
  // VACUNAS PERIÓDICAS (requieren refuerzos)
  // ════════════════════════════════════════════════════════════

  /// Campaña SENASICA obligatoria en zonas endémicas con murciélagos vampiro.
  /// NOM-067-ZOO-2007. Refuerzo anual.
  static const derriengue = VacunaInfo(
    name: 'Derriengue (Rabia Paralítica)',
    esAplicacionUnica: false,
    dayInterval: 365,
    description:
        'Campaña SENASICA. Prevención de rabia paralítica bovina transmitida por murciélagos vampiro (Desmodus rotundus). Obligatoria en zonas endémicas.',
    color: Color(0xFFF44336),
    edadRecomendada: 'A partir de 3 meses. Refuerzo anual.',
    esCampanaObligatoria: true,
  );

  /// Vacuna polivalente (7 u 8 vías) contra Clostridium.
  /// Previene pierna negra (C. chauvoei), edema maligno (C. septicum),
  /// hepatitis necrótica (C. novyi), enterotoxemia (C. perfringens), etc.
  static const clostridiosis = VacunaInfo(
    name: 'Clostridiosis (Polivalente)',
    esAplicacionUnica: false,
    dayInterval: 180,
    description:
        'Polivalente 7/8 vías contra Clostridium. Previene pierna negra, edema maligno, enterotoxemia, hepatitis necrótica. Primer refuerzo 21 días después de la primera dose.',
    color: Color(0xFF9C27B0),
    edadRecomendada:
        'A partir de 2-3 meses. Refuerzo a los 21 días, luego cada 6 meses.',
  );

  /// Prevención de leptospirosis (5 serovares). Causa abortos,
  /// problemas renales y agalactia. Importante en época de lluvias.
  static const leptospirosis = VacunaInfo(
    name: 'Leptospirosis',
    esAplicacionUnica: false,
    dayInterval: 365,
    description:
        'Prevención de leptospirosis (5 serovares). Causa abortos, problemas renales y baja en producción. Más importante en temporada de lluvias y zonas húmedas.',
    color: Color(0xFF009688),
    edadRecomendada:
        'A partir de 4 meses. Refuerzo anual, idealmente antes de lluvias.',
  );

  /// Complejo Respiratorio Bovino - Vacuna combinada IBR + DVB + PI3 + BRSV.
  /// Muchos laboratorios en México la ofrecen como vacuna única combinada
  /// (ej: Cattlemaster, Bovi-Shield, Express).
  static const complejoRespiratorio = VacunaInfo(
    name: 'Complejo Respiratorio (IBR+DVB+PI3+BRSV)',
    esAplicacionUnica: false,
    dayInterval: 365,
    description:
        'Vacuna combinada contra Rinotraqueítis Infecciosa Bovina (IBR), Diarrea Viral Bovina (DVB), Parainfluenza 3 (PI3) y Virus Sincitial Respiratorio Bovino (BRSV).',
    color: Color(0xFF4CAF50),
    edadRecomendada:
        'A partir de 3-6 meses. Refuerzo a los 21 días, luego anual.',
  );

  /// Carbunco bacteridiano (Bacillus anthracis / Ántrax).
  /// Obligatorio en zonas endémicas de México (Tabasco, Veracruz, Chiapas, etc.).
  static const carbunco = VacunaInfo(
    name: 'Carbunco Bacteridiano (Ántrax)',
    esAplicacionUnica: false,
    dayInterval: 365,
    description:
        'Prevención de Ántrax (Bacillus anthracis). Obligatoria en zonas endémicas del trópico mexicano. Vacuna de cepa Sterne.',
    color: Color(0xFFFF9800),
    edadRecomendada: 'A partir de 3 meses. Refuerzo anual.',
    esCampanaObligatoria: true,
  );

  /// Anaplasmosis bovina - enfermedad transmitida por garrapatas.
  /// Muy común en el trópico húmedo mexicano.
  static const anaplasmosis = VacunaInfo(
    name: 'Anaplasmosis',
    esAplicacionUnica: false,
    dayInterval: 365,
    description:
        'Prevención de Anaplasma marginale, transmitida por garrapatas. Causa anemia severa y muerte súbita. Común en trópico húmedo de México.',
    color: Color(0xFF795548),
    edadRecomendada:
        'Becerros de 3-9 meses (mayor resistencia natural). Refuerzo anual.',
  );

  /// Babesiosis bovina - enfermedad transmitida por garrapata Boophilus.
  /// Endémica en costa del Golfo, Pacífico sur y sureste de México.
  static const babesiosis = VacunaInfo(
    name: 'Babesiosis',
    esAplicacionUnica: false,
    dayInterval: 365,
    description:
        'Prevención de Babesia bovis y B. bigemina, transmitidas por garrapata Rhipicephalus (Boophilus) microplus. Endémica en trópico mexicano.',
    color: Color(0xFF3F51B5),
    edadRecomendada:
        'Becerros de 4-10 meses. Refuerzo anual en zonas endémicas.',
  );

  /// Pasteurelosis / Mannheimiosis - parte del complejo respiratorio
  /// pero a veces se aplica por separado en engordas y corrales.
  static const pasteurelosis = VacunaInfo(
    name: 'Pasteurelosis (Mannheimiosis)',
    esAplicacionUnica: false,
    dayInterval: 180,
    description:
        'Prevención de Mannheimia haemolytica y Pasteurella multocida. Importante en ganado de engorda, corrales de acopio y destetes estresantes.',
    color: Color(0xFF00BCD4),
    edadRecomendada:
        'Al ingreso a corral/engorda o al destete. Refuerzo cada 6 meses.',
  );

  /// Diarrea Neonatal Bovina (Complejo Scours).
  /// Cobertura: Rotavirus, Coronavirus y E. coli.
  /// Se aplica a vacas gestantes para que generen anticuerpos que pasan
  /// al becerro a través del calostro en sus primeras horas de vida.
  static const diarreaNeonatal = VacunaInfo(
    name: 'Diarrea Neonatal (Scours)',
    esAplicacionUnica: false,
    dayInterval: 365,
    description:
        'Rotavirus, Coronavirus y E. coli. Se aplica a vacas gestantes (60 y 30 días antes del parto) para proteger al becerro vía calostro. No protege a la vaca directamente.',
    color: Color(0xFF8D6E63),
    edadRecomendada:
        'Vacas gestantes: 60 y 30 días antes del parto. Refuerzo cada gestación.',
  );

  /// Campylobacteriosis (Vibriosis) - enfermedad venérea bovina.
  /// Campylobacter fetus causa infertilidad y abortos tempranos.
  /// En México se comercializa frecuentemente en combo con Leptospirosis
  /// ("Lepto-Vibrio").
  static const campylobacteriosis = VacunaInfo(
    name: 'Campylobacteriosis (Vibriosis)',
    esAplicacionUnica: false,
    dayInterval: 365,
    description:
        'Prevención de Campylobacter fetus (enfermedad venérea bovina). Causa infertilidad y abortos tempranos. Se aplica 30-60 días antes del empadre o inseminación. Disponible en combo Lepto-Vibrio.',
    color: Color(0xFF5C6BC0),
    edadRecomendada:
        '30-60 días antes de temporada de empadre/inseminación. Refuerzo anual.',
  );

  // ════════════════════════════════════════════════════════════
  // VACUNAS DE APLICACIÓN ÚNICA
  // ════════════════════════════════════════════════════════════

  /// Campaña Nacional contra la Brucelosis - SENASICA.
  /// NOM-041-ZOO-1995. Cepa 19 para becerras de 3-8 meses.
  /// Cepa RB51 puede usarse en hembras adultas no vacunadas previamente.
  static const brucelosisCepa19 = VacunaInfo(
    name: 'Brucelosis (Cepa 19)',
    esAplicacionUnica: true,
    description:
        'Campaña obligatoria SENASICA (NOM-041-ZOO-1995). Cepa clásica S19 para becerras. Dosis única de por vida. Solo hembras.',
    color: Color(0xFFE91E63),
    edadRecomendada: 'Hembras de 3 a 8 meses exclusivamente. Dosis única.',
    esCampanaObligatoria: true,
  );

  /// Cepa RB51 - alternativa para hembras adultas que no fueron vacunadas
  /// con Cepa 19 de becerras.
  static const brucelosisRB51 = VacunaInfo(
    name: 'Brucelosis (Cepa RB51)',
    esAplicacionUnica: true,
    description:
        'Campaña SENASICA. Cepa RB51 para hembras adultas no vacunadas previamente con Cepa 19. No interfiere con pruebas serológicas. Dosis única.',
    color: Color(0xFFAD1457),
    edadRecomendada: 'Hembras adultas no vacunadas previamente. Dosis única.',
    esCampanaObligatoria: true,
  );

  /// Prueba diagnóstica de tuberculosis bovina - NO es vacuna.
  /// Campaña Nacional contra la Tuberculosis Bovina (NOM-031-ZOO-1995).
  /// Se registra como evento sanitario para trazabilidad.
  static const tuberculina = VacunaInfo(
    name: 'Tuberculina (Prueba diagnóstica)',
    esAplicacionUnica: true,
    description:
        'Prueba de tuberculina (PPD bovino). NO es vacuna, es prueba diagnóstica de la Campaña contra Tuberculosis Bovina SENASICA (NOM-031-ZOO-1995). Se registra para trazabilidad.',
    color: Color(0xFF607D8B),
    edadRecomendada: 'A partir de 6 semanas. Requerida para movilización.',
    esCampanaObligatoria: true,
  );

  // ════════════════════════════════════════════════════════════
  // LISTAS AGRUPADAS
  // ════════════════════════════════════════════════════════════

  /// Vacunas que requieren refuerzos peri\u00f3dicos.
  static const List<VacunaInfo> periodicas = [
    derriengue,
    clostridiosis,
    leptospirosis,
    complejoRespiratorio,
    carbunco,
    anaplasmosis,
    babesiosis,
    pasteurelosis,
    diarreaNeonatal,
    campylobacteriosis,
  ];

  /// Vacunas/pruebas de aplicación única.
  static const List<VacunaInfo> unicas = [
    brucelosisCepa19,
    brucelosisRB51,
    tuberculina,
  ];

  /// Todas las vacunas del catalogo.
  static const List<VacunaInfo> todas = [...periodicas, ...unicas];

  /// Busca una vacuna por name en el catalogo.
  /// Retorna null si no se encuentra (vacuna personalizada).
  static VacunaInfo? buscarPorNombre(String name) {
    final nombreLower = name.toLowerCase().trim();
    for (final vacuna in todas) {
      if (vacuna.name.toLowerCase() == nombreLower) return vacuna;
    }
    // Mapeo de nombres legacy/alternativos para compatibilidad
    if (nombreLower.contains('derriengue') ||
        nombreLower == 'rabia' ||
        nombreLower.contains('rabia paralitica')) {
      return derriengue;
    }
    if (nombreLower.contains('clostridi') ||
        nombreLower.contains('pierna negra')) {
      return clostridiosis;
    }
    if (nombreLower.contains('leptospir')) {
      return leptospirosis;
    }
    if (nombreLower.contains('ibr') ||
        nombreLower.contains('dvb') ||
        nombreLower.contains('respiratorio') ||
        nombreLower.contains('pi3')) {
      return complejoRespiratorio;
    }
    if (nombreLower.contains('carbunco') || nombreLower.contains('antrax')) {
      return carbunco;
    }
    if (nombreLower.contains('anaplas')) {
      return anaplasmosis;
    }
    if (nombreLower.contains('babesi')) {
      return babesiosis;
    }
    if (nombreLower.contains('pasteur') || nombreLower.contains('mannheim')) {
      return pasteurelosis;
    }
    if (nombreLower.contains('diarrea neonatal') ||
        nombreLower.contains('scours') ||
        nombreLower.contains('rotavirus')) {
      return diarreaNeonatal;
    }
    if (nombreLower.contains('campylobacter') ||
        nombreLower.contains('vibrio') ||
        nombreLower.contains('lepto-vibrio')) {
      return campylobacteriosis;
    }
    if (nombreLower.contains('brucel') && nombreLower.contains('rb51')) {
      return brucelosisRB51;
    }
    if (nombreLower.contains('brucel')) {
      return brucelosisCepa19;
    }
    if (nombreLower.contains('tubercul')) {
      return tuberculina;
    }
    // Nombres legacy del formulario anterior
    if (nombreLower == 'fiebre aftosa') {
      return null; // Mexico libre de Fiebre Aftosa - no aplica
    }
    return null;
  }

  /// Nombres de todas las vacunas estandar.
  static Set<String> get nombresEstandar => todas.map((v) => v.name).toSet();
}
