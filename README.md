# Manual Técnico - SIREGA (Sistema de Registro Ganadero)

**Versión:** 1.0.0
**Fecha:** Enero 2025
**Plataforma:** Flutter 3.9.0+
**Autor:** Equipo SIREGA

---

## Tabla de Contenidos

1. [Introducción](#1-introducción)
2. [Arquitectura General](#2-arquitectura-general)
3. [Estructura del Proyecto](#3-estructura-del-proyecto)
4. [Módulos Funcionales](#4-módulos-funcionales)
5. [Capa de Datos](#5-capa-de-datos)
6. [Servicios Core](#6-servicios-core)
7. [Integración con Firebase](#7-integración-con-firebase)
8. [Sistema de Sincronización](#8-sistema-de-sincronización)
9. [Gestión de Estado](#9-gestión-de-estado)
10. [Navegación](#10-navegación)
11. [Configuración y Deployment](#11-configuración-y-deployment)
12. [Guía de Desarrollo](#12-guía-de-desarrollo)
13. [Testing](#13-testing)
14. [Troubleshooting](#14-troubleshooting)
15. [Roadmap](#15-roadmap)

---

## 1. Introducción

### 1.1 Descripción del Sistema

SIREGA es una aplicación móvil desarrollada en Flutter para la gestión integral de ganado bovino. Permite a los ganaderos llevar un registro completo de su inventario, eventos sanitarios, producción y genealogía, con soporte offline-first y sincronización automática en la nube.

### 1.2 Características Principales

- **Gestión de inventario ganadero** con más de 80 campos por animal
- **Registro de eventos sanitarios** (vacunas, tratamientos, partos, etc.)
- **Identificación por NFC** (arete electrónico) con lector móvil o ESP32
- **Sistema SINIGA** para identificación oficial en México
- **Modo offline-first** con sincronización bidireccional
- **Autenticación Firebase** (Email/Password y Google Sign-In)
- **Genealogía y trazabilidad** completa
- **Gráficos de producción** y estadísticas
- **Registro masivo de eventos** (lotes)

### 1.3 Tecnologías Utilizadas

| Categoría | Tecnología | Versión |
|-----------|------------|---------|
| Framework | Flutter | ^3.9.0 |
| Lenguaje | Dart | ^3.9.0 |
| Base de datos local | Isar | ^3.1.0+1 |
| Backend | Firebase | Suite completa |
| Estado | flutter_bloc | ^9.1.1 |
| DI | Provider | ^6.1.2 |
| NFC | flutter_nfc_kit | ^3.6.0 |
| Gráficos | fl_chart | ^1.0.0 |

### 1.4 Alcance del Manual

Este manual técnico está dirigido a:
- Desarrolladores que necesiten mantener o extender la aplicación
- Arquitectos de software que requieran entender el diseño del sistema
- DevOps que necesiten configurar el ambiente de desarrollo/producción

---

## 2. Arquitectura General

### 2.1 Patrón Arquitectónico

SIREGA implementa una **arquitectura híbrida en capas** que combina:

- **Arquitectura por Features** (módulos funcionales independientes)
- **BLoC Pattern** para gestión de estado
- **Repository Pattern** (parcialmente implementado)
- **Service Layer** para lógica de negocio compleja

```
┌─────────────────────────────────────────────────┐
│           PRESENTATION LAYER                    │
│  (Screens, Widgets, BLoCs, Forms)              │
├─────────────────────────────────────────────────┤
│           APPLICATION LAYER                     │
│  (Services, Use Cases, Business Logic)         │
├─────────────────────────────────────────────────┤
│              DATA LAYER                         │
│  (Models, DTOs, Mappers)                       │
├─────────────────────────────────────────────────┤
│          INFRASTRUCTURE LAYER                   │
│  (Isar DB, Firebase, NFC, Bluetooth)           │
└─────────────────────────────────────────────────┘
```

### 2.2 Flujo de Datos

**Operación de Lectura:**
```
UI → BLoC → Service → Isar DB → Entity → State → UI
```

**Operación de Escritura (Online):**
```
UI → BLoC → Service → Isar DB (local)
                   ↓
        Marca como pendiente
                   ↓
    ConnectionService detecta internet
                   ↓
    FirebaseSyncService → Firestore (cloud)
```

**Operación de Escritura (Offline):**
```
UI → BLoC → Service → Isar DB (local, estadoSync: pendiente)
                   ↓
        Espera conexión para sincronizar
```

### 2.3 Diagrama de Componentes

```
┌──────────────────────────────────────────────────────────────┐
│                        SIREGA APP                            │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌────────────┐  ┌────────────┐  ┌────────────┐           │
│  │  Módulo 0  │  │  Módulo 1  │  │  Módulo 2  │           │
│  │    Auth    │  │   Lista    │  │  Detalle   │  ...      │
│  └────────────┘  └────────────┘  └────────────┘           │
│         │               │               │                   │
│  ┌──────┴───────────────┴───────────────┴────────┐         │
│  │              SERVICIOS CORE                    │         │
│  │  - IsarService     - AuthService               │         │
│  │  - FirebaseSyncService  - ConnectionService    │         │
│  └────────────────────────────────────────────────┘         │
│         │                                                    │
│  ┌──────┴────────────────────────────────────────┐         │
│  │            INFRAESTRUCTURA                     │         │
│  │  - Isar DB      - Firebase      - NFC          │         │
│  └────────────────────────────────────────────────┘         │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### 2.4 Principios de Diseño

**Offline-First:**
- Todas las operaciones se ejecutan localmente primero
- La sincronización es asíncrona y no bloquea la UI
- La app es completamente funcional sin conexión

**Reactive Programming:**
- Uso extensivo de Streams para reactividad
- BLoC pattern para gestión de estado predecible
- UI se actualiza automáticamente con cambios en datos

**Separation of Concerns:**
- Cada módulo es independiente
- Servicios encapsulan lógica de negocio
- Widgets son lo más simples posible

---

## 3. Estructura del Proyecto

### 3.1 Organización de Directorios

```
lib/
├── modulos/                          # Módulos funcionales
│   ├── 0_autenticacion/
│   │   ├── aplicacion/              # BLoCs, Services
│   │   ├── dominio/                 # Entities, Interfaces
│   │   ├── datos/                   # Repositories, DTOs
│   │   └── presentacion/            # Screens, Widgets
│   ├── 1_lista_ganado/
│   ├── 2_detalle_animal/
│   ├── 3_registro_evento/
│   └── 4_escaneo_nfc/
│
├── nucleo/                           # Core compartido
│   ├── modelos/                     # Modelos de datos
│   │   ├── animal_model.dart
│   │   ├── evento_sanitario_model.dart
│   │   ├── remoto/                  # DTOs para Firebase
│   │   │   └── dtos.dart
│   │   └── enums.dart
│   ├── servicios/                   # Servicios globales
│   │   ├── isar_service.dart
│   │   ├── firebase_sync_service.dart
│   │   ├── auth_service.dart
│   │   └── connection_service.dart
│   └── utilidades/                  # Helpers, Utils
│
├── presentation/                     # Capa de presentación compartida
│   ├── forms/                       # Formularios reutilizables
│   │   └── animal_form/
│   ├── screens/                     # Pantallas generales
│   │   ├── home_screen_mejorado.dart
│   │   ├── profile_screen.dart
│   │   └── agregar_animal/
│   ├── widgets/                     # Widgets compartidos
│   │   └── home/
│   └── animations/                  # Animaciones
│
├── ui/                              # Sistema de diseño
│   ├── tema/
│   │   └── app_theme.dart
│   └── widgets_globales/
│
├── debug/                           # Herramientas de debug
│   ├── sync_debug_screen_simple.dart
│   └── check_siniga_data.dart
│
└── main.dart                        # Entry point
```

### 3.2 Convenciones de Nomenclatura

**Archivos:**
- `snake_case.dart` para todos los archivos
- `*_screen.dart` para pantallas
- `*_bloc.dart` para BLoCs
- `*_service.dart` para servicios
- `*_model.dart` para modelos
- `*_widget.dart` para widgets

**Clases:**
- `PascalCase` para nombres de clases
- Sufijos: `Screen`, `Bloc`, `Service`, `Model`, `Widget`

**Variables:**
- `camelCase` para variables y métodos
- `SCREAMING_SNAKE_CASE` para constantes
- Prefijo `_` para miembros privados

### 3.3 Dependencias por Capa

**Presentation Layer:**
```yaml
- flutter_bloc
- provider
- flutter_typeahead
- image_picker
```

**Application Layer:**
```yaml
- equatable
- uuid
- intl
```

**Data Layer:**
```yaml
- isar
- firebase_auth
- cloud_firestore
```

**Infrastructure Layer:**
```yaml
- flutter_nfc_kit
- connectivity_plus
- web_socket_channel
- path_provider
```

---

## 4. Módulos Funcionales

### 4.1 Módulo 0: Autenticación

**Ubicación:** `/lib/modulos/0_autenticacion/`

**Responsabilidad:** Gestión completa del ciclo de autenticación de usuarios.

**Componentes:**

**BLoC:**
```dart
// lib/modulos/0_autenticacion/aplicacion/auth_bloc.dart

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final FirebaseSyncService _syncService;

  // Eventos:
  // - AuthLoginRequested
  // - AuthRegisterRequested
  // - AuthGoogleLoginRequested
  // - AuthLogoutRequested
  // - AuthCheckRequested

  // Estados:
  // - AuthInitial
  // - AuthLoading
  // - AuthAuthenticated
  // - AuthUnauthenticated
  // - AuthError
}
```

**Service:**
```dart
// lib/nucleo/servicios/auth_service.dart

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> login({email, password});
  Future<UserCredential> register({email, password, displayName});
  Future<UserCredential> signInWithGoogle();
  Future<void> logout();
  bool isAuthenticated();
  User? get currentUser;
  String? get currentUserId;
}
```

**Pantallas:**
- `login_screen.dart`: Login con email/password y Google
- `register_screen.dart`: Registro de nuevos usuarios
- `auth_wrapper.dart`: Protección de rutas

**Flujo de autenticación:**
```
1. Usuario abre app
2. AuthBloc.add(AuthCheckRequested)
3. Si hay sesión guardada → AuthAuthenticated
4. Si no → AuthUnauthenticated → LoginScreen
5. Usuario ingresa credenciales
6. AuthBloc.add(AuthLoginRequested)
7. AuthService.login()
8. Si éxito:
   - AuthBloc emite AuthAuthenticated
   - FirebaseSyncService.init()
   - Navigator automático a HomeScreen
9. Si error:
   - AuthBloc emite AuthError
   - Mostrar mensaje de error
```

**Configuración de Firebase Auth:**
```dart
// Habilitado en Firebase Console:
// - Email/Password
// - Google Sign-In (SHA-1 configurado en android/app)

// Persistencia:
await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
```

---

### 4.2 Módulo 1: Lista de Ganado

**Ubicación:** `/lib/modulos/1_lista_ganado/`

**Responsabilidad:** Visualización del inventario completo de animales con filtros y búsqueda.

**BLoC:**
```dart
class CattleListBloc extends Bloc<CattleListEvent, CattleListState> {
  final IsarService _isarService;

  // Eventos:
  // - LoadCattle
  // - FilterCattle(EstadoAnimal estado)
  // - SearchCattle(String query)
  // - DeleteCattle(int animalId)

  // Estados:
  // - CattleListInitial
  // - CattleListLoading
  // - CattleListLoaded(List<Animal> animals)
  // - CattleListError(String message)
}
```

**Pantallas:**
- `cattle_list_screen.dart`: Lista principal con filtros

**Widgets:**
- `animal_card.dart`: Tarjeta de animal en lista
- `filter_chip_bar.dart`: Barra de filtros
- `search_bar.dart`: Barra de búsqueda

**Funcionalidades:**

**1. Filtros por estado:**
```dart
enum EstadoAnimal {
  activo,      // Animales en el rancho
  vendido,     // Vendidos
  muerto,      // Muertos
  perdido,     // Perdidos
  enfermo,     // Enfermos
  cuarentena,  // En cuarentena
  prestado,    // Prestados
  enTransito   // En tránsito
}
```

**2. Búsqueda local:**
```dart
// Busca por:
// - Nombre
// - ID Arete NFC
// - ID Arete Visual
// - Raza
// - SINIGA ID
```

**3. Estadísticas rápidas:**
```dart
class CattleStats {
  int total;
  int activos;
  int hembras;
  int machos;
  int gestantes;
  int enfermos;
}
```

---

### 4.3 Módulo 2: Detalle de Animal

**Ubicación:** `/lib/modulos/2_detalle_animal/`

**Responsabilidad:** Visualización detallada y edición de información de un animal.

**BLoC:**
```dart
class CattleDetailBloc extends Bloc<CattleDetailEvent, CattleDetailState> {
  final IsarService _isarService;

  // Eventos:
  // - LoadCattleDetail(int animalId)
  // - UpdateCattle(Animal animal)
  // - DeleteCattle(int animalId)
  // - LoadEvents(int animalId)
  // - LoadProduction(int animalId)

  // Estados:
  // - CattleDetailInitial
  // - CattleDetailLoading
  // - CattleDetailLoaded(Animal animal, events, production)
  // - CattleDetailError
}
```

**Pantallas:**
- `cattle_detail_screen.dart`: Pantalla principal de detalle
- `editar_animal_screen.dart`: Edición de animal

**Secciones de detalle:**

**1. Header (Custom Sliver):**
```dart
// Muestra:
// - Foto de perfil
// - Nombre
// - Estado (badge)
// - Edad
```

**2. Información básica:**
```dart
AnimatedInfoCard(
  campos: [
    'Raza': animal.raza,
    'Sexo': animal.sexo,
    'Arete NFC': animal.idAreteNFC,
    'SINIGA': animal.siniigaId?.formatoVisual,
    'Peso actual': animal.pesoActual,
  ]
)
```

**3. Estado de salud:**
```dart
HealthStatusWidget(
  estado: animal.estadoSalud,
  descripcion: animal.descripcionSalud,
  ultimaRevision: animal.fechaUltimaRevision,
)
```

**4. Gráficos de producción:**
```dart
ProductionCharts(
  pesajes: registrosPesaje,
  produccionLeche: registrosLeche,
)
// Usa fl_chart para visualización
```

**5. Historial de eventos:**
```dart
ListView(
  children: eventos.map((e) => EventCard(e)).toList()
)
```

**6. Botones de acción:**
```dart
- Editar animal
- Agregar evento
- Ver genealogía
- Eliminar (con confirmación)
```

---

### 4.4 Módulo 3: Registro de Evento

**Ubicación:** `/lib/modulos/3_registro_evento/`

**Responsabilidad:** Registro de eventos sanitarios individuales o masivos (lotes).

**Service:**
```dart
class RegistroEventoService {
  final IsarService _isarService;

  Future<void> registrarEvento({
    required TipoEvento tipo,
    required String producto,
    required DateTime fecha,
    required List<int> animalesIds,  // Permite múltiples
    double? dosis,
    String? unidadDosis,
    String? veterinario,
    String? notas,
  }) async {
    // 1. Generar UUID único para el lote
    final loteId = Uuid().v4();

    // 2. Obtener animales
    final animales = await _obtenerAnimales(animalesIds);

    // 3. Crear EventoSanitario por cada animal
    for (final animal in animales) {
      final evento = EventoSanitario()
        ..tipo = tipo
        ..fecha = fecha
        ..nombreProducto = producto
        ..dosis = dosis
        ..unidadDosis = unidadDosis
        ..veterinario = veterinario
        ..notas = notas
        ..loteId = loteId
        ..totalAnimalesLote = animales.length
        ..estadoSync = EstadoSync.pendiente;

      await _isarService.guardarEvento(evento, animal);
    }

    // 4. Crear registro de LoteEvento
    final loteEvento = LoteEvento()
      ..loteId = loteId
      ..tipo = tipo
      ..fecha = fecha
      ..nombreProducto = producto
      ..cantidadAnimales = animales.length
      ..animalesIds = animalesIds
      ..estadoSync = EstadoSync.pendiente;

    await _isarService.guardarLoteEvento(loteEvento);
  }
}
```

**Pantallas (Wizard de 4 pasos):**

**Paso 1: Tipo de evento**
```dart
// seleccionar_tipo_evento_screen.dart
// Grid de tarjetas con tipos:
// - Vacuna
// - Desparasitante
// - Tratamiento
// - Parto
// - Pesaje
// - Inseminación
// - etc.
```

**Paso 2: Selección de animales**
```dart
// seleccionar_animales_screen.dart
// Lista con checkboxes
// Permite selección múltiple
// Muestra animales activos
```

**Paso 3: Datos del evento**
```dart
// datos_evento_screen.dart
// Formulario con:
// - Producto (Autocomplete de catálogo)
// - Fecha
// - Dosis (si aplica)
// - Veterinario
// - Notas
```

**Paso 4: Confirmación**
```dart
// confirmacion_evento_screen.dart
// Resumen completo:
// - Tipo de evento
// - Cantidad de animales
// - Lista de animales
// - Datos del evento
// Botones: Confirmar / Cancelar
```

**Flujo completo:**
```
1. Usuario toca "Registrar Evento" en Home
2. Navigator.push → SeleccionarTipoEventoScreen
3. Usuario selecciona tipo (ej: Vacuna)
4. Navigator.push → SeleccionarAnimalesScreen
5. Usuario selecciona animales (ej: 25 animales)
6. Navigator.push → DatosEventoScreen
7. Usuario llena formulario
8. Navigator.push → ConfirmacionEventoScreen
9. Usuario confirma
10. RegistroEventoService.registrarEvento()
11. Se crean 25 EventoSanitario + 1 LoteEvento
12. Todos marcados como pendientes de sync
13. Navigator.popUntil → HomeScreen
14. Sincronización automática cuando hay internet
```

---

### 4.5 Módulo 4: Escaneo NFC

**Ubicación:** `/lib/modulos/4_escaneo_nfc/`

**Responsabilidad:** Identificación de animales mediante lectura de aretes NFC.

**Arquitectura:** Este módulo implementa Clean Architecture parcial.

**Estructura:**
```
4_escaneo_nfc/
├── dominio/
│   ├── entidades/
│   │   └── animal_nfc.dart
│   ├── repositorios/
│   │   ├── nfc_repository.dart        # Interface
│   │   └── esp32_repository.dart      # Interface
│   └── casos_uso/
│       ├── scan_nfc_use_case.dart
│       ├── connect_to_esp32_use_case.dart
│       └── find_animal_by_uid_use_case.dart
├── datos/
│   ├── repositorios/
│   │   ├── nfc_repository_impl.dart
│   │   └── esp32_repository_impl.dart
│   └── servicios/
│       ├── nfc_service.dart
│       └── esp32_service.dart
└── presentacion/
    ├── blocs/
    │   ├── nfc_scanner_bloc.dart
    │   └── esp32_scanner_bloc.dart
    └── pantallas/
        └── escaneo_nfc_screen.dart
```

**Use Case Example:**
```dart
// scan_nfc_use_case.dart
class ScanNfcUseCase {
  final NfcRepository repository;

  ScanNfcUseCase(this.repository);

  Future<Either<NfcFailure, String>> call() async {
    return await repository.scanNfc();
  }
}
```

**Repository Interface:**
```dart
// nfc_repository.dart
abstract class NfcRepository {
  Future<Either<NfcFailure, String>> scanNfc();
  Future<Either<NfcFailure, bool>> isNfcAvailable();
  Future<Either<NfcFailure, void>> stopSession();
}
```

**Repository Implementation:**
```dart
// nfc_repository_impl.dart
class NfcRepositoryImpl implements NfcRepository {
  final NfcService _nfcService;

  @override
  Future<Either<NfcFailure, String>> scanNfc() async {
    try {
      final uid = await _nfcService.readNfcTag();
      return Right(uid);
    } catch (e) {
      return Left(NfcReadFailure(e.toString()));
    }
  }
}
```

**BLoC:**
```dart
class NfcScannerBloc extends Bloc<NfcScannerEvent, NfcScannerState> {
  final ScanNfcUseCase scanNfcUseCase;
  final FindAnimalByUidUseCase findAnimalUseCase;

  // Estados:
  // - NfcScannerInitial
  // - NfcScannerScanning
  // - NfcScannerAnimalFound(Animal animal)
  // - NfcScannerAnimalNotFound(String uid)
  // - NfcScannerError(String message)
}
```

**Pantalla con 2 tabs:**

**Tab 1: Escáner Móvil**
```dart
// Usa el NFC nativo del teléfono
// Requiere permisos NFC
// Funciona con tags NTAG213/215/216
```

**Tab 2: Escáner Externo (ESP32)**
```dart
// Conexión WiFi/Bluetooth a ESP32
// ESP32 tiene lector RC522
// Comunicación por WebSocket
```

**Flujo de escaneo (móvil):**
```
1. Usuario toca "Escanear NFC"
2. NfcScannerBloc.add(StartNfcScan)
3. NfcService.startSession()
4. Usuario acerca teléfono al arete
5. NFC lee UID (ej: "04:1A:2B:3C:4D:5E:80")
6. FindAnimalByUidUseCase.call(uid)
7. Busca en Isar por nfcChipId
8. Si encontrado:
   - NfcScannerBloc emite NfcScannerAnimalFound
   - Navigator.push → CattleDetailScreen
9. Si no encontrado:
   - NfcScannerBloc emite NfcScannerAnimalNotFound
   - Opción de registrar nuevo animal con ese NFC
```

**Flujo de escaneo (ESP32):**
```
1. Usuario ingresa IP del ESP32 (ej: 192.168.1.100)
2. Esp32ScannerBloc.add(ConnectToEsp32)
3. Esp32Service.connect(ip)
4. WebSocket se conecta a ws://192.168.1.100/ws
5. ESP32 envía mensaje cuando lee tag: {"uid": "041A2B3C"}
6. FindAnimalByUidUseCase.call(uid)
7. Resto igual que escaneo móvil
```

---

## 5. Capa de Datos

### 5.1 Base de Datos Local - Isar

**Configuración:**
```dart
// lib/nucleo/servicios/isar_service.dart

class IsarService {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        AnimalSchema,
        EventoSanitarioSchema,
        RegistroProduccionSchema,
        HerdSchema,
        AlertaSchema,
        ConfiguracionLocalSchema,
        SyncQueueSchema,
        LoteEventoSchema,
        ProductoCatalogoSchema,
      ],
      directory: dir.path,
      inspector: true, // Habilita Isar Inspector para debugging
    );
  }

  static Future<void> poblarDatosIniciales() async {
    final count = await isar.productoCatalogos.count();
    if (count == 0) {
      await isar.writeTxn(() async {
        await isar.productoCatalogos.putAll([
          ProductoCatalogo()
            ..nombre = 'BOBACT 8'
            ..tipo = TipoEvento.vacuna
            ..descripcion = 'Prevención de carbunco bacteriano'
            ..dosisRecomendada = '5 ml'
            ..esDeSistema = true,
          // ... más productos
        ]);
      });
    }
  }
}
```

**Uso de Isar Inspector:**
```bash
# Iniciar inspector
flutter pub run isar_inspector

# O desde VS Code/Android Studio:
# Tools → Isar Inspector
```

### 5.2 Modelos de Datos (Schemas)

#### Animal Model

**Ubicación:** `/lib/nucleo/modelos/animal_model.dart`

```dart
part 'animal_model.g.dart';

@collection
class Animal {
  Id id = Isar.autoIncrement;

  // IDENTIFICACIÓN
  @Index(unique: true, caseSensitive: false)
  String? idAreteNFC;

  @Index(unique: true, caseSensitive: false)
  String? nfcChipId;  // UID puro del chip

  SinigaId? siniigaId;  // Embedded object
  String? idAreteVisual;
  String? numeroHerrado;

  // DATOS BÁSICOS
  late String nombre;

  @Enumerated(EnumType.name)
  late Sexo sexo;

  late String raza;
  late DateTime fechaNacimiento;
  double? pesoNacimiento;
  String? colorPelaje;

  // GENEALOGÍA
  final padre = IsarLink<Animal>();
  final madre = IsarLink<Animal>();
  String? razaPadre;
  String? razaMadre;

  // ESTADO
  @Enumerated(EnumType.name)
  EstadoAnimal estado = EstadoAnimal.activo;

  @Enumerated(EnumType.name)
  EstadoSalud estadoSalud = EstadoSalud.sano;

  String? descripcionSalud;  // Obligatorio si enfermo

  // REPRODUCCIÓN
  @Enumerated(EnumType.name)
  EstadoReproductivo? estadoReproductivo;

  DateTime? fechaUltimoParto;
  DateTime? fechaProximoParto;
  int numeroPartos = 0;
  bool gestante = false;
  int? diasGestacion;

  // RELACIONES (Backlinks)
  final herd = IsarLink<Herd>();

  @Backlink(to: 'animal')
  final eventos = IsarLinks<EventoSanitario>();

  @Backlink(to: 'animal')
  final producciones = IsarLinks<RegistroProduccion>();

  @Backlink(to: 'madre')
  final crias = IsarLinks<Animal>();

  // MULTIMEDIA
  List<String> fotosUrls = [];
  String? fotoPerfilUrl;
  List<String> videosUrls = [];
  List<String> documentosUrls = [];

  // SINCRONIZACIÓN
  @Index()
  String? serverId;  // ID en Firestore

  DateTime? ultimaActualizacion;

  @Enumerated(EnumType.name)
  EstadoSync estadoSync = EstadoSync.pendiente;

  int versionLocal = 1;
  String? hashDatos;

  // TIMESTAMPS
  DateTime fechaCreacion = DateTime.now();
  String? usuarioCreacion;

  // MÉTODOS DE UTILIDAD
  @ignore
  int getEdadEnMeses() {
    return DateTime.now().difference(fechaNacimiento).inDays ~/ 30;
  }

  @ignore
  int getEdadEnDias() {
    return DateTime.now().difference(fechaNacimiento).inDays;
  }

  @ignore
  String getEdadFormateada() {
    final meses = getEdadEnMeses();
    if (meses < 12) return '$meses meses';
    final anos = meses ~/ 12;
    final mesesRestantes = meses % 12;
    if (mesesRestantes == 0) return '$anos año${anos > 1 ? 's' : ''}';
    return '$anos año${anos > 1 ? 's' : ''} $mesesRestantes mes${mesesRestantes > 1 ? 'es' : ''}';
  }

  @ignore
  bool necesitaVacunacion() {
    // Lógica de verificación
    return false; // TODO: Implementar
  }
}
```

**Generar código:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

#### SinigaId (Embedded Object)

**Ubicación:** `/lib/nucleo/modelos/siniga_model.dart`

```dart
@embedded
class SinigaId {
  String? especie;        // "00" para bovinos
  String? estadoClave;    // "01" a "32" (estados de México)
  String? numeroNacional; // 8 dígitos

  @ignore
  String get formatoVisual {
    if (especie == null || estadoClave == null || numeroNacional == null) {
      return '';
    }
    return '$especie-$estadoClave-$numeroNacional';
  }

  @ignore
  bool get esValidoBasico {
    return especie == '00' &&
           estadoClave != null &&
           estadoClave!.length == 2 &&
           numeroNacional != null &&
           numeroNacional!.length == 8 &&
           RegExp(r'^\d{8}$').hasMatch(numeroNacional!);
  }

  static Future<bool> esEstadoValido(String clave) async {
    final estados = await _cargarEstados();
    return estados.containsKey(clave);
  }

  static Map<String, String>? _estadosCache;

  static Future<Map<String, String>> _cargarEstados() async {
    if (_estadosCache != null) return _estadosCache!;

    final String data = await rootBundle.loadString(
      'assets/data/estados_mexico.json'
    );
    final List<dynamic> estadosJson = json.decode(data);

    _estadosCache = {};
    for (var estado in estadosJson) {
      _estadosCache![estado['clave']] = estado['nombre'];
    }

    return _estadosCache!;
  }

  static Future<List<EstadoMexico>> getEstadosParaDropdown() async {
    final estados = await _cargarEstados();
    return estados.entries
        .map((e) => EstadoMexico(clave: e.key, nombre: e.value))
        .toList();
  }
}

class EstadoMexico {
  final String clave;
  final String nombre;
  EstadoMexico({required this.clave, required this.nombre});
}
```

**Catálogo de estados:**
```json
// assets/data/estados_mexico.json
[
  {"clave": "01", "nombre": "Aguascalientes"},
  {"clave": "02", "nombre": "Baja California"},
  ...
  {"clave": "32", "nombre": "Zacatecas"}
]
```

**Configuración en pubspec.yaml:**
```yaml
flutter:
  assets:
    - assets/data/
```

### 5.3 DTOs (Data Transfer Objects)

**Ubicación:** `/lib/nucleo/modelos/remoto/dtos.dart`

**Propósito:** Serialización/deserialización para Firebase Firestore.

```dart
class CattleDto {
  final String visualId;
  final String name;
  final String breed;
  final DateTime birthDate;
  final String gender;
  final String status;
  final SinigaIdDto? siniigaId;
  final String? profilePhotoUrl;

  const CattleDto({...});

  Map<String, dynamic> toJson() => {
    'visualId': visualId,
    'name': name,
    'breed': breed,
    'birthDate': Timestamp.fromDate(birthDate),
    'gender': gender,
    'status': status,
    'siniigaId': siniigaId?.toJson(),
    'profilePhotoUrl': profilePhotoUrl,
  };

  static CattleDto fromJson(Map<String, dynamic> json) => CattleDto(
    visualId: json['visualId'] ?? '',
    name: json['name'] ?? '',
    breed: json['breed'] ?? '',
    birthDate: (json['birthDate'] as Timestamp).toDate(),
    gender: json['gender'] ?? 'hembra',
    status: json['status'] ?? 'activo',
    siniigaId: json['siniigaId'] != null
        ? SinigaIdDto.fromJson(json['siniigaId'])
        : null,
    profilePhotoUrl: json['profilePhotoUrl'],
  );
}
```

**DTOs definidos:**
- `UserDto`
- `HerdDto`
- `CattleDto`
- `HealthRecordDto`
- `GenealogyDto`
- `ProductionRecordDto`
- `SinigaIdDto`

### 5.4 Enumeraciones

**Ubicación:** `/lib/nucleo/modelos/enums.dart`

```dart
enum Sexo {
  macho,
  hembra,
  castrado
}

enum EstadoAnimal {
  activo,
  vendido,
  muerto,
  perdido,
  enfermo,
  cuarentena,
  prestado,
  enTransito
}

enum EstadoSalud {
  sano,
  enfermo,
  convaleciente,
  critico,
  enTratamiento,
  enObservacion
}

enum EstadoReproductivo {
  virgen,
  servida,
  gestante,
  lactante,
  seca,
  descarte,
  reproductorActivo,
  reproductorInactivo
}

enum TipoEvento {
  vacuna,
  desparasitante,
  tratamiento,
  parto,
  pesaje,
  inseminacion,
  diagnosticoGestacion,
  castracion,
  descorne,
  herraje,
  revisionVeterinaria,
  muestraLaboratorio,
  cambioAlimentacion,
  movimiento,
  venta,
  compra,
  muerte,
  otro
}

enum Prioridad {
  baja,
  media,
  alta,
  critica,
  urgente
}

enum EstadoSync {
  pendiente,
  enProceso,
  completado,
  error,
  conflicto,
  cancelado
}

enum TipoAlerta {
  vacunacion,
  desparasitacion,
  parto,
  tratamiento,
  pesaje,
  revision,
  stockBajo,
  documentoVencido,
  sincronizacion,
  sistema,
  personalizada
}

enum EstadoAlerta {
  activa,
  leida,
  procesada,
  pospuesta,
  cancelada,
  expirada
}
```

**Uso en queries:**
```dart
// Filtrar por estado
final animalesActivos = await isar.animals
    .filter()
    .estadoEqualTo(EstadoAnimal.activo)
    .findAll();

// Filtrar por sexo
final hembras = await isar.animals
    .filter()
    .sexoEqualTo(Sexo.hembra)
    .findAll();
```

---

## 6. Servicios Core

### 6.1 IsarService

**Ubicación:** `/lib/nucleo/servicios/isar_service.dart`

**Responsabilidad:** Gestión completa de la base de datos local.

**API Completa:**

```dart
class IsarService {
  static late Isar isar;

  // ========== INICIALIZACIÓN ==========
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([...schemas], directory: dir.path);
  }

  static Future<void> poblarDatosIniciales() async {
    // Poblar catálogo de productos
  }

  // ========== ANIMAL ==========
  Future<int> guardarAnimal(Animal animal) async {
    return await isar.writeTxn(() async {
      animal.ultimaActualizacion = DateTime.now();
      return await isar.animals.put(animal);
    });
  }

  Future<List<Animal>> obtenerTodosLosAnimales() async {
    return await isar.animals.where().findAll();
  }

  Future<List<Animal>> obtenerAnimalesActivos() async {
    return await isar.animals
        .filter()
        .estadoEqualTo(EstadoAnimal.activo)
        .findAll();
  }

  Future<Animal?> obtenerAnimalPorId(int id) async {
    return await isar.animals.get(id);
  }

  Future<Animal?> obtenerAnimalPorNfc(String nfcId) async {
    final normalizado = _normalizarNfcId(nfcId);
    return await isar.animals
        .where()
        .filter()
        .nfcChipIdEqualTo(normalizado, caseSensitive: false)
        .findFirst();
  }

  Future<Animal?> obtenerAnimalPorAreteVisual(String arete) async {
    return await isar.animals
        .where()
        .filter()
        .idAreteVisualEqualTo(arete, caseSensitive: false)
        .findFirst();
  }

  Future<List<Animal>> obtenerAnimalesPorEstado(EstadoAnimal estado) async {
    return await isar.animals
        .filter()
        .estadoEqualTo(estado)
        .findAll();
  }

  Future<List<Animal>> obtenerAnimalesGestantes() async {
    return await isar.animals
        .filter()
        .gestanteEqualTo(true)
        .findAll();
  }

  Future<bool> eliminarAnimal(int id) async {
    return await isar.writeTxn(() async {
      return await isar.animals.delete(id);
    });
  }

  Stream<List<Animal>> observarAnimales() {
    return isar.animals.where().watch(fireImmediately: true);
  }

  Stream<Animal?> observarAnimal(int id) {
    return isar.animals.watchObject(id, fireImmediately: true);
  }

  // ========== EVENTOS SANITARIOS ==========
  Future<void> guardarEvento(EventoSanitario evento, Animal animal) async {
    await isar.writeTxn(() async {
      // Guardar evento
      await isar.eventoSanitarios.put(evento);

      // Relacionar con animal
      evento.animal.value = animal;
      await evento.animal.save();

      // Actualizar fecha última revisión del animal
      animal.fechaUltimaRevision = evento.fecha;
      animal.estadoSync = EstadoSync.pendiente;
      await isar.animals.put(animal);
    });
  }

  Future<List<EventoSanitario>> obtenerEventosPorAnimal(int animalId) async {
    final animal = await isar.animals.get(animalId);
    if (animal == null) return [];

    await animal.eventos.load();
    return animal.eventos.toList();
  }

  Future<List<EventoSanitario>> obtenerEventosPorTipo(TipoEvento tipo) async {
    return await isar.eventoSanitarios
        .filter()
        .tipoEqualTo(tipo)
        .findAll();
  }

  // ========== PRODUCCIÓN ==========
  Future<void> guardarRegistroProduccion(
    RegistroProduccion registro,
    Animal animal
  ) async {
    await isar.writeTxn(() async {
      await isar.registroProduccions.put(registro);
      registro.animal.value = animal;
      await registro.animal.save();

      animal.estadoSync = EstadoSync.pendiente;
      await isar.animals.put(animal);
    });
  }

  Future<List<RegistroProduccion>> obtenerProduccionPorAnimal(
    int animalId
  ) async {
    final animal = await isar.animals.get(animalId);
    if (animal == null) return [];

    await animal.producciones.load();
    return animal.producciones.toList();
  }

  // ========== HERDS ==========
  Future<void> guardarHerd(Herd herd) async {
    await isar.writeTxn(() async {
      herd.ultimaActualizacion = DateTime.now();
      await isar.herds.put(herd);
    });
  }

  Future<List<Herd>> obtenerTodosLosHerds() async {
    return await isar.herds.where().findAll();
  }

  Future<Herd?> obtenerHerdPorId(int id) async {
    return await isar.herds.get(id);
  }

  // ========== CATÁLOGO DE PRODUCTOS ==========
  Future<List<ProductoCatalogo>> obtenerProductosPorTipo(
    TipoEvento tipo
  ) async {
    return await isar.productoCatalogos
        .filter()
        .tipoEqualTo(tipo)
        .findAll();
  }

  Future<List<ProductoCatalogo>> obtenerTodosLosProductos() async {
    return await isar.productoCatalogos.where().findAll();
  }

  Future<void> agregarProducto(ProductoCatalogo producto) async {
    await isar.writeTxn(() async {
      await isar.productoCatalogos.put(producto);
    });
  }

  // ========== LOTE EVENTO ==========
  Future<void> guardarLoteEvento(LoteEvento lote) async {
    await isar.writeTxn(() async {
      await isar.loteEventos.put(lote);
    });
  }

  Future<List<LoteEvento>> obtenerTodosLosLotes() async {
    return await isar.loteEventos.where().findAll();
  }

  // ========== ESTADÍSTICAS ==========
  Future<Map<String, int>> obtenerEstadisticas() async {
    final total = await isar.animals.count();
    final activos = await isar.animals
        .filter()
        .estadoEqualTo(EstadoAnimal.activo)
        .count();
    final hembras = await isar.animals
        .filter()
        .sexoEqualTo(Sexo.hembra)
        .count();
    final machos = await isar.animals
        .filter()
        .sexoEqualTo(Sexo.macho)
        .count();
    final gestantes = await isar.animals
        .filter()
        .gestanteEqualTo(true)
        .count();

    return {
      'total': total,
      'activos': activos,
      'hembras': hembras,
      'machos': machos,
      'gestantes': gestantes,
    };
  }

  // ========== UTILIDADES ==========
  String _normalizarNfcId(String nfcId) {
    return nfcId
        .replaceAll(':', '')
        .replaceAll(' ', '')
        .replaceAll('-', '')
        .toUpperCase();
  }
}
```

### 6.2 FirebaseSyncService

**Ubicación:** `/lib/nucleo/servicios/firebase_sync_service.dart`

**Responsabilidad:** Sincronización bidireccional Isar ↔ Firestore.

**Arquitectura de sincronización:**

```
LOCAL (Isar)                      CLOUD (Firestore)
─────────────                     ─────────────────
    │                                     │
    │  1. Usuario crea/modifica animal   │
    │     estadoSync = pendiente          │
    │                                     │
    │  2. ConnectionService               │
    │     detecta internet                │
    │                                     │
    │  3. syncPendingChanges() ──────────>│
    │                                     │
    │     - Obtiene registros pendientes  │
    │     - Convierte a Map (DTO)         │
    │     - Sube a Firestore              │
    │     - Actualiza serverId            │
    │     - estadoSync = completado       │
    │                                     │
    │  4. Listeners en tiempo real        │
    │<────────────────────────────────────│
    │     - Detecta cambio remoto         │
    │     - Compara timestamps            │
    │     - Si remoto más reciente:       │
    │       actualiza local               │
    │                                     │
```

**API:**

```dart
class FirebaseSyncService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final IsarService _isarService;

  // Listeners
  StreamSubscription? _cattleListener;
  StreamSubscription? _eventsListener;
  StreamSubscription? _productionsListener;

  // Callbacks
  Function(String message)? onSyncStart;
  Function(String message)? onSyncComplete;
  Function(String error)? onSyncError;

  // ========== INICIALIZACIÓN ==========
  Future<void> init() async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('Usuario no autenticado');

    await syncInitial();
    _setupListeners(user.uid);
  }

  // ========== SINCRONIZACIÓN INICIAL ==========
  Future<void> syncInitial() async {
    onSyncStart?.call('Descargando datos...');

    try {
      await _downloadCattle();
      await _downloadEvents();
      await _downloadProductions();
      await _downloadHerds();
      await _downloadBatchEvents();

      onSyncComplete?.call('Sincronización completada');
    } catch (e) {
      onSyncError?.call('Error en sincronización: $e');
      rethrow;
    }
  }

  Future<void> _downloadCattle() async {
    final userId = _auth.currentUser!.uid;
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('cattle')
        .get();

    for (final doc in snapshot.docs) {
      await _createOrUpdateLocalAnimal(doc.id, doc.data());
    }
  }

  Future<void> _createOrUpdateLocalAnimal(
    String serverId,
    Map<String, dynamic> data
  ) async {
    // Buscar animal local por serverId
    final existing = await isar.animals
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt = (data['ultimaActualizacion'] as Timestamp).toDate();

    // Resolución de conflictos: Last-Write-Wins
    if (existing != null &&
        existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {
      return; // Local más reciente, ignorar cambio remoto
    }

    // Crear o actualizar
    final animal = existing ?? Animal();

    // Mapear campos
    animal.serverId = serverId;
    animal.nombre = data['nombre'] ?? '';
    animal.sexo = _parseSexo(data['sexo']);
    animal.raza = data['raza'] ?? '';
    animal.fechaNacimiento = (data['fechaNacimiento'] as Timestamp).toDate();
    // ... más campos

    animal.ultimaActualizacion = remoteUpdatedAt;
    animal.estadoSync = EstadoSync.completado;

    await _isarService.guardarAnimal(animal);
  }

  // ========== SINCRONIZACIÓN DE CAMBIOS PENDIENTES ==========
  Future<void> syncPendingChanges() async {
    onSyncStart?.call('Sincronizando cambios...');

    try {
      await _uploadPendingAnimals();
      await _uploadPendingEvents();
      await _uploadPendingProductions();
      await _uploadPendingHerds();
      await _uploadPendingBatchEvents();

      onSyncComplete?.call('Cambios sincronizados');
    } catch (e) {
      onSyncError?.call('Error: $e');
      rethrow;
    }
  }

  Future<void> _uploadPendingAnimals() async {
    final userId = _auth.currentUser!.uid;

    final pendientes = await isar.animals
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .findAll();

    for (final animal in pendientes) {
      try {
        final data = _animalToMap(animal);

        if (animal.serverId == null) {
          // Crear nuevo documento
          final docRef = await _firestore
              .collection('users')
              .doc(userId)
              .collection('cattle')
              .add(data);

          animal.serverId = docRef.id;
        } else {
          // Actualizar existente
          await _firestore
              .collection('users')
              .doc(userId)
              .collection('cattle')
              .doc(animal.serverId!)
              .set(data, SetOptions(merge: true));
        }

        // Marcar como completado
        animal.estadoSync = EstadoSync.completado;
        await isar.writeTxn(() => isar.animals.put(animal));
      } catch (e) {
        animal.estadoSync = EstadoSync.error;
        await isar.writeTxn(() => isar.animals.put(animal));
      }
    }
  }

  Map<String, dynamic> _animalToMap(Animal animal) {
    // Mapear SinigaId
    Map<String, dynamic>? siniigaData;
    if (animal.siniigaId != null) {
      final siniga = animal.siniigaId!;
      if (siniga.especie != null &&
          siniga.estadoClave != null &&
          siniga.numeroNacional != null) {
        siniigaData = {
          'especie': siniga.especie,
          'estadoClave': siniga.estadoClave,
          'numeroNacional': siniga.numeroNacional,
        };
      }
    }

    return {
      'nombre': animal.nombre,
      'sexo': animal.sexo.name,
      'raza': animal.raza,
      'fechaNacimiento': Timestamp.fromDate(animal.fechaNacimiento),
      'pesoNacimiento': animal.pesoNacimiento,
      'estado': animal.estado.name,
      'estadoSalud': animal.estadoSalud.name,
      'siniigaId': siniigaData,
      'nfcChipId': animal.nfcChipId,
      'idAreteVisual': animal.idAreteVisual,
      'colorPelaje': animal.colorPelaje,
      'gestante': animal.gestante,
      'numeroPartos': animal.numeroPartos,
      'fotosUrls': animal.fotosUrls,
      'fotoPerfilUrl': animal.fotoPerfilUrl,
      'ultimaActualizacion': Timestamp.fromDate(
        animal.ultimaActualizacion ?? DateTime.now()
      ),
    };
  }

  // ========== LISTENERS EN TIEMPO REAL ==========
  void _setupListeners(String userId) {
    // Listener de cattle
    _cattleListener = _firestore
        .collection('users')
        .doc(userId)
        .collection('cattle')
        .snapshots()
        .listen((snapshot) {
      for (final change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified) {
          _createOrUpdateLocalAnimal(change.doc.id, change.doc.data()!);
        }
      }
    });

    // Listeners de eventos y producción...
  }

  // ========== GESTIÓN ==========
  Future<int> getPendingCount() async {
    return await isar.animals
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .count();
  }

  Future<void> deleteAllUserDataFromFirestore() async {
    final userId = _auth.currentUser!.uid;

    // Eliminar todas las subcolecciones
    await _deleteCattleCollection(userId);
    await _deleteEventsCollection(userId);
    await _deleteProductionsCollection(userId);
    await _deleteHerdsCollection(userId);
  }

  void dispose() {
    _cattleListener?.cancel();
    _eventsListener?.cancel();
    _productionsListener?.cancel();
  }
}
```

### 6.3 AuthService

Ya documentado en Módulo 0 (ver sección 4.1).

### 6.4 ConnectionService

**Ubicación:** `/lib/nucleo/servicios/connection_service.dart`

**Responsabilidad:** Monitoreo de conectividad a internet.

```dart
class ConnectionService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _subscription;

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  Function? onConnected;
  Function? onDisconnected;

  Future<void> init() async {
    // Verificar estado inicial
    final result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);

    // Escuchar cambios
    _subscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus
    );
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    final wasConnected = _isConnected;
    _isConnected = result != ConnectivityResult.none;

    if (_isConnected && !wasConnected) {
      debugPrint('🌐 Conexión detectada');
      onConnected?.call();
    } else if (!_isConnected && wasConnected) {
      debugPrint('📵 Sin conexión');
      onDisconnected?.call();
    }
  }

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  String getConnectionType() {
    // Retorna: 'wifi', 'mobile', 'none'
  }

  void dispose() {
    _subscription?.cancel();
  }
}
```

**Uso en main.dart:**
```dart
final connectionService = ConnectionService();
await connectionService.init();

connectionService.onConnected = () async {
  debugPrint('Internet detectado - Iniciando sincronización...');
  await syncService.syncPendingChanges();
};

connectionService.onDisconnected = () {
  debugPrint('Sin internet - Trabajando offline');
};
```

---

## 7. Integración con Firebase

### 7.1 Configuración Inicial

**1. Crear proyecto en Firebase Console:**
```
1. Ir a https://console.firebase.google.com/
2. Crear nuevo proyecto "SIREGA"
3. Habilitar Google Analytics (opcional)
```

**2. Configurar Android:**
```bash
# Instalar FlutterFire CLI
dart pub global activate flutterfire_cli

# Configurar
flutterfire configure

# Seleccionar:
# - Proyecto: SIREGA
# - Plataformas: android, ios
# - Package name: com.sirega.app
```

**Esto genera:**
- `/android/app/google-services.json`
- `/lib/firebase_options.dart`

**3. Habilitar servicios en Firebase Console:**

**Authentication:**
- Email/Password ✓
- Google Sign-In ✓
  - Configurar SHA-1 para Android

**Firestore:**
- Crear base de datos en modo "production"
- Ubicación: us-central1
- Reglas de seguridad (ver sección 7.4)

**Storage:**
- Crear bucket predeterminado
- Configurar reglas

### 7.2 Inicialización en App

**main.dart:**
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configurar persistencia
  await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

  // Configurar Firestore offline
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  runApp(MyApp());
}
```

### 7.3 Estructura de Firestore

```
/users/{userId}
  /cattle/{animalId}
    - nombre: string
    - sexo: string
    - raza: string
    - fechaNacimiento: timestamp
    - siniigaId: map
      - especie: string
      - estadoClave: string
      - numeroNacional: string
    - nfcChipId: string
    - estado: string
    - estadoSalud: string
    - gestante: boolean
    - numeroPartos: number
    - fotosUrls: array
    - fotoPerfilUrl: string
    - ultimaActualizacion: timestamp

  /events/{eventId}
    - tipo: string
    - fecha: timestamp
    - nombreProducto: string
    - dosis: number
    - unidadDosis: string
    - veterinario: string
    - notas: string
    - animalId: string (referencia a cattle)
    - loteId: string (UUID)
    - totalAnimalesLote: number
    - ultimaActualizacion: timestamp

  /productions/{productionId}
    - tipo: string
    - fecha: timestamp
    - pesoKg: number
    - litrosPorDia: number
    - animalId: string
    - ultimaActualizacion: timestamp

  /herds/{herdId}
    - nombre: string
    - estado: string
    - municipio: string
    - totalCattleCount: number
    - ultimaActualizacion: timestamp

  /batch_events/{batchId}
    - loteId: string
    - tipo: string
    - fecha: timestamp
    - nombreProducto: string
    - cantidadAnimales: number
    - animalesIds: array<number>
    - ultimaActualizacion: timestamp
```

### 7.4 Reglas de Seguridad

**Firestore Security Rules:**
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Helper function: usuario autenticado
    function isAuthenticated() {
      return request.auth != null;
    }

    // Helper function: es el dueño de los datos
    function isOwner(userId) {
      return isAuthenticated() && request.auth.uid == userId;
    }

    // Regla para usuarios
    match /users/{userId} {
      // Solo el usuario puede leer/escribir sus datos
      allow read, write: if isOwner(userId);

      // Subcolecciones heredan las reglas del padre
      match /{document=**} {
        allow read, write: if isOwner(userId);
      }
    }
  }
}
```

**Firebase Storage Rules:**
```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /users/{userId}/{allPaths=**} {
      allow read, write: if request.auth != null &&
                           request.auth.uid == userId;
    }
  }
}
```

### 7.5 Índices Compuestos

**Crear en Firebase Console o automáticamente cuando se lanza query:**

```
Collection: cattle
Fields:
  - estado (Ascending)
  - fechaNacimiento (Descending)

