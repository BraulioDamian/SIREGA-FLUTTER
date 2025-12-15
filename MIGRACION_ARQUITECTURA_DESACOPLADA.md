# 📐 Plan de Migración: Arquitectura Desacoplada para SIREGA

> **Objetivo:** Migrar el proyecto SIREGA de una arquitectura acoplada a Isar hacia una arquitectura limpia (Clean Architecture) que sea agnóstica de la base de datos y permita cambiar fácilmente de tecnología en el futuro.

---

## 📊 Estado Actual del Proyecto

### Inventario Completo

| Componente | Cantidad | Estado |
|------------|----------|--------|
| **Modelos Isar (@collection)** | 9 | 🔴 Alto acoplamiento |
| **Servicios** | 10 | 🟡 Mixto |
| **Repositorios** | 3 | 🟡 Sin interfaces |
| **BLoCs** | 5 | ✅ Bien estructurados |
| **DTOs** | 7 | ✅ Buenos mappers |
| **Pantallas principales** | 15+ | 🟡 Mixto acceso a datos |

### Modelos con Dependencias Isar

| Modelo | Campos | Relaciones | Complejidad |
|--------|--------|-----------|-------------|
| **Animal** | 80+ | Links: padre, madre, herd<br>Backlinks: eventos, producciones, crias | 🔴 Alta |
| **EventoSanitario** | 15 | Links: animal | 🟡 Media |
| **RegistroProduccion** | 10 | Links: animal | 🟡 Media |
| **Herd** | 8 | Backlinks: animales | 🟡 Media |
| **Alerta** | 30+ | Links: animal | 🟡 Media |
| **SyncQueue** | 12 | Sin relaciones | 🟢 Baja |
| **ConfiguracionLocal** | 50+ | Sin relaciones | 🟡 Media |
| **LoteEvento** | 10 | Sin relaciones | 🟢 Baja |
| **ProductoCatalogo** | 6 | Sin relaciones | 🟢 Baja |

### Puntos Críticos de Acoplamiento

```dart
// ❌ PROBLEMA 1: Modelos con anotaciones Isar
@collection
class Animal {
  Id id = Isar.autoIncrement;
  final padre = IsarLink<Animal>();
  @Index(unique: true) String? idAreteNFC;
}

// ❌ PROBLEMA 2: UI accede directamente a IsarService
final isarService = RepositoryProvider.of<IsarService>(context);
await isarService.guardarAnimal(animal);

// ❌ PROBLEMA 3: Repositorio sin abstracción
class AnimalRepository {
  final IsarService _isarService;  // Dependencia concreta
}

// ❌ PROBLEMA 4: Servicios instanciados directamente en UI
final isarService = IsarService();  // Anti-pattern
```

---

## 🎯 Arquitectura Objetivo (Clean Architecture)

### Estructura de Capas

```
lib/
├── domain/                          # 🟦 CAPA DE DOMINIO (Sin dependencias externas)
│   ├── entities/                    # Entidades puras del negocio
│   │   ├── animal.dart
│   │   ├── evento_sanitario.dart
│   │   ├── registro_produccion.dart
│   │   ├── herd.dart
│   │   ├── alerta.dart
│   │   └── ...
│   ├── repositories/                # Contratos (interfaces)
│   │   ├── i_animal_repository.dart
│   │   ├── i_evento_repository.dart
│   │   ├── i_herd_repository.dart
│   │   └── ...
│   ├── usecases/                    # Casos de uso del negocio
│   │   ├── animal/
│   │   │   ├── get_animal_by_nfc.dart
│   │   │   ├── save_animal.dart
│   │   │   ├── get_animal_statistics.dart
│   │   │   └── ...
│   │   ├── evento/
│   │   │   ├── save_evento_sanitario.dart
│   │   │   ├── get_eventos_by_animal.dart
│   │   │   └── ...
│   │   └── sync/
│   │       ├── sync_pending_changes.dart
│   │       └── ...
│   └── value_objects/               # Objetos de valor
│       ├── siniga_id.dart
│       ├── nfc_chip_id.dart
│       └── ...
│
├── infrastructure/                  # 🟧 CAPA DE INFRAESTRUCTURA
│   ├── datasources/                 # Fuentes de datos
│   │   ├── local/
│   │   │   ├── isar/
│   │   │   │   ├── isar_datasource.dart
│   │   │   │   ├── models/          # Modelos Isar con anotaciones
│   │   │   │   │   ├── animal_isar_model.dart
│   │   │   │   │   ├── evento_sanitario_isar_model.dart
│   │   │   │   │   └── ...
│   │   │   │   └── mappers/         # Mappers Domain <-> Isar
│   │   │   │       ├── animal_mapper.dart
│   │   │   │       └── ...
│   │   │   └── i_local_datasource.dart  # Interface
│   │   └── remote/
│   │       ├── firebase/
│   │       │   ├── firebase_datasource.dart
│   │       │   ├── dtos/
│   │       │   │   ├── cattle_dto.dart
│   │       │   │   ├── health_record_dto.dart
│   │       │   │   └── ...
│   │       │   └── mappers/
│   │       │       ├── animal_remote_mapper.dart
│   │       │       └── ...
│   │       └── i_remote_datasource.dart
│   ├── repositories/                # Implementaciones de repositorios
│   │   ├── animal_repository_impl.dart
│   │   ├── evento_repository_impl.dart
│   │   └── ...
│   └── services/                    # Servicios de infraestructura
│       ├── auth_service.dart
│       ├── connection_service.dart
│       ├── nfc_service.dart
│       └── ...
│
├── application/                     # 🟩 CAPA DE APLICACIÓN
│   └── blocs/                       # Estado y lógica de aplicación
│       ├── auth/
│       │   ├── auth_bloc.dart
│       │   ├── auth_event.dart
│       │   └── auth_state.dart
│       ├── cattle/
│       │   ├── cattle_list_bloc.dart
│       │   └── ...
│       └── ...
│
├── presentation/                    # 🟨 CAPA DE PRESENTACIÓN
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── agregar_animal/
│   │   └── ...
│   └── widgets/
│       └── ...
│
└── core/                            # 🟪 NÚCLEO COMPARTIDO
    ├── di/                          # Inyección de dependencias
    │   ├── injection_container.dart # GetIt setup
    │   └── ...
    ├── errors/                      # Manejo de errores
    │   ├── failures.dart
    │   └── exceptions.dart
    ├── constants/
    └── utils/
```

