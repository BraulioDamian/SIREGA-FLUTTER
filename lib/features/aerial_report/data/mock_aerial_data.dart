/// Datos simulados para la demostración técnica del módulo de Reporte Aéreo.
/// En producción, estos datos vendrían del pipeline dron → YOLO → backend.
class CattleDetection {
  final String id;
  final double latitude;
  final double longitude;
  final int cattleCount;
  final String confidence;
  final DateTime timestamp;
  final String imagePath; // Foto aérea general (sin YOLO boxes)
  final String zoneName;
  final List<DetectedCow> cows; // Recortes individuales de cada vaca detectada

  const CattleDetection({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.cattleCount,
    required this.confidence,
    required this.timestamp,
    required this.imagePath,
    required this.zoneName,
    required this.cows,
  });
}

class DetectedCow {
  final String label;
  final String confidence;
  final String cropPath; // Recorte de la cara/cuerpo de la vaca

  const DetectedCow({
    required this.label,
    required this.confidence,
    required this.cropPath,
  });
}

/// Datos mock: Coordenadas reales del rancho del usuario
class MockAerialData {
  static final DateTime flightTime = DateTime(2026, 3, 5, 7, 30);
  static const double ranchCenterLat = 16.4384;
  static const double ranchCenterLng = -98.1317;
  static const double coveredAreaHa = 120.0;
  static const int totalDetected = 10;

  static final List<CattleDetection> detections = [
    CattleDetection(
      id: 'DET-001',
      latitude: 16.4400,
      longitude: -98.1330,
      cattleCount: 3,
      confidence: '95%',
      timestamp: DateTime(2026, 3, 5, 7, 32),
      imagePath: 'assets/images/demo_drone/aerial_1.png',
      zoneName: 'Potrero Norte',
      cows: [
        DetectedCow(
          label: 'Vaca #1',
          confidence: '96%',
          cropPath: 'assets/images/demo_drone/cow_1.png',
        ),
        DetectedCow(
          label: 'Vaca #2',
          confidence: '94%',
          cropPath: 'assets/images/demo_drone/cow_2.png',
        ),
        DetectedCow(
          label: 'Vaca #3',
          confidence: '95%',
          cropPath: 'assets/images/demo_drone/cow_3.png',
        ),
      ],
    ),
    CattleDetection(
      id: 'DET-002',
      latitude: 16.4370,
      longitude: -98.1300,
      cattleCount: 5,
      confidence: '92%',
      timestamp: DateTime(2026, 3, 5, 7, 35),
      imagePath: 'assets/images/demo_drone/aerial_2.png',
      zoneName: 'Bebedero Central',
      cows: [
        DetectedCow(
          label: 'Vaca #1',
          confidence: '93%',
          cropPath: 'assets/images/demo_drone/cow_2.png',
        ),
        DetectedCow(
          label: 'Vaca #2',
          confidence: '91%',
          cropPath: 'assets/images/demo_drone/cow_1.png',
        ),
        DetectedCow(
          label: 'Vaca #3',
          confidence: '90%',
          cropPath: 'assets/images/demo_drone/cow_3.png',
        ),
        DetectedCow(
          label: 'Vaca #4',
          confidence: '94%',
          cropPath: 'assets/images/demo_drone/cow_1.png',
        ),
        DetectedCow(
          label: 'Vaca #5',
          confidence: '92%',
          cropPath: 'assets/images/demo_drone/cow_2.png',
        ),
      ],
    ),
    CattleDetection(
      id: 'DET-003',
      latitude: 16.4385,
      longitude: -98.1345,
      cattleCount: 2,
      confidence: '97%',
      timestamp: DateTime(2026, 3, 5, 7, 38),
      imagePath: 'assets/images/demo_drone/aerial_3.png',
      zoneName: 'Camino Sur',
      cows: [
        DetectedCow(
          label: 'Vaca #1',
          confidence: '97%',
          cropPath: 'assets/images/demo_drone/cow_3.png',
        ),
        DetectedCow(
          label: 'Vaca #2',
          confidence: '96%',
          cropPath: 'assets/images/demo_drone/cow_1.png',
        ),
      ],
    ),
    CattleDetection(
      id: 'DET-004',
      latitude: 16.4415,
      longitude: -98.1285,
      cattleCount: 4,
      confidence: '89%',
      timestamp: DateTime(2026, 3, 5, 7, 40),
      imagePath: 'assets/images/demo_drone/aerial_1.png',
      zoneName: 'Potrero Este',
      cows: [
        DetectedCow(
          label: 'Vaca #1',
          confidence: '91%',
          cropPath: 'assets/images/demo_drone/cow_2.png',
        ),
        DetectedCow(
          label: 'Vaca #2',
          confidence: '88%',
          cropPath: 'assets/images/demo_drone/cow_3.png',
        ),
        DetectedCow(
          label: 'Vaca #3',
          confidence: '87%',
          cropPath: 'assets/images/demo_drone/cow_1.png',
        ),
        DetectedCow(
          label: 'Vaca #4',
          confidence: '90%',
          cropPath: 'assets/images/demo_drone/cow_2.png',
        ),
      ],
    ),
    CattleDetection(
      id: 'DET-005',
      latitude: 16.4355,
      longitude: -98.1325,
      cattleCount: 1,
      confidence: '94%',
      timestamp: DateTime(2026, 3, 5, 7, 43),
      imagePath: 'assets/images/demo_drone/aerial_3.png',
      zoneName: 'Cerca Perimetral',
      cows: [
        DetectedCow(
          label: 'Vaca #1',
          confidence: '94%',
          cropPath: 'assets/images/demo_drone/cow_3.png',
        ),
      ],
    ),
    CattleDetection(
      id: 'DET-006',
      latitude: 16.4395,
      longitude: -98.1270,
      cattleCount: 6,
      confidence: '91%',
      timestamp: DateTime(2026, 3, 5, 7, 46),
      imagePath: 'assets/images/demo_drone/aerial_2.png',
      zoneName: 'Pradera Oeste',
      cows: [
        DetectedCow(
          label: 'Vaca #1',
          confidence: '92%',
          cropPath: 'assets/images/demo_drone/cow_1.png',
        ),
        DetectedCow(
          label: 'Vaca #2',
          confidence: '90%',
          cropPath: 'assets/images/demo_drone/cow_2.png',
        ),
        DetectedCow(
          label: 'Vaca #3',
          confidence: '91%',
          cropPath: 'assets/images/demo_drone/cow_3.png',
        ),
        DetectedCow(
          label: 'Vaca #4',
          confidence: '93%',
          cropPath: 'assets/images/demo_drone/cow_1.png',
        ),
        DetectedCow(
          label: 'Vaca #5',
          confidence: '89%',
          cropPath: 'assets/images/demo_drone/cow_2.png',
        ),
        DetectedCow(
          label: 'Vaca #6',
          confidence: '91%',
          cropPath: 'assets/images/demo_drone/cow_3.png',
        ),
      ],
    ),
  ];
}