Collection: events
Fields:
  - animalId (Ascending)
  - fecha (Descending)

Collection: events
Fields:
  - tipo (Ascending)
  - fecha (Descending)
```

### 7.6 Límites y Cuotas

**Spark Plan (Gratis):**
- Firestore: 1 GB almacenamiento, 10 GB/mes transferencia
- Auth: Usuarios ilimitados
- Storage: 5 GB

**Blaze Plan (Pay as you go):**
- Costos según uso
- Recomendado para producción

**Optimizaciones:**
- Limitar tamaño de fotosUrls (comprimir imágenes)
- Usar paginación en queries grandes
- Cachear datos frecuentes en Isar

---

## 8. Sistema de Sincronización

### 8.1 Estrategia: Offline-First

**Principio:** La app funciona completamente sin internet, sincronizando cuando hay conexión.

**Flujo:**

```
┌──────────────────────────────────────────────────┐
│  1. OPERACIÓN LOCAL (Siempre funciona)           │
├──────────────────────────────────────────────────┤
│  - Usuario crea/modifica animal                  │
│  - Se guarda en Isar inmediatamente              │
│  - animal.estadoSync = EstadoSync.pendiente      │
│  - UI se actualiza instantáneamente              │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│  2. DETECCIÓN DE CONEXIÓN                        │
├──────────────────────────────────────────────────┤
│  - ConnectionService escucha cambios de red      │
│  - Cuando detecta WiFi/Datos móviles:            │
│    → Dispara onConnected callback                │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│  3. SINCRONIZACIÓN AUTOMÁTICA                    │
├──────────────────────────────────────────────────┤
│  - FirebaseSyncService.syncPendingChanges()      │
│  - Obtiene todos los registros con               │
│    estadoSync == pendiente                       │
│  - Los sube a Firestore                          │
│  - Actualiza serverId local                      │
│  - Marca estadoSync = completado                 │
└──────────────────────────────────────────────────┘
                    ↓