### Flujo de Dependencias (Dependency Rule)

```
Presentation → Application → Domain ← Infrastructure
                   ↓                        ↑
                   └────────────────────────┘
```

**Regla de Oro:** Las capas internas NO conocen las externas.
- ✅ Infrastructure conoce Domain
- ✅ Application conoce Domain
- ✅ Presentation conoce Application y Domain
- ❌ Domain NO conoce Infrastructure
- ❌ Domain NO conoce Application

---

## 🗂️ Ejemplo Detallado: Modelo Animal

### Antes (Acoplado a Isar)

```dart
// ❌ lib/nucleo/modelos/animal_model.dart
import 'package:isar/isar.dart';

part 'animal_model.g.dart';

@collection
class Animal {
  Id id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: false)
  String? idAreteNFC;

  late String nombre;

  @Enumerated(EnumType.name)
  late Sexo sexo;

  final padre = IsarLink<Animal>();
  final madre = IsarLink<Animal>();
  final herd = IsarLink<Herd>();

  @Backlink(to: 'animal')
  final eventos = IsarLinks<EventoSanitario>();

  @ignore
  Map<String, String> camposPersonalizados = {};

  int getEdadEnMeses() {
    return DateTime.now().difference(fechaNacimiento).inDays ~/ 30;
  }
}
```

### Después (Clean Architecture)

#### 1️⃣ Domain Entity (Pura)

```dart
// ✅ lib/domain/entities/animal.dart
class Animal {
  final int? id;
  final String? idAreteNFC;
  final String nombre;
  final Sexo sexo;
  final String raza;
  final DateTime fechaNacimiento;
  final double? pesoNacimiento;
  final EstadoAnimal estado;
  final EstadoSalud estadoSalud;

  // Relaciones como IDs o referencias simples
  final int? padreId;
  final int? madreId;
  final int? herdId;

  // Value Objects
  final SinigaId? siniigaId;
  final NfcChipId? nfcChipId;

  // Campos calculados
  final String? fotoPerfilUrl;
  final List<String> fotosUrls;

  const Animal({
    this.id,
    this.idAreteNFC,
    required this.nombre,
    required this.sexo,
    required this.raza,
    required this.fechaNacimiento,
    this.pesoNacimiento,
    this.estado = EstadoAnimal.activo,
    this.estadoSalud = EstadoSalud.sano,
    this.padreId,
    this.madreId,
    this.herdId,
    this.siniigaId,
    this.nfcChipId,
    this.fotoPerfilUrl,
    this.fotosUrls = const [],
  });

  // Lógica de negocio pura
  int getEdadEnMeses() {
    return DateTime.now().difference(fechaNacimiento).inDays ~/ 30;
  }

  int getEdadEnDias() {
    return DateTime.now().difference(fechaNacimiento).inDays;
  }

  String getEdadFormateada() {
    final meses = getEdadEnMeses();
    if (meses < 12) return '$meses meses';
    final anos = meses ~/ 12;
    final mesesRestantes = meses % 12;
    if (mesesRestantes == 0) return '$anos año${anos > 1 ? 's' : ''}';
    return '$anos año${anos > 1 ? 's' : ''} $mesesRestantes mes${mesesRestantes > 1 ? 'es' : ''}';
  }

  // Métodos de copia
  Animal copyWith({
    int? id,
    String? idAreteNFC,
    String? nombre,
    Sexo? sexo,
    String? raza,
    DateTime? fechaNacimiento,
    double? pesoNacimiento,
    EstadoAnimal? estado,
    EstadoSalud? estadoSalud,
    int? padreId,
    int? madreId,
    int? herdId,
    SinigaId? siniigaId,
    NfcChipId? nfcChipId,
  }) {
    return Animal(
      id: id ?? this.id,
      idAreteNFC: idAreteNFC ?? this.idAreteNFC,
      nombre: nombre ?? this.nombre,
      sexo: sexo ?? this.sexo,
      raza: raza ?? this.raza,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
      pesoNacimiento: pesoNacimiento ?? this.pesoNacimiento,
      estado: estado ?? this.estado,
      estadoSalud: estadoSalud ?? this.estadoSalud,
      padreId: padreId ?? this.padreId,
      madreId: madreId ?? this.madreId,
      herdId: herdId ?? this.herdId,
      siniigaId: siniigaId ?? this.siniigaId,
      nfcChipId: nfcChipId ?? this.nfcChipId,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Animal && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
```

#### 2️⃣ Infrastructure Model (Con Isar)