┌──────────────────────────────────────────────────┐
│  4. LISTENERS EN TIEMPO REAL                     │
├──────────────────────────────────────────────────┤
│  - Firestore snapshots() escuchan cambios        │
│  - Cuando otro dispositivo modifica:             │
│    → Descarga cambio                             │
│    → Compara timestamps                          │
│    → Actualiza local si remoto es más reciente   │
└──────────────────────────────────────────────────┘
```

### 8.2 Resolución de Conflictos

**Estrategia: Last-Write-Wins (LWW)**

```dart
Future<void> _createOrUpdateLocalAnimal(
  String serverId,
  Map<String, dynamic> data
) async {
  final existing = await isar.animals
      .filter()
      .serverIdEqualTo(serverId)
      .findFirst();

  final remoteUpdatedAt = (data['ultimaActualizacion'] as Timestamp).toDate();

  // RESOLUCIÓN DE CONFLICTOS
  if (existing != null &&
      existing.ultimaActualizacion != null &&
      existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {

    debugPrint('⚠️ Conflicto detectado: Local más reciente');
    debugPrint('   Local: ${existing.ultimaActualizacion}');
    debugPrint('   Remoto: $remoteUpdatedAt');
    debugPrint('   Acción: Mantener versión local');

    return; // NO actualizar, mantener versión local
  }

  // Caso contrario: Aceptar cambio remoto
  debugPrint('✅ Actualizando con versión remota');

  // Actualizar campos...
}
```

**Casos de conflicto:**

**Escenario 1: Edición simultánea en 2 dispositivos**
```
Dispositivo A (offline):
- 10:00 - Modifica animal "Vaca 001"
- 10:05 - Se conecta a internet
- 10:05 - Sube cambio (timestamp: 10:00)

Dispositivo B (online):
- 10:03 - Modifica mismo animal
- 10:03 - Sube cambio (timestamp: 10:03)

Resultado:
- Firestore tiene versión de B (10:03)
- A intenta subir su versión (10:00)
- Firestore rechaza (versión más antigua)
- A descarga versión de B
- PIERDE cambios de A ❌
```

**Escenario 2: Con resolución LWW**
```
Dispositivo A:
- 10:00 - Modifica animal
- 10:05 - Intenta sincronizar
- 10:05 - Listener detecta versión remota (10:03)
- 10:05 - Compara: Local (10:00) < Remoto (10:03)
- 10:05 - Acepta versión remota

Dispositivo B:
- 10:03 - Modifica animal
- 10:03 - Sincroniza inmediatamente
- Gana B (más reciente) ✓
```

**Limitaciones:**
- No hay merge automático de campos
- Cambios del timestamp menor se pierden
- Usuarios deben ser notificados de conflictos (TODO)

**Mejoras futuras:**
- Merge a nivel de campo (field-level conflict resolution)
- Versionado de documentos
- UI para resolución manual

### 8.3 Indicadores de Sincronización

**UI de sincronización:**

```dart
class SyncStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _getPendingCountStream(),
      builder: (context, snapshot) {
        final pendingCount = snapshot.data ?? 0;

        return Card(
          child: ListTile(
            leading: Icon(
              pendingCount > 0
                  ? Icons.cloud_upload
                  : Icons.cloud_done,
              color: pendingCount > 0
                  ? Colors.orange
                  : Colors.green,
            ),
            title: Text(
              pendingCount > 0
                  ? 'Cambios pendientes: $pendingCount'
                  : 'Todo sincronizado'
            ),
            trailing: pendingCount > 0
                ? IconButton(
                    icon: Icon(Icons.sync),
                    onPressed: () {
                      syncService.syncPendingChanges();
                    },
                  )
                : null,
          ),
        );
      },
    );
  }

  Stream<int> _getPendingCountStream() {
    return isar.animals
        .where()
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .watch()
        .map((animals) => animals.length);
  }
}
```

**Estados de sincronización:**
```dart
enum EstadoSync {
  pendiente,   // Cambio local no subido
  enProceso,   // Subiendo actualmente
  completado,  // Sincronizado correctamente
  error,       // Error al sincronizar
  conflicto,   // Conflicto detectado (futuro)
  cancelado    // Usuario canceló
}
```

### 8.4 Manejo de Errores

**Errores comunes:**

**1. Sin conexión:**
```dart
try {
  await syncService.syncPendingChanges();
} catch (e) {
  if (e is NetworkException) {
    // UI: Mostrar "Sin conexión, se sincronizará automáticamente"
    return;
  }
  rethrow;
}
```

**2. Timeout:**
```dart
await syncService.syncPendingChanges()
    .timeout(Duration(seconds: 30), onTimeout: () {
  throw TimeoutException('La sincronización está tardando demasiado');
});
```

**3. Permisos denegados:**
```dart
try {
  await firestore.collection('users').doc(uid).set(data);
} on FirebaseException catch (e) {
  if (e.code == 'permission-denied') {
    // Usuario no autenticado o reglas incorrectas
    await authService.logout();
  }
}
```

**4. Cuota excedida:**
```dart
if (e.code == 'resource-exhausted') {
  // Pausar sincronización
  // Notificar administrador
}
```

---

## 9. Gestión de Estado

### 9.1 BLoC Pattern

**Arquitectura:**

```
┌────────────────────────────────────────┐
│              WIDGET                    │
│  (Presentation Layer)                  │
├────────────────────────────────────────┤
│                                        │
│  BlocBuilder / BlocListener            │
│         │              ↑                │
│         │ dispatch     │ emit           │
│         ↓ event        │ state          │
│                                        │
│      ┌──────────────────────────┐     │
│      │         BLOC             │     │
│      │  (Business Logic)        │     │
│      └──────────────────────────┘     │
│                ↓                       │
│         ┌─────────────┐                │
│         │   Service   │                │
│         │   (Data)    │                │
│         └─────────────┘                │
└────────────────────────────────────────┘
```

**Estructura de un BLoC:**

```dart
// 1. EVENTOS (User Actions)
abstract class CattleListEvent {}