```dart
// ✅ lib/infrastructure/datasources/local/isar/models/animal_isar_model.dart
import 'package:isar/isar.dart';

part 'animal_isar_model.g.dart';

@collection
class AnimalIsarModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: false)
  String? idAreteNFC;

  late String nombre;

  @Enumerated(EnumType.name)
  late Sexo sexo;

  late String raza;
  late DateTime fechaNacimiento;
  double? pesoNacimiento;
  String? colorPelaje;

  @Enumerated(EnumType.name)
  EstadoAnimal estado = EstadoAnimal.activo;

  @Enumerated(EnumType.name)
  EstadoSalud estadoSalud = EstadoSalud.sano;

  // Relaciones Isar
  final padre = IsarLink<AnimalIsarModel>();
  final madre = IsarLink<AnimalIsarModel>();
  final herd = IsarLink<HerdIsarModel>();

  @Backlink(to: 'animal')
  final eventos = IsarLinks<EventoSanitarioIsarModel>();

  @Backlink(to: 'animal')
  final producciones = IsarLinks<RegistroProduccionIsarModel>();

  // Value Objects embebidos
  SinigaId? siniigaId;

  @Index(unique: true, caseSensitive: false)
  String? nfcChipId;

  // Multimedia
  List<String> fotosUrls = [];
  String? fotoPerfilUrl;

  // Sincronización
  @Index()
  String? serverId;
  DateTime? ultimaActualizacion;

  @Enumerated(EnumType.name)
  EstadoSync estadoSync = EstadoSync.pendiente;

  // Timestamps
  DateTime fechaCreacion = DateTime.now();
  String? usuarioCreacion;

  // NOTA: NO hay métodos de negocio aquí, solo datos
}
```

#### 3️⃣ Mapper (Isar ↔ Domain)

```dart
// ✅ lib/infrastructure/datasources/local/isar/mappers/animal_mapper.dart
import 'package:sirega_app/domain/entities/animal.dart';
import 'package:sirega_app/infrastructure/datasources/local/isar/models/animal_isar_model.dart';

class AnimalMapper {
  /// Convierte de Modelo Isar → Entidad de Dominio
  static Animal toDomain(AnimalIsarModel model) {
    return Animal(
      id: model.id,
      idAreteNFC: model.idAreteNFC,
      nombre: model.nombre,
      sexo: model.sexo,
      raza: model.raza,
      fechaNacimiento: model.fechaNacimiento,
      pesoNacimiento: model.pesoNacimiento,
      estado: model.estado,
      estadoSalud: model.estadoSalud,
      padreId: model.padre.value?.id,
      madreId: model.madre.value?.id,
      herdId: model.herd.value?.id,
      siniigaId: model.siniigaId,
      nfcChipId: model.nfcChipId != null ? NfcChipId(model.nfcChipId!) : null,
      fotoPerfilUrl: model.fotoPerfilUrl,
      fotosUrls: model.fotosUrls,
    );
  }

  /// Convierte de Entidad de Dominio → Modelo Isar
  static AnimalIsarModel toIsar(Animal entity) {
    return AnimalIsarModel()
      ..id = entity.id ?? Isar.autoIncrement
      ..idAreteNFC = entity.idAreteNFC
      ..nombre = entity.nombre
      ..sexo = entity.sexo
      ..raza = entity.raza
      ..fechaNacimiento = entity.fechaNacimiento
      ..pesoNacimiento = entity.pesoNacimiento
      ..estado = entity.estado
      ..estadoSalud = entity.estadoSalud
      ..siniigaId = entity.siniigaId
      ..nfcChipId = entity.nfcChipId?.value
      ..fotoPerfilUrl = entity.fotoPerfilUrl
      ..fotosUrls = entity.fotosUrls.toList();
    // Nota: Las relaciones (padre, madre, herd) se manejan por separado
  }

  /// Actualiza un modelo Isar existente con datos de una entidad
  static void updateIsarModel(AnimalIsarModel model, Animal entity) {
    model
      ..idAreteNFC = entity.idAreteNFC
      ..nombre = entity.nombre
      ..sexo = entity.sexo
      ..raza = entity.raza
      ..fechaNacimiento = entity.fechaNacimiento
      ..pesoNacimiento = entity.pesoNacimiento
      ..estado = entity.estado
      ..estadoSalud = entity.estadoSalud
      ..siniigaId = entity.siniigaId
      ..nfcChipId = entity.nfcChipId?.value
      ..fotoPerfilUrl = entity.fotoPerfilUrl
      ..fotosUrls = entity.fotosUrls.toList()
      ..ultimaActualizacion = DateTime.now();
  }

  /// Convierte lista de modelos Isar → lista de entidades
  static List<Animal> toDomainList(List<AnimalIsarModel> models) {
    return models.map((model) => toDomain(model)).toList();
  }
}
```

#### 4️⃣ Repository Interface (Contrato)

```dart
// ✅ lib/domain/repositories/i_animal_repository.dart
import 'package:dartz/dartz.dart';
import 'package:sirega_app/core/errors/failures.dart';
import 'package:sirega_app/domain/entities/animal.dart';
import 'package:sirega_app/domain/entities/evento_sanitario.dart';
import 'package:sirega_app/domain/entities/registro_produccion.dart';

abstract class IAnimalRepository {
  /// Busca un animal por su ID de NFC
  Future<Either<Failure, Animal?>> getByNfcId(String nfcId);

  /// Busca un animal por su ID de arete visual
  Future<Either<Failure, Animal?>> getByAreteVisual(String areteVisual);

  /// Obtiene un animal por su ID interno
  Future<Either<Failure, Animal?>> getById(int id);

  /// Obtiene todos los animales
  Future<Either<Failure, List<Animal>>> getAll();

  /// Obtiene animales activos
  Future<Either<Failure, List<Animal>>> getActivos();

  /// Obtiene animales por estado
  Future<Either<Failure, List<Animal>>> getByEstado(EstadoAnimal estado);

  /// Obtiene animales gestantes
  Future<Either<Failure, List<Animal>>> getGestantes();

  /// Guarda un animal (crear o actualizar)
  Future<Either<Failure, int>> save(Animal animal);

  /// Elimina un animal
  Future<Either<Failure, bool>> delete(int id);

  /// Obtiene eventos sanitarios de un animal
  Future<Either<Failure, List<EventoSanitario>>> getEventos(int animalId);

  /// Obtiene registros de producción de un animal
  Future<Either<Failure, List<RegistroProduccion>>> getProduccion(int animalId);

  /// Obtiene estadísticas generales
  Future<Either<Failure, Map<String, dynamic>>> getEstadisticas();

  /// Observa cambios en los animales (Stream)
  Stream<List<Animal>> watchAll();

  /// Observa un animal específico
  Stream<Animal?> watchById(int id);
}
```

**Explicación del patrón Either:**
- `Either<Failure, T>` representa un resultado que puede ser éxito (Right) o fallo (Left)
- `Failure` es una clase base para errores de dominio
- Permite manejo de errores funcional sin excepciones

#### 5️⃣ Repository Implementation

```dart
// ✅ lib/infrastructure/repositories/animal_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:sirega_app/core/errors/exceptions.dart';
import 'package:sirega_app/core/errors/failures.dart';
import 'package:sirega_app/domain/entities/animal.dart';
import 'package:sirega_app/domain/repositories/i_animal_repository.dart';
import 'package:sirega_app/infrastructure/datasources/local/i_local_datasource.dart';
import 'package:sirega_app/infrastructure/datasources/local/isar/mappers/animal_mapper.dart';

class AnimalRepositoryImpl implements IAnimalRepository {
  final ILocalDatasource _localDatasource;

  AnimalRepositoryImpl(this._localDatasource);

  @override
  Future<Either<Failure, Animal?>> getByNfcId(String nfcId) async {
    try {
      final normalizedId = _normalizeNfcId(nfcId);
      final model = await _localDatasource.getAnimalByNfcId(normalizedId);

      if (model == null) {
        return const Right(null);
      }

      return Right(AnimalMapper.toDomain(model));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Animal?>> getById(int id) async {
    try {
      final model = await _localDatasource.getAnimalById(id);
      return Right(model != null ? AnimalMapper.toDomain(model) : null);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Animal>>> getAll() async {
    try {
      final models = await _localDatasource.getAllAnimals();
      return Right(AnimalMapper.toDomainList(models));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> save(Animal animal) async {
    try {
      final model = AnimalMapper.toIsar(animal);
      final id = await _localDatasource.saveAnimal(model);
      return Right(id);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> delete(int id) async {
    try {
      final result = await _localDatasource.deleteAnimal(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Stream<List<Animal>> watchAll() {
    return _localDatasource.watchAllAnimals().map(
      (models) => AnimalMapper.toDomainList(models),
    );
  }

  // Método auxiliar privado
  String _normalizeNfcId(String nfcId) {
    return nfcId.replaceAll(':', '').replaceAll(' ', '').toUpperCase();
  }

  // ... Implementar resto de métodos
}
```

#### 6️⃣ Datasource Interface

```dart
// ✅ lib/infrastructure/datasources/local/i_local_datasource.dart
import 'package:sirega_app/infrastructure/datasources/local/isar/models/animal_isar_model.dart';
import 'package:sirega_app/infrastructure/datasources/local/isar/models/evento_sanitario_isar_model.dart';

abstract class ILocalDatasource {
  // Inicialización
  Future<void> init();
  Future<void> seedInitialData();

  // Animal
  Future<AnimalIsarModel?> getAnimalById(int id);
  Future<AnimalIsarModel?> getAnimalByNfcId(String nfcId);
  Future<List<AnimalIsarModel>> getAllAnimals();
  Future<List<AnimalIsarModel>> getAnimalsByEstado(EstadoAnimal estado);
  Future<int> saveAnimal(AnimalIsarModel animal);
  Future<bool> deleteAnimal(int id);
  Stream<List<AnimalIsarModel>> watchAllAnimals();
  Stream<AnimalIsarModel?> watchAnimalById(int id);

  // EventoSanitario
  Future<List<EventoSanitarioIsarModel>> getEventosByAnimalId(int animalId);
  Future<void> saveEvento(EventoSanitarioIsarModel evento, int animalId);

  // ... Más métodos según necesidades
}
```

#### 7️⃣ Datasource Implementation (Isar)

```dart
// ✅ lib/infrastructure/datasources/local/isar/isar_datasource.dart
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sirega_app/core/errors/exceptions.dart';
import 'package:sirega_app/infrastructure/datasources/local/i_local_datasource.dart';
import 'package:sirega_app/infrastructure/datasources/local/isar/models/animal_isar_model.dart';

class IsarDatasource implements ILocalDatasource {
  late Isar _isar;

  @override
  Future<void> init() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      _isar = await Isar.open(
        [
          AnimalIsarModelSchema,
          EventoSanitarioIsarModelSchema,
          RegistroProduccionIsarModelSchema,
          HerdIsarModelSchema,
          AlertaIsarModelSchema,
          ConfiguracionLocalIsarModelSchema,
          SyncQueueIsarModelSchema,
          LoteEventoIsarModelSchema,
          ProductoCatalogoIsarModelSchema,
        ],
        directory: dir.path,
        inspector: true,
      );
    } catch (e) {
      throw DatabaseException('Error al inicializar Isar: $e');
    }
  }

  @override
  Future<void> seedInitialData() async {
    try {
      final count = await _isar.productoCatalogos.count();
      if (count == 0) {
        final productos = [
          ProductoCatalogoIsarModel()
            ..nombre = 'BOBACT 8'
            ..tipo = TipoEvento.vacuna
            ..descripcion = 'Prevención de carbunco.'
            ..esDeSistema = true,
          // ... más productos
        ];
        await _isar.writeTxn(() => _isar.productoCatalogos.putAll(productos));
      }
    } catch (e) {
      throw DatabaseException('Error al poblar datos iniciales: $e');
    }
  }

  @override
  Future<AnimalIsarModel?> getAnimalById(int id) async {
    try {
      return await _isar.animalIsarModels.get(id);
    } catch (e) {
      throw DatabaseException('Error al obtener animal por ID: $e');
    }
  }

  @override
  Future<AnimalIsarModel?> getAnimalByNfcId(String nfcId) async {
    try {
      return await _isar.animalIsarModels.getByNfcChipId(nfcId);
    } catch (e) {
      throw DatabaseException('Error al obtener animal por NFC: $e');
    }
  }

  @override
  Future<List<AnimalIsarModel>> getAllAnimals() async {
    try {
      return await _isar.animalIsarModels.where().findAll();
    } catch (e) {
      throw DatabaseException('Error al obtener todos los animales: $e');
    }
  }

  @override
  Future<int> saveAnimal(AnimalIsarModel animal) async {
    try {
      return await _isar.writeTxn(() => _isar.animalIsarModels.put(animal));
    } catch (e) {
      throw DatabaseException('Error al guardar animal: $e');
    }
  }

  @override
  Future<bool> deleteAnimal(int id) async {
    try {
      return await _isar.writeTxn(() => _isar.animalIsarModels.delete(id));
    } catch (e) {
      throw DatabaseException('Error al eliminar animal: $e');
    }
  }

  @override
  Stream<List<AnimalIsarModel>> watchAllAnimals() {
    return _isar.animalIsarModels.where().watch(fireImmediately: true);
  }

  // ... Implementar resto de métodos
}
```