class LoadCattle extends CattleListEvent {}

class FilterCattle extends CattleListEvent {
  final EstadoAnimal estado;
  FilterCattle(this.estado);
}

class SearchCattle extends CattleListEvent {
  final String query;
  SearchCattle(this.query);
}

class DeleteCattle extends CattleListEvent {
  final int animalId;
  DeleteCattle(this.animalId);
}

// 2. ESTADOS (UI States)
abstract class CattleListState {}

class CattleListInitial extends CattleListState {}

class CattleListLoading extends CattleListState {}

class CattleListLoaded extends CattleListState {
  final List<Animal> animals;
  final EstadoAnimal? filtroActual;

  CattleListLoaded(this.animals, {this.filtroActual});

  // Para comparación en BlocBuilder
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CattleListLoaded &&
          runtimeType == other.runtimeType &&
          const ListEquality().equals(animals, other.animals);

  @override
  int get hashCode => animals.hashCode;
}

class CattleListError extends CattleListState {
  final String message;
  CattleListError(this.message);
}

// 3. BLOC (Business Logic)
class CattleListBloc extends Bloc<CattleListEvent, CattleListState> {
  final IsarService _isarService;
  StreamSubscription? _animalsSubscription;

  CattleListBloc(this._isarService) : super(CattleListInitial()) {
    on<LoadCattle>(_onLoadCattle);
    on<FilterCattle>(_onFilterCattle);
    on<SearchCattle>(_onSearchCattle);
    on<DeleteCattle>(_onDeleteCattle);
  }

  Future<void> _onLoadCattle(
    LoadCattle event,
    Emitter<CattleListState> emit,
  ) async {
    emit(CattleListLoading());

    try {
      // Usar Stream para reactividad
      await _animalsSubscription?.cancel();
      _animalsSubscription = _isarService.observarAnimales().listen(
        (animals) {
          emit(CattleListLoaded(animals));
        },
        onError: (error) {
          emit(CattleListError(error.toString()));
        },
      );
    } catch (e) {
      emit(CattleListError('Error al cargar ganado: $e'));
    }
  }

  Future<void> _onFilterCattle(
    FilterCattle event,
    Emitter<CattleListState> emit,
  ) async {
    emit(CattleListLoading());

    try {
      final animals = await _isarService.obtenerAnimalesPorEstado(event.estado);
      emit(CattleListLoaded(animals, filtroActual: event.estado));
    } catch (e) {
      emit(CattleListError('Error al filtrar: $e'));
    }
  }

  Future<void> _onDeleteCattle(
    DeleteCattle event,
    Emitter<CattleListState> emit,
  ) async {
    try {
      await _isarService.eliminarAnimal(event.animalId);
      // No emitir estado, el Stream automático actualizará
    } catch (e) {
      emit(CattleListError('Error al eliminar: $e'));
    }
  }