#### 8️⃣ Use Case

```dart
// ✅ lib/domain/usecases/animal/get_animal_by_nfc.dart
import 'package:dartz/dartz.dart';
import 'package:sirega_app/core/errors/failures.dart';
import 'package:sirega_app/domain/entities/animal.dart';
import 'package:sirega_app/domain/repositories/i_animal_repository.dart';

class GetAnimalByNfc {
  final IAnimalRepository repository;

  GetAnimalByNfc(this.repository);

  Future<Either<Failure, Animal?>> call(String nfcId) async {
    if (nfcId.isEmpty) {
      return Left(ValidationFailure('El ID de NFC no puede estar vacío'));
    }

    return await repository.getByNfcId(nfcId);
  }
}
```

#### 9️⃣ BLoC (Updated)

```dart
// ✅ lib/application/blocs/cattle/cattle_list_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/domain/entities/animal.dart';
import 'package:sirega_app/domain/usecases/animal/get_all_animals.dart';
import 'package:sirega_app/domain/usecases/animal/delete_animal.dart';

// Events
abstract class CattleListEvent {}
class LoadCattleList extends CattleListEvent {}
class DeleteCattle extends CattleListEvent {
  final int animalId;
  DeleteCattle(this.animalId);
}

// States
abstract class CattleListState {}
class CattleListInitial extends CattleListState {}
class CattleListLoading extends CattleListState {}
class CattleListLoaded extends CattleListState {
  final List<Animal> animals;
  CattleListLoaded(this.animals);
}
class CattleListError extends CattleListState {
  final String message;
  CattleListError(this.message);
}

// BLoC
class CattleListBloc extends Bloc<CattleListEvent, CattleListState> {
  final GetAllAnimals getAllAnimals;
  final DeleteAnimal deleteAnimal;

  CattleListBloc({
    required this.getAllAnimals,
    required this.deleteAnimal,
  }) : super(CattleListInitial()) {
    on<LoadCattleList>(_onLoadCattleList);
    on<DeleteCattle>(_onDeleteCattle);
  }

  Future<void> _onLoadCattleList(
    LoadCattleList event,
    Emitter<CattleListState> emit,
  ) async {
    emit(CattleListLoading());

    final result = await getAllAnimals();

    result.fold(
      (failure) => emit(CattleListError(failure.message)),
      (animals) => emit(CattleListLoaded(animals)),
    );
  }

  Future<void> _onDeleteCattle(
    DeleteCattle event,
    Emitter<CattleListState> emit,
  ) async {
    final result = await deleteAnimal(event.animalId);

    result.fold(
      (failure) => emit(CattleListError(failure.message)),
      (_) => add(LoadCattleList()), // Reload list
    );
  }
}
```

#### 🔟 Dependency Injection (GetIt)

```dart
// ✅ lib/core/di/injection_container.dart
import 'package:get_it/get_it.dart';
import 'package:sirega_app/domain/repositories/i_animal_repository.dart';
import 'package:sirega_app/domain/usecases/animal/get_all_animals.dart';
import 'package:sirega_app/domain/usecases/animal/get_animal_by_nfc.dart';
import 'package:sirega_app/infrastructure/datasources/local/i_local_datasource.dart';
import 'package:sirega_app/infrastructure/datasources/local/isar/isar_datasource.dart';
import 'package:sirega_app/infrastructure/repositories/animal_repository_impl.dart';
import 'package:sirega_app/application/blocs/cattle/cattle_list_bloc.dart';

final sl = GetIt.instance; // Service Locator

Future<void> init() async {
  // ===== BLoCs =====
  sl.registerFactory(() => CattleListBloc(
    getAllAnimals: sl(),
    deleteAnimal: sl(),
  ));

  // ===== Use Cases =====
  sl.registerLazySingleton(() => GetAllAnimals(sl()));
  sl.registerLazySingleton(() => GetAnimalByNfc(sl()));
  sl.registerLazySingleton(() => DeleteAnimal(sl()));
  // ... más use cases

  // ===== Repositories =====
  sl.registerLazySingleton<IAnimalRepository>(
    () => AnimalRepositoryImpl(sl()),
  );

  // ===== Data Sources =====
  sl.registerLazySingleton<ILocalDatasource>(
    () => IsarDatasource(),
  );

  // ===== External =====
  // Inicializar datasource
  await sl<ILocalDatasource>().init();
  await sl<ILocalDatasource>().seedInitialData();
}
```

#### 1️⃣1️⃣ UI (Updated)