  @override
  Future<void> close() {
    _animalsSubscription?.cancel();
    return super.close();
  }
}
```

**Uso en UI:**

```dart
class CattleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CattleListBloc(
        RepositoryProvider.of<IsarService>(context),
      )..add(LoadCattle()), // Cargar datos iniciales
      child: Scaffold(
        appBar: AppBar(title: Text('Ganado')),
        body: BlocBuilder<CattleListBloc, CattleListState>(
          builder: (context, state) {
            if (state is CattleListLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is CattleListError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 64, color: Colors.red),
                    SizedBox(height: 16),
                    Text(state.message),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CattleListBloc>().add(LoadCattle());
                      },
                      child: Text('Reintentar'),
                    ),
                  ],
                ),
              );
            }

            if (state is CattleListLoaded) {
              if (state.animals.isEmpty) {
                return Center(
                  child: Text('No hay animales registrados'),
                );
              }

              return ListView.builder(
                itemCount: state.animals.length,
                itemBuilder: (context, index) {
                  final animal = state.animals[index];
                  return AnimalCard(
                    animal: animal,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CattleDetailScreen(
                            animalId: animal.id,
                          ),
                        ),
                      );
                    },
                    onDelete: () {
                      context.read<CattleListBloc>().add(
                        DeleteCattle(animal.id),
                      );
                    },
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

### 9.2 Provider Pattern (Dependency Injection)

**Configuración en main.dart:**

```dart
void main() async {
  // ... inicialización

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IsarService>.value(value: isarService),
        RepositoryProvider<AuthService>.value(value: authService),
        RepositoryProvider<FirebaseSyncService>.value(value: syncService),
        RepositoryProvider<ConnectionService>.value(value: connectionService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              RepositoryProvider.of<AuthService>(context),
              RepositoryProvider.of<FirebaseSyncService>(context),
            ),
          ),
        ],
        child: MaterialApp(...),
      ),
    ),
  );
}
```

**Acceso a servicios:**

```dart
// En Widgets
final isarService = RepositoryProvider.of<IsarService>(context);

// En BLoCs (constructor)
class CattleListBloc extends Bloc<CattleListEvent, CattleListState> {
  final IsarService _isarService;

  CattleListBloc(this._isarService) : super(CattleListInitial());
}

// Al crear BLoC
BlocProvider(
  create: (context) => CattleListBloc(
    RepositoryProvider.of<IsarService>(context),
  ),
)
```

### 9.3 BLoCs Definidos en la App

| BLoC | Responsabilidad | Ubicación |
|------|-----------------|-----------|
| **AuthBloc** | Autenticación de usuarios | `/modulos/0_autenticacion/aplicacion/` |
| **CattleListBloc** | Lista de ganado | `/modulos/1_lista_ganado/aplicacion/` |
| **CattleDetailBloc** | Detalle de animal | `/modulos/2_detalle_animal/aplicacion/` |
| **AddEventBloc** | Agregar evento | `/modulos/3_registro_evento/aplicacion/` |
| **NfcScannerBloc** | Escaneo NFC móvil | `/modulos/4_escaneo_nfc/presentacion/blocs/` |
| **Esp32ScannerBloc** | Escaneo ESP32 | `/modulos/4_escaneo_nfc/presentacion/blocs/` |

---

## 10. Navegación

### 10.1 Esquema de Navegación

**Sistema:** Navegación imperativa (Navigator.push/pop)

**Rutas nombradas:** No implementadas (usar MaterialPageRoute)

### 10.2 Flujos Principales

**Mapa de navegación:**

```
App Start
    │
    ├─ AuthWrapper
    │   ├─ No Auth → LoginScreen
    │   │               ├─ Login exitoso ──┐
    │   │               └─ Register ───────┤
    │   │                                  │
    │   └─ Auth ────────────────────────────┘
    │                                      │
    ▼                                      ▼
HomeScreenMejorado ◄─────────────────────────
    │
    ├─ Ver Inventario
    │   └─ CattleListScreen
    │       └─ AnimalCard.onTap
    │           └─ CattleDetailScreen
    │               ├─ Editar → EditarAnimalScreen
    │               ├─ Agregar Evento → AddEventScreen
    │               └─ Ver Genealogía → GenealogyScreen
    │
    ├─ Agregar Animal
    │   └─ AgregarAnimalScreen
    │       └─ AnimalForm
    │           └─ Guardar → pop() → HomeScreenMejorado
    │
    ├─ Registrar Evento (Wizard)
    │   └─ SeleccionarTipoEventoScreen
    │       └─ SeleccionarAnimalesScreen
    │           └─ DatosEventoScreen
    │               └─ ConfirmacionEventoScreen
    │                   └─ popUntil() → HomeScreenMejorado
    │
    ├─ Escanear NFC
    │   └─ EscaneoNfcScreen
    │       ├─ Tab: Escáner Móvil
    │       │   └─ Animal encontrado → CattleDetailScreen
    │       └─ Tab: Escáner ESP32
    │           └─ Animal encontrado → CattleDetailScreen
    │
    └─ Perfil
        └─ ProfileScreen
            ├─ Configuración → ConfigScreen
            └─ Cerrar sesión → AuthBloc → LoginScreen
```

### 10.3 Transiciones

**Transición estándar:**
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => CattleDetailScreen(animalId: id),
  ),
);
```

**Transición con animación personalizada:**
```dart
// Circular reveal (usado en perfil)
Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return ProfileScreen();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ClipPath(
        clipper: CircularRevealClipper(
          fraction: animation.value,
          centerOffset: Offset(x, y),
        ),
        child: child,
      );
    },
  ),
);
```

**Volver múltiples pantallas:**
```dart
// Usado después de wizard de eventos
Navigator.popUntil(context, (route) => route.isFirst);