```dart
// ✅ lib/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/application/blocs/cattle/cattle_list_bloc.dart';
import 'package:sirega_app/core/di/injection_container.dart' as di;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<CattleListBloc>()..add(LoadCattleList()),
      child: Scaffold(
        appBar: AppBar(title: Text('Ganado')),
        body: BlocBuilder<CattleListBloc, CattleListState>(
          builder: (context, state) {
            if (state is CattleListLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is CattleListError) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is CattleListLoaded) {
              return ListView.builder(
                itemCount: state.animals.length,
                itemBuilder: (context, index) {
                  final animal = state.animals[index];
                  return ListTile(
                    title: Text(animal.nombre),
                    subtitle: Text('Raza: ${animal.raza}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        context.read<CattleListBloc>().add(
                          DeleteCattle(animal.id!),
                        );
                      },
                    ),
                  );
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
```

---

## 📦 Gestión de Errores

### Definiciones de Failures

```dart
// ✅ lib/core/errors/failures.dart
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(String message) : super(message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(String message) : super(message);
}
```

### Definiciones de Exceptions

```dart
// ✅ lib/core/errors/exceptions.dart
class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);
}
```

---

## 🔄 Plan de Migración por Fases

### FASE 1: Preparación y Setup (3-5 días)

#### 1.1 Crear estructura de carpetas
```bash
mkdir -p lib/domain/entities
mkdir -p lib/domain/repositories
mkdir -p lib/domain/usecases/animal
mkdir -p lib/domain/usecases/evento
mkdir -p lib/domain/usecases/sync
mkdir -p lib/domain/value_objects
mkdir -p lib/infrastructure/datasources/local/isar/models
mkdir -p lib/infrastructure/datasources/local/isar/mappers
mkdir -p lib/infrastructure/repositories
mkdir -p lib/application/blocs
mkdir -p lib/core/di
mkdir -p lib/core/errors
```

#### 1.2 Instalar dependencias adicionales
```yaml
# pubspec.yaml
dependencies:
  # Existing...

  # Nuevas para Clean Architecture
  dartz: ^0.10.1              # Functional programming (Either, Option)
  get_it: ^7.6.0              # Dependency Injection
  equatable: ^2.0.5           # Value equality

dev_dependencies:
  # Existing...
  mockito: ^5.4.0             # Para testing
  build_runner: ^2.4.0        # Ya lo tienes
```

#### 1.3 Crear clases base de errores
- Crear `lib/core/errors/failures.dart`
- Crear `lib/core/errors/exceptions.dart`

#### 1.4 Configurar GetIt
- Crear `lib/core/di/injection_container.dart`
- Definir método `init()`

**Tareas:**
- [ ] Crear estructura de carpetas
- [ ] Agregar dependencias al pubspec.yaml
- [ ] Crear clases de failures y exceptions
- [ ] Setup inicial de GetIt
- [ ] Documentar decisiones arquitectónicas

---

### FASE 2: Migrar Modelo Animal (5-7 días)

**Por qué empezar con Animal:**
- Es el modelo más complejo (80+ campos)
- Tiene más relaciones (padre, madre, herd, eventos, producciones)
- Es el núcleo del negocio
- Si funciona con Animal, funcionará con los demás

#### 2.1 Crear entidad de dominio
- [ ] Crear `lib/domain/entities/animal.dart`
- [ ] Mover lógica de negocio (getEdadEnMeses, etc.)
- [ ] Crear value objects (NfcChipId, SinigaId si no existe)
- [ ] Implementar copyWith, equality

#### 2.2 Crear modelo Isar
- [ ] Crear `lib/infrastructure/datasources/local/isar/models/animal_isar_model.dart`
- [ ] Copiar anotaciones Isar del modelo actual
- [ ] Mantener solo datos, sin lógica de negocio
- [ ] Generar código con build_runner

#### 2.3 Crear mappers
- [ ] Crear `lib/infrastructure/datasources/local/isar/mappers/animal_mapper.dart`
- [ ] Implementar `toDomain()`
- [ ] Implementar `toIsar()`
- [ ] Implementar `toDomainList()`

#### 2.4 Crear interfaces de repositorio
- [ ] Crear `lib/domain/repositories/i_animal_repository.dart`
- [ ] Definir todos los métodos necesarios
- [ ] Usar Either<Failure, T> para retornos

#### 2.5 Crear datasource interface e implementación
- [ ] Crear `lib/infrastructure/datasources/local/i_local_datasource.dart`
- [ ] Crear `lib/infrastructure/datasources/local/isar/isar_datasource.dart`
- [ ] Migrar lógica de IsarService a IsarDatasource

#### 2.6 Crear implementación de repositorio
- [ ] Crear `lib/infrastructure/repositories/animal_repository_impl.dart`
- [ ] Implementar todos los métodos de IAnimalRepository
- [ ] Manejar conversiones y errores

#### 2.7 Crear use cases básicos
- [ ] Crear `get_animal_by_nfc.dart`
- [ ] Crear `get_all_animals.dart`
- [ ] Crear `save_animal.dart`
- [ ] Crear `delete_animal.dart`

#### 2.8 Actualizar DI
- [ ] Registrar datasources en GetIt
- [ ] Registrar repositorios en GetIt
- [ ] Registrar use cases en GetIt

#### 2.9 Testing
- [ ] Tests unitarios de entity
- [ ] Tests unitarios de mappers
- [ ] Tests de repositorio (con mocks)
- [ ] Tests de use cases

**Entregables:**
- Modelo Animal completamente migrado
- Tests pasando
- Documentación de patrones

---

### FASE 3: Actualizar BLoCs para Animal (3-4 días)

#### 3.1 Refactorizar CattleListBloc
- [ ] Inyectar use cases en lugar de IsarService
- [ ] Actualizar eventos y estados
- [ ] Manejar Either<Failure, T>
- [ ] Testing del BLoC

#### 3.2 Refactorizar CattleDetailBloc
- [ ] Inyectar use cases
- [ ] Actualizar lógica
- [ ] Testing

#### 3.3 Actualizar pantallas
- [ ] Actualizar home_screen.dart para usar nuevo BLoC
- [ ] Actualizar cattle_detail_screen.dart
- [ ] Actualizar agregar_animal_screen.dart
- [ ] Probar flujo completo

**Checkpoint:** Funcionalidad de Animal debe estar 100% operativa con la nueva arquitectura.

---

### FASE 4: Migrar Modelos Secundarios (7-10 días)

Migrar en este orden (de más simple a más complejo):

#### 4.1 ProductoCatalogo (1 día)
- Sin relaciones
- Pocos campos
- Buen modelo para practicar el patrón

#### 4.2 SyncQueue (1 día)
- Sin relaciones
- Importante para sincronización

#### 4.3 ConfiguracionLocal (1 día)
- Sin relaciones
- Singleton pattern

#### 4.4 LoteEvento (1-2 días)
- Sin relaciones complejas

#### 4.5 EventoSanitario (2-3 días)
- Relación con Animal
- Backlink importante
- Use cases: guardar evento, obtener eventos por animal

#### 4.6 RegistroProduccion (2-3 días)
- Similar a EventoSanitario

#### 4.7 Herd (2-3 días)
- Backlink a animales
- Relaciones importantes

#### 4.8 Alerta (2-3 días)
- Relación con Animal
- Lógica de verificación

Para cada modelo:
- [ ] Crear entity en domain
- [ ] Crear model en infrastructure
- [ ] Crear mapper
- [ ] Crear repository interface
- [ ] Crear repository implementation
- [ ] Crear use cases
- [ ] Actualizar DI
- [ ] Tests
- [ ] Actualizar BLoCs/UI que lo usan

---

### FASE 5: Refactorizar Servicios (5-7 días)

#### 5.1 FirebaseSyncService
- [ ] Separar lógica de sincronización de acceso a datos
- [ ] Usar repositorios en lugar de IsarService directo
- [ ] Crear use cases de sync si es necesario
- [ ] Mantener lógica de conflictos y merge

#### 5.2 SyncService
- [ ] Usar repositorios
- [ ] Refactorizar queue management

#### 5.3 AlertaService
- [ ] Usar repositorios
- [ ] Separar lógica de negocio de acceso a datos

#### 5.4 NfcService y BluetoothService
- [ ] Mantener como servicios de infraestructura
- [ ] Asegurar que no accedan directamente a BD
- [ ] Usar repositorios/use cases cuando necesiten datos

---

### FASE 6: Limpieza y Eliminación de Código Antiguo (3-4 días)

#### 6.1 Eliminar archivos obsoletos
- [ ] Eliminar `lib/nucleo/modelos/*.dart` (excepto enums.dart)
- [ ] Eliminar `lib/nucleo/servicios/isar_service.dart`
- [ ] Eliminar `lib/nucleo/repositorios/animal_repository.dart` (antiguo)
- [ ] Limpiar imports rotos

#### 6.2 Actualizar todas las pantallas
- [ ] Buscar todos los usos de RepositoryProvider<IsarService>
- [ ] Reemplazar con BLoCs o use cases directos
- [ ] Eliminar instancias directas de IsarService()

#### 6.3 Verificar que nada use código antiguo
```bash
# Buscar referencias a IsarService en código
grep -r "IsarService" lib/ --exclude-dir=infrastructure

# Buscar imports del antiguo modelo
grep -r "nucleo/modelos/animal_model.dart" lib/
```

---

### FASE 7: Testing Completo y Documentación (5-7 días)

#### 7.1 Tests unitarios
- [ ] Tests de todas las entities
- [ ] Tests de todos los mappers
- [ ] Tests de todos los use cases
- [ ] Tests de repositorios (con mocks)

#### 7.2 Tests de integración
- [ ] Flujo completo de crear animal
- [ ] Flujo completo de escaneo NFC
- [ ] Flujo de sincronización
- [ ] Flujo de alertas

#### 7.3 Tests E2E (widget tests)
- [ ] Flujo de autenticación
- [ ] Navegación principal
- [ ] CRUD de animales
- [ ] Escaneo NFC

#### 7.4 Documentación
- [ ] Actualizar README.md con nueva arquitectura
- [ ] Crear diagramas de arquitectura
- [ ] Documentar patrones y decisiones
- [ ] Guía de contribución

---

## 📊 Resumen de Estimaciones

| Fase | Duración | Complejidad | Dependencias |
|------|----------|-------------|--------------|
| 1. Preparación | 3-5 días | 🟢 Baja | Ninguna |
| 2. Migrar Animal | 5-7 días | 🔴 Alta | Fase 1 |
| 3. Actualizar BLoCs Animal | 3-4 días | 🟡 Media | Fase 2 |
| 4. Migrar Modelos Secundarios | 7-10 días | 🟡 Media | Fase 3 |
| 5. Refactorizar Servicios | 5-7 días | 🔴 Alta | Fase 4 |
| 6. Limpieza | 3-4 días | 🟢 Baja | Fase 5 |
| 7. Testing y Docs | 5-7 días | 🟡 Media | Fase 6 |
| **TOTAL** | **31-44 días** | | |

**Estimación realista:** 6-9 semanas trabajando tiempo completo.

**Estimación conservadora (part-time o con otros proyectos):** 3-4 meses.

---

## 🎯 Estrategias de Migración

### Opción A: Big Bang (NO RECOMENDADO)
- Migrar todo de una vez
- Alto riesgo
- Bloquea desarrollo de features

### Opción B: Migración Incremental (RECOMENDADO)
- Mantener código antiguo y nuevo en paralelo temporalmente
- Migrar modelo por modelo
- Ir actualizando pantallas gradualmente
- Menor riesgo, pero código duplicado temporal

### Opción C: Branch Paralelo
- Crear branch `feature/clean-architecture`
- Desarrollar todo en paralelo
- Merge masivo al final
- Riesgo medio, requiere disciplina en merges