// O con ruta nombrada (si estuviera implementado)
Navigator.popUntil(context, ModalRoute.withName('/home'));
```

**Reemplazar pantalla:**
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (_) => NewScreen()),
);
```

### 10.4 Protección de Rutas

**AuthWrapper:** Protege todas las pantallas principales

```dart
class HomeScreenMejorado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      child: Scaffold(...),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return child;
        }

        return LoginScreen();
      },
    );
  }
}
```

---

## 11. Configuración y Deployment

### 11.1 Requisitos del Sistema

**Desarrollo:**
- Flutter SDK ^3.9.0
- Dart SDK ^3.9.0
- Android Studio / VS Code
- Xcode 14+ (para iOS)
- CocoaPods (para iOS)

**Producción:**
- Cuenta Firebase (Blaze plan recomendado)
- Cuenta Google Play Developer ($25 one-time)
- Cuenta Apple Developer ($99/año) (para iOS)

### 11.2 Setup del Proyecto

**1. Clonar repositorio:**
```bash
git clone https://github.com/tu-usuario/sirega-flutter.git
cd sirega-flutter
```

**2. Instalar dependencias:**
```bash
flutter pub get
```

**3. Generar código Isar:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**4. Configurar Firebase:**
```bash
# Instalar FlutterFire CLI
dart pub global activate flutterfire_cli

# Configurar proyecto
flutterfire configure

# Seleccionar proyecto Firebase existente o crear nuevo
```

**5. Configurar SHA-1 para Google Sign-In (Android):**
```bash
cd android
./gradlew signingReport

# Copiar SHA-1 y agregarlo en Firebase Console:
# Project Settings → Android App → Add SHA-1
```

**6. Verificar configuración:**
```bash
flutter doctor
flutter analyze
```

### 11.3 Variables de Entorno

**Actualmente no usa .env** (TODO: Implementar)

**Futuro (.env):**
```env
FIREBASE_API_KEY=AIza...
FIREBASE_APP_ID=1:123...
FIREBASE_PROJECT_ID=sirega-prod
```

### 11.4 Build para Android

**Debug APK:**
```bash
flutter build apk --debug
# Output: build/app/outputs/flutter-apk/app-debug.apk
```

**Release APK:**
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

**App Bundle (para Play Store):**
```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

**Configurar firma (android/app/build.gradle):**
```gradle
android {
    ...

    signingConfigs {
        release {
            storeFile file("../keystore/release.jks")
            storePassword System.getenv("KEYSTORE_PASSWORD")
            keyAlias System.getenv("KEY_ALIAS")
            keyPassword System.getenv("KEY_PASSWORD")
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
        }
    }
}
```

**Generar keystore:**
```bash
keytool -genkey -v -keystore android/keystore/release.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias upload
```

### 11.5 Build para iOS

**Requiere Mac con Xcode**

**1. Instalar pods:**
```bash
cd ios
pod install
cd ..
```

**2. Build release:**
```bash
flutter build ios --release
```

**3. Abrir Xcode:**
```bash
open ios/Runner.xcworkspace
```

**4. Configurar:**
- Equipo de desarrollo
- Bundle ID: com.sirega.app
- Versión: 1.0.0
- Build number: 1

**5. Archive y subir a App Store Connect**

### 11.6 CI/CD (TODO)

**GitHub Actions (ejemplo):**
```yaml
# .github/workflows/build.yml
name: Build and Test

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.9.0'

    - run: flutter pub get

    - run: flutter analyze

    - run: flutter test

    - run: flutter build apk --release

    - uses: actions/upload-artifact@v3
      with:
        name: release-apk
        path: build/app/outputs/flutter-apk/app-release.apk
```

---

## 12. Guía de Desarrollo

### 12.1 Agregar Nueva Funcionalidad

**Ejemplo: Agregar módulo de "Alertas"**

**1. Crear estructura de carpetas:**
```bash
mkdir -p lib/modulos/5_alertas/{aplicacion,dominio,datos,presentacion}/{blocs,servicios,pantallas,widgets}
```

**2. Crear modelo:**
```dart
// lib/nucleo/modelos/alerta_model.dart (ya existe)
@collection
class Alerta {
  Id id = Isar.autoIncrement;
  // ...
}
```

**3. Extender IsarService:**
```dart
// lib/nucleo/servicios/isar_service.dart
Future<List<Alerta>> obtenerAlertasActivas() async {
  return await isar.alertas
      .filter()
      .estadoEqualTo(EstadoAlerta.activa)
      .findAll();
}

Future<void> guardarAlerta(Alerta alerta) async {
  await isar.writeTxn(() => isar.alertas.put(alerta));
}
```

**4. Crear BLoC:**
```dart
// lib/modulos/5_alertas/aplicacion/alertas_bloc.dart
class AlertasBloc extends Bloc<AlertasEvent, AlertasState> {
  final IsarService _isarService;

  AlertasBloc(this._isarService) : super(AlertasInitial()) {
    on<LoadAlertas>(_onLoadAlertas);
    on<MarkAlertAsRead>(_onMarkAsRead);
  }

  // Implementación...
}
```

**5. Crear pantalla:**
```dart
// lib/modulos/5_alertas/presentacion/pantallas/alertas_screen.dart
class AlertasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlertasBloc(
        RepositoryProvider.of<IsarService>(context),
      )..add(LoadAlertas()),
      child: Scaffold(
        appBar: AppBar(title: Text('Alertas')),
        body: BlocBuilder<AlertasBloc, AlertasState>(
          builder: (context, state) {
            // UI...
          },
        ),
      ),
    );
  }
}
```

**6. Agregar navegación:**
```dart
// lib/presentation/screens/home_screen_mejorado.dart
PrimaryActionCard(
  titulo: 'Alertas',
  icono: Icons.notifications,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AlertasScreen()),
    );
  },
)
```

**7. Agregar sincronización (si necesita Firebase):**
```dart
// lib/nucleo/servicios/firebase_sync_service.dart
Future<void> _uploadPendingAlertas() async {
  // Implementación...
}

// Llamar desde syncPendingChanges()
```

### 12.2 Convenciones de Código

**Nombrado:**
```dart
// Clases: PascalCase
class AnimalCard extends StatelessWidget {}

// Variables y métodos: camelCase
String obtenerNombreCompleto() {}
int numeroAnimales = 0;

// Constantes: SCREAMING_SNAKE_CASE
const int MAX_ANIMALES = 1000;

// Archivos: snake_case
animal_card.dart
cattle_list_screen.dart
```

**Imports:**
```dart
// 1. Dart core
import 'dart:async';

// 2. Flutter
import 'package:flutter/material.dart';

// 3. Packages externos
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

// 4. Imports internos
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
```

**Documentación:**
```dart
/// Obtiene todos los animales activos del sistema.
///
/// Retorna una lista de [Animal] con estado [EstadoAnimal.activo].
/// Si no hay animales activos, retorna una lista vacía.
///
/// Throws [DatabaseException] si hay error de BD.
Future<List<Animal>> obtenerAnimalesActivos() async {
  // Implementación...
}
```

**Manejo de errores:**
```dart
// NO HACER
try {
  await isarService.guardarAnimal(animal);
} catch (e) {
  print('Error: $e'); // ❌
}