**Recomendación:** Opción B (Migración Incremental)

---

## ⚠️ Riesgos y Mitigaciones

| Riesgo | Probabilidad | Impacto | Mitigación |
|--------|--------------|---------|------------|
| Romper funcionalidad existente | 🔴 Alta | 🔴 Alto | Tests exhaustivos, migración incremental |
| Tiempo subestimado | 🟡 Media | 🟡 Medio | Agregar buffer 20-30% |
| Pérdida de datos en migración | 🟢 Baja | 🔴 Alto | Backups antes de cada fase |
| Confusión del equipo | 🟡 Media | 🟡 Medio | Documentación clara, pair programming |
| Bugs en mappers | 🔴 Alta | 🟡 Medio | Tests unitarios exhaustivos |
| Performance degradation | 🟢 Baja | 🟡 Medio | Benchmarks antes/después |

---

## ✅ Checklist de Verificación

Antes de considerar la migración completa:

### Funcionalidad
- [ ] Todos los tests pasan
- [ ] No hay referencias a código antiguo
- [ ] CRUD de Animal funciona 100%
- [ ] CRUD de Eventos funciona 100%
- [ ] CRUD de Producción funciona 100%
- [ ] Sincronización funciona
- [ ] Alertas se generan correctamente
- [ ] Escaneo NFC funciona
- [ ] Escaneo Bluetooth funciona

### Calidad de Código
- [ ] Coverage de tests >80%
- [ ] No hay warnings del linter
- [ ] No hay TODOs críticos
- [ ] Código documentado
- [ ] Diagramas actualizados

### Performance
- [ ] Tiempo de carga de lista de animales similar o mejor
- [ ] Queries de búsqueda igual de rápidas
- [ ] Sincronización no más lenta
- [ ] App no consume más memoria

---

## 🚀 Beneficios de la Migración

### Corto Plazo
- ✅ Código más testeable
- ✅ Separación clara de responsabilidades
- ✅ Mejor manejo de errores

### Mediano Plazo
- ✅ Facilita agregar nuevas features
- ✅ Onboarding de nuevos desarrolladores más fácil
- ✅ Menos bugs en producción

### Largo Plazo
- ✅ Cambiar de BD sin reescribir toda la app
- ✅ Escalar el equipo
- ✅ Reutilizar lógica de negocio
- ✅ Soporte multi-plataforma (web, desktop) más fácil

---

## 🔧 Herramientas Útiles

### Para la Migración
- **Flutter DevTools:** Inspeccionar performance
- **Isar Inspector:** Verificar datos durante migración
- **Git:** Branches para cada fase
- **GitHub Issues:** Trackear tareas

### Para Testing
- **mockito:** Mocks de repositorios
- **bloc_test:** Testing de BLoCs
- **flutter_test:** Widget tests
- **integration_test:** E2E tests

### Para Documentación
- **PlantUML:** Diagramas de arquitectura
- **Mermaid:** Diagramas en markdown
- **draw.io:** Diagramas visuales

---

## 📚 Recursos de Aprendizaje

### Clean Architecture
- [The Clean Architecture (Uncle Bob)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Clean Architecture (Reso Coder)](https://resocoder.com/flutter-clean-architecture-tdd/)

### Patrones de Diseño
- Repository Pattern
- Dependency Inversion
- Use Case Pattern

### Testing
- [Flutter Testing Guide](https://docs.flutter.dev/testing)
- [Effective Dart: Testing](https://dart.dev/guides/language/effective-dart/testing)

---

## 🤝 Recomendaciones Finales

1. **No te apresures:** Es mejor hacerlo bien que hacerlo rápido
2. **Escribe tests primero:** Te darán confianza para refactorizar
3. **Migra un modelo a la vez:** No intentes todo junto
4. **Documenta decisiones:** Tu yo del futuro te lo agradecerá
5. **Pide revisiones de código:** Otra perspectiva siempre ayuda
6. **Haz commits pequeños:** Facilita revertir si algo sale mal
7. **Mantén main estable:** Usa feature branches
8. **Celebra los hitos:** Es un proyecto grande, reconoce el progreso

---

## 📝 Notas Adicionales

### ¿Vale la pena para tu proyecto?

**SÍ, si:**
- Planeas escalar el proyecto significativamente
- Vas a trabajar en equipo
- Necesitas cambiar de BD en el futuro
- Quieres soportar web/desktop
- El proyecto tendrá vida larga (3+ años)

**NO, si:**
- Es un prototipo temporal
- Solo tú trabajarás en él
- No planeas agregar muchas features
- Necesitas entregar rápido y no volver a tocar el código

### Alternativa: Mejoras Incrementales Sin Migración Completa

Si Clean Architecture completa es demasiado, considera:

1. **Agregar interfaces a repositorios actuales**
   - Crear `IAnimalRepository`
   - Implementar con el repositorio actual
   - Facilita testing

2. **Separar modelos de lógica de negocio**
   - Mover métodos como `getEdadEnMeses()` a clases helpers
   - Mantener modelos solo como datos

3. **Usar GetIt para DI**
   - Reemplazar RepositoryProvider con GetIt
   - Evitar instancias directas

4. **Agregar capa de use cases**
   - Sin cambiar modelos ni repositorios
   - Mejor organización de lógica

---

## 🎓 Conclusión

Esta migración es una inversión significativa en la calidad y mantenibilidad de tu código. Si decides hacerla, sigue el plan por fases, escribe tests, y no te desanimes si toma más tiempo de lo esperado.

**¿Listo para empezar? Comienza con la Fase 1 y avanza paso a paso.**

---

**Documento creado:** 2025-01-28
**Versión:** 1.0
**Autor:** Plan generado por Claude Code basado en análisis del proyecto SIREGA
**Última actualización:** 2025-01-28