// HACER
try {
  await isarService.guardarAnimal(animal);
} catch (e) {
  debugPrint('Error al guardar animal: $e'); // ✓
  rethrow; // O manejar apropiadamente
}
```

### 12.3 Testing (TODO: Implementar)

**Estructura de tests:**
```
test/
├── unit/
│   ├── models/
│   │   └── animal_test.dart
│   ├── services/
│   │   └── isar_service_test.dart
│   └── blocs/
│       └── cattle_list_bloc_test.dart
├── widget/
│   └── cattle_card_test.dart
└── integration/
    └── full_flow_test.dart
```

**Ejemplo de test unitario:**
```dart
// test/unit/models/animal_test.dart
void main() {
  group('Animal', () {
    test('getEdadEnMeses calcula correctamente', () {
      final animal = Animal()
        ..fechaNacimiento = DateTime.now().subtract(Duration(days: 365));

      expect(animal.getEdadEnMeses(), 12);
    });

    test('esValidoBasico valida SinigaId', () {
      final siniga = SinigaId()
        ..especie = '00'
        ..estadoClave = '14'
        ..numeroNacional = '12345678';

      expect(siniga.esValidoBasico, true);
    });
  });
}
```

**Ejemplo de test de BLoC:**
```dart
// test/unit/blocs/cattle_list_bloc_test.dart
void main() {
  group('CattleListBloc', () {
    late MockIsarService mockIsarService;
    late CattleListBloc bloc;

    setUp(() {
      mockIsarService = MockIsarService();
      bloc = CattleListBloc(mockIsarService);
    });

    tearDown(() {
      bloc.close();
    });

    blocTest<CattleListBloc, CattleListState>(
      'emite [Loading, Loaded] cuando LoadCattle es exitoso',
      build: () {
        when(mockIsarService.obtenerTodosLosAnimales())
            .thenAnswer((_) async => [Animal()]);
        return bloc;
      },
      act: (bloc) => bloc.add(LoadCattle()),
      expect: () => [
        CattleListLoading(),
        isA<CattleListLoaded>(),
      ],
    );
  });
}
```

---

## 13. Troubleshooting

### 13.1 Problemas Comunes

**Error: Build runner falla**
```bash
# Limpiar caché
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

**Error: Firebase no inicializa**
```bash
# Verificar que google-services.json está en android/app/
# Verificar que firebase_options.dart existe
flutterfire configure
```

**Error: NFC no funciona**
```
Verificar en AndroidManifest.xml:
<uses-permission android:name="android.permission.NFC" />
<uses-feature android:name="android.hardware.nfc" android:required="false" />
```

**Error: Isar Inspector no conecta**
```bash
# Asegurarse que inspector: true en Isar.open()
# Correr app en debug mode
# Abrir inspector: flutter pub run isar_inspector
```

**Error: Sincronización no funciona**
```
1. Verificar internet: ConnectionService.isConnected
2. Verificar autenticación: AuthService.currentUser
3. Verificar reglas Firestore
4. Verificar logs en Firebase Console
```

### 13.2 Debugging

**Logs útiles:**
```dart
// IsarService
debugPrint('📊 Guardando animal: ${animal.nombre}');

// FirebaseSyncService
debugPrint('☁️ Subiendo ${pendientes.length} animales');
debugPrint('✅ Sincronización completada');
debugPrint('⚠️ Conflicto detectado');

// ConnectionService
debugPrint('🌐 Internet detectado');
debugPrint('📵 Sin conexión');

// NfcService
debugPrint('📱 NFC disponible: $available');
debugPrint('🏷️ Tag leído: $uid');
```

**Flutter DevTools:**
```bash
flutter pub global activate devtools
flutter pub global run devtools

# En otra terminal
flutter run
```

**Isar Inspector:**
```bash
flutter pub run isar_inspector
```

### 13.3 Performance

**Optimizaciones implementadas:**

1. **Queries con índices:**
```dart
@Index(unique: true)
String? nfcChipId;

@Index()
String? serverId;
```

2. **Streams para reactividad:**
```dart
// En lugar de polling
Stream<List<Animal>> observarAnimales() {
  return isar.animals.where().watch(fireImmediately: true);
}
```

3. **Lazy loading de relaciones:**
```dart
final animal = await isar.animals.get(id);
await animal.eventos.load(); // Solo cuando se necesita
```

4. **Compresión de imágenes:**
```dart
// TODO: Implementar con image_picker
final compressedImage = await compressImage(file);
```

---

## 14. Testing

### 14.1 Estrategia de Testing

**Pirámide de testing:**
```
       ┌─────────┐
      │   E2E    │  10%  (Integration tests)
     ├───────────┤
    │   Widget   │  20%  (Widget tests)
   ├─────────────┤
  │     Unit     │  70%  (Unit tests)
 └───────────────┘
```

**Cobertura objetivo:** 80%

### 14.2 Tests Unitarios

**Ubicación:** `/test/unit/`

**Qué testear:**
- Modelos (getters, métodos de utilidad)
- Servicios (lógica de negocio)
- BLoCs (eventos → estados)
- Mappers (conversiones)
- Validaciones

**Ejemplo:**
```dart
// test/unit/services/isar_service_test.dart
void main() {
  late Isar isar;
  late IsarService isarService;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
  });

  setUp(() async {
    isar = await Isar.open(
      [AnimalSchema],
      directory: Directory.systemTemp.path,
      name: 'test_${DateTime.now().millisecondsSinceEpoch}',
    );
    isarService = IsarService();
    IsarService.isar = isar;
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
  });

  test('guardarAnimal crea nuevo animal', () async {
    final animal = Animal()
      ..nombre = 'Test'
      ..sexo = Sexo.hembra
      ..raza = 'Holstein'
      ..fechaNacimiento = DateTime(2020, 1, 1);

    final id = await isarService.guardarAnimal(animal);

    expect(id, greaterThan(0));

    final saved = await isarService.obtenerAnimalPorId(id);
    expect(saved, isNotNull);
    expect(saved!.nombre, 'Test');
  });
}
```

### 14.3 Tests de Widget

**Ubicación:** `/test/widget/`

**Ejemplo:**
```dart
// test/widget/animal_card_test.dart
void main() {
  testWidgets('AnimalCard muestra información correcta', (tester) async {
    final animal = Animal()
      ..id = 1
      ..nombre = 'Vaca 001'
      ..sexo = Sexo.hembra
      ..raza = 'Holstein'
      ..fechaNacimiento = DateTime(2020, 1, 1);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnimalCard(
            animal: animal,
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.text('Vaca 001'), findsOneWidget);
    expect(find.text('Holstein'), findsOneWidget);
    expect(find.byIcon(Icons.female), findsOneWidget);
  });
}
```

### 14.4 Tests de Integración

**Ubicación:** `/integration_test/`

**Ejemplo:**
```dart
// integration_test/app_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Flujo completo: Login → Agregar Animal → Ver Detalle',
    (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // 1. Login
    await tester.enterText(
      find.byKey(Key('emailField')),
      'test@example.com',
    );
    await tester.enterText(
      find.byKey(Key('passwordField')),
      'password123',
    );
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle(Duration(seconds: 3));

    expect(find.text('Bienvenido'), findsOneWidget);

    // 2. Agregar animal
    await tester.tap(find.text('Agregar Animal'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(Key('nombreField')), 'Vaca Test');
    await tester.tap(find.text('Guardar'));
    await tester.pumpAndSettle();

    // 3. Verificar en lista
    expect(find.text('Vaca Test'), findsOneWidget);
  });
}
```

**Ejecutar:**
```bash
flutter test integration_test/app_test.dart
```

---

## 15. Roadmap

### 15.1 Versión 1.1 (Q2 2025)

**Prioridad Alta:**
- [ ] Migración a Clean Architecture completa
- [ ] Implementar Firebase Storage para fotos
- [ ] Sistema de alertas automáticas
- [ ] Notificaciones push
- [ ] Reportes PDF (producción, eventos)

**Prioridad Media:**
- [ ] Gráficos avanzados (Dashboard)
- [ ] Exportar datos a Excel
- [ ] Modo oscuro
- [ ] Múltiples idiomas (i18n)

**Prioridad Baja:**
- [ ] Integración con balanzas Bluetooth
- [ ] Reconocimiento facial de ganado (ML)
- [ ] Chat soporte

### 15.2 Versión 2.0 (Q4 2025)

**Features:**
- [ ] Versión web (Flutter Web)
- [ ] Multi-usuario (roles)
- [ ] Gestión de múltiples ranchos
- [ ] Marketplace de ganado
- [ ] API pública
- [ ] Integración con SINIGA oficial (si disponible)

### 15.3 Mejoras Técnicas

**Arquitectura:**
- [ ] Migrar a Clean Architecture
- [ ] Implementar Use Cases en todos los módulos
- [ ] Desacoplar de Isar (Repository Pattern completo)
- [ ] Agregar capa de caché (Hive/SharedPreferences)

**Testing:**
- [ ] Cobertura >80%
- [ ] Tests E2E automatizados
- [ ] CI/CD completo (GitHub Actions)

**Performance:**
- [ ] Lazy loading de imágenes
- [ ] Paginación en listas grandes
- [ ] Caché de queries frecuentes
- [ ] Optimización de builds

**Seguridad:**
- [ ] Cifrado de datos locales
- [ ] Autenticación biométrica
- [ ] Logs de auditoría
- [ ] Backup automático

---

## Apéndices

### A. Glosario

- **Arete:** Identificador visual o electrónico colocado en la oreja del animal
- **NFC:** Near Field Communication, tecnología de comunicación de corto alcance
- **SINIGA:** Sistema Nacional de Identificación Individual de Ganado (México)
- **Herd/Hato:** Grupo de animales de un rancho
- **Gestante:** Hembra en estado de gestación
- **Lactante:** Hembra produciendo leche
- **Offline-first:** Arquitectura donde la app funciona sin internet

### B. Referencias

**Documentación:**
- [Flutter Docs](https://docs.flutter.dev/)
- [Isar Database](https://isar.dev/)
- [Firebase for Flutter](https://firebase.flutter.dev/)
- [BLoC Pattern](https://bloclibrary.dev/)

**Guías:**
- [Clean Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter BLoC - Reso Coder](https://resocoder.com/flutter-clean-architecture-tdd/)

### C. Contacto

**Equipo de desarrollo:**
- Email: dev@sirega.com
- GitHub: https://github.com/sirega/sirega-flutter
- Slack: sirega-dev.slack.com

---

**Fin del Manual Técnico**

**Última actualización:** Enero 2025
**Versión del documento:** 1.0
