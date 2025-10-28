# Guía Completa: Implementación de Firebase en SIREGA

## Índice
1. [Arquitectura Offline-First](#arquitectura-offline-first)
2. [¿Qué SDK necesitas?](#qué-sdk-necesitas)
3. [Flujo de Sincronización](#flujo-de-sincronización)
4. [Estructura de Firebase](#estructura-de-firebase)
5. [Estado Actual del Código](#estado-actual-del-código)
6. [Plan de Implementación](#plan-de-implementación)

---

## Arquitectura Offline-First

### Concepto Principal
Tu aplicación **funciona completamente OFFLINE** y sincroniza cuando hay internet disponible.

```
┌─────────────────────────────────────────────────────────┐
│                    DISPOSITIVO MÓVIL                    │
│                                                         │
│  ┌─────────────┐         ┌──────────────┐             │
│  │   Flutter   │◄────────┤ Isar (Local) │             │
│  │     App     │────────►│   Database   │             │
│  └──────┬──────┘         └──────────────┘             │
│         │                                              │
│         │ Cuando hay internet                          │
│         ▼                                              │
│  ┌─────────────┐                                       │
│  │ SyncService │                                       │
│  └──────┬──────┘                                       │
└─────────┼────────────────────────────────────────────────┘
          │
          │ Firebase SDK (FlutterFire)
          │
          ▼
┌─────────────────────────────────────────────────────────┐
│                    FIREBASE (NUBE)                      │
│                                                         │
│  ┌──────────────┐         ┌──────────────┐            │
│  │   Firebase   │         │  Firestore   │            │
│  │     Auth     │         │   Database   │            │
│  └──────────────┘         └──────────────┘            │
└─────────────────────────────────────────────────────────┘
```

---

## ¿Qué SDK necesitas?

### ❌ NO NECESITAS: Firebase Admin SDK
El Firebase Admin SDK (Node.js, Python, Java, Go) es para **servidores backend**.
Solo se usa si tienes un servidor propio que necesita acceso privilegiado a Firebase.

### ✅ SÍ NECESITAS: FlutterFire (Paquetes de Flutter)

Estos paquetes se conectan **directamente** desde tu app móvil a Firebase:

```yaml
# pubspec.yaml
dependencies:
  # Core de Firebase (obligatorio)
  firebase_core: ^3.3.0

  # Autenticación
  firebase_auth: ^5.1.4

  # Base de datos
  cloud_firestore: ^5.2.1

  # Opcional: Storage para imágenes
  firebase_storage: ^12.1.3

  # Opcional: Analytics
  firebase_analytics: ^11.2.1

  # Para detectar conexión a internet
  connectivity_plus: ^6.0.3
```

### Conexión Directa vs Admin SDK

```
┌──────────────────────────────────────────────────────┐
│           CONEXIÓN DIRECTA (Tu caso)                 │
│                                                      │
│  App Flutter ──► FlutterFire SDK ──► Firebase       │
│  (Android/iOS)                                       │
│                                                      │
│  ✅ Más simple                                       │
│  ✅ No necesita servidor                            │
│  ✅ Reglas de seguridad de Firestore protegen datos │
└──────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────┐
│         CON SERVIDOR BACKEND (NO tu caso)            │
│                                                      │
│  App Flutter ──► Tu Servidor ──► Admin SDK ──► Firebase │
│                  (Node.js/Python)                    │
│                                                      │
│  ❌ Más complejo                                     │
│  ❌ Necesitas mantener un servidor                  │
│  ✅ Control total sobre la lógica                   │
└──────────────────────────────────────────────────────┘
```

---

## Flujo de Sincronización

### 1️⃣ Primera Vez - Login con Internet

```
Usuario abre la app
    ↓
Pantalla de Login
    ↓
Ingresa credenciales → Firebase Auth valida
    ↓
✅ Token guardado localmente (persiste sin internet)
    ↓
SyncService descarga TODOS los datos del usuario desde Firestore
    ↓
Datos se guardan en Isar (base de datos local)
    ↓
Usuario puede trabajar OFFLINE ahora
```

**Código simplificado:**
```dart
// Login
final userCredential = await FirebaseAuth.instance
    .signInWithEmailAndPassword(email: email, password: password);

// El token se guarda automáticamente
// Usuario permanece autenticado incluso sin internet
```

### 2️⃣ Uso Offline (Sin Internet)

```
Usuario crea/edita un animal
    ↓
Se guarda en Isar con:
  - serverId: null (si es nuevo)
  - estadoSync: EstadoSync.pendiente
  - ultimaActualizacion: DateTime.now()
    ↓
La app funciona NORMAL
(lee todo de Isar, no intenta conectar a Firebase)
    ↓
Usuario puede crear 10, 50, 100 registros offline
```

**¿Cómo sabe Firebase Auth que el usuario sigue logueado sin internet?**
- El token de autenticación se almacena encriptado en el dispositivo
- `FirebaseAuth.instance.currentUser` devuelve el usuario desde caché local
- El token es válido por días/semanas
- Cuando vuelve internet, Firebase valida el token automáticamente

### 3️⃣ Reconexión a Internet

```
App detecta conexión (connectivity_plus)
    ↓
SyncService se activa automáticamente
    ↓
┌─────────────────────────────────────────┐
│         SINCRONIZACIÓN BIDIRECCIONAL    │
├─────────────────────────────────────────┤
│                                         │
│  SUBIDA (Local → Nube)                 │
│  ├─ Busca en Isar: estadoSync=pendiente│
│  ├─ Por cada registro:                 │
│  │   ├─ Si serverId = null → Crear nuevo│
│  │   └─ Si serverId existe → Actualizar│
│  └─ Marca estadoSync=completado        │
│                                         │
│  BAJADA (Nube → Local)                 │
│  ├─ Escucha cambios en Firestore       │
│  ├─ Por cada cambio detectado:         │
│  │   ├─ Compara ultimaActualizacion    │
│  │   └─ Actualiza Isar si es más nuevo│
│  └─ NO vuelve a subir estos cambios    │
│                                         │
└─────────────────────────────────────────┘
```

### 4️⃣ Resolución de Conflictos

```
Escenario: Mismo animal editado en 2 celulares offline

Celular A (sin internet):
  Animal#123 editado a las 10:00 AM
  ultimaActualizacion: 2025-01-27 10:00:00
  estadoSync: pendiente

Celular B (sin internet):
  Animal#123 editado a las 10:30 AM
  ultimaActualizacion: 2025-01-27 10:30:00
  estadoSync: pendiente

Cuando ambos se conectan:
  1. Celular A sube primero → Firestore tiene versión 10:00
  2. Celular B sube después → Firestore detecta conflicto
  3. Compara timestamps: 10:30 > 10:00
  4. Firestore guarda versión 10:30 (más reciente)
  5. Celular A escucha el cambio y descarga versión 10:30
  6. Resultado: Ambos celulares tienen la versión 10:30
```

---

## Estructura de Firebase

### Firestore Database

```
/users (colección)
  /{userId} (documento - UID de Firebase Auth)
    - nombre: "Juan Pérez"
    - email: "juan@example.com"
    - createdAt: timestamp

    /cattle (subcolección - animales del usuario)
      /{animalId}
        - nombre: "Vaca 001"
        - raza: "Holstein"
        - padreId: "cattle/abc123" (referencia)
        - madreId: "cattle/def456"
        - herdId: "herds/xyz789"
        - ultimaActualizacion: timestamp

    /events (subcolección - eventos sanitarios)
      /{eventId}
        - animalId: "cattle/abc123"
        - tipo: "vacuna"
        - fecha: timestamp
        - ultimaActualizacion: timestamp

    /productions (subcolección - registros de producción)
      /{productionId}
        - animalId: "cattle/abc123"
        - tipo: "pesaje"
        - pesoKg: 450.5
        - ultimaActualizacion: timestamp

    /herds (subcolección - hatos/rebaños)
      /{herdId}
        - nombre: "Hato Principal"
        - totalAnimales: 50
        - ultimaActualizacion: timestamp

    /batch_events (subcolección - eventos masivos)
      /{batchId}
        - animalesIds: ["cattle/abc", "cattle/def"]
        - tipo: "vacuna"
        - cantidadAnimales: 25
        - ultimaActualizacion: timestamp

/products_catalog (colección global - opcional)
  /{productId}
    - nombre: "IVERMECTINA 3.15%"
    - tipo: "desparasitante"
    - esDeSistema: true
```

### Reglas de Seguridad de Firestore

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    // Función para verificar autenticación
    function isAuthenticated() {
      return request.auth != null;
    }

    // Función para verificar que el usuario es dueño de los datos
    function isOwner(userId) {
      return isAuthenticated() && request.auth.uid == userId;
    }

    // Reglas para usuarios
    match /users/{userId} {
      // Solo el usuario puede leer/escribir sus datos
      allow read, write: if isOwner(userId);

      // Subcolecciones del usuario
      match /{collection}/{document=**} {
        allow read, write: if isOwner(userId);
      }
    }

    // Catálogo de productos (lectura pública)
    match /products_catalog/{productId} {
      allow read: if isAuthenticated();
      allow write: if false; // Solo administradores desde consola
    }
  }
}
```

### Firebase Authentication

```
Métodos soportados:
  ✅ Email/Password (recomendado para empezar)
  ✅ Google Sign-In
  ✅ Anónimo (para probar la app)
  ⚪ Facebook, Apple, etc. (opcional)

Flujo de autenticación:
  1. Usuario se registra/inicia sesión
  2. Firebase genera un UID único (ej: "abc123xyz")
  3. Este UID se usa como ID del documento en /users/{UID}
  4. Token de autenticación se guarda en el dispositivo
  5. Token es válido por largo tiempo (días/semanas)
  6. Funciona offline después del login inicial
```

---

## Estado Actual del Código

### ✅ Modelos con Campos de Sincronización

#### Animal - COMPLETO ✅
```dart
// lib/nucleo/modelos/animal_model.dart:122-131
@Index()
String? serverId;                           // ✅ ID de Firestore
DateTime? ultimaActualizacion;              // ✅ Para conflictos
EstadoSync estadoSync = EstadoSync.pendiente; // ✅ Estado de sync
int versionLocal = 1;
String? hashDatos;
```

#### EventoSanitario - FALTA estadoSync ⚠️
```dart
// Tiene:
String? serverId;           // ✅
DateTime? ultimaActualizacion;  // ✅

// Falta agregar:
@Enumerated(EnumType.name)
EstadoSync estadoSync = EstadoSync.pendiente; // ❌
```

#### RegistroProduccion - FALTA estadoSync ⚠️
```dart
// Tiene:
String? serverId;           // ✅
DateTime? ultimaActualizacion;  // ✅

// Falta agregar:
@Enumerated(EnumType.name)
EstadoSync estadoSync = EstadoSync.pendiente; // ❌
```

#### Herd - FALTA estadoSync ⚠️
```dart
// Tiene:
String? serverId;           // ✅
DateTime? ultimaActualizacion;  // ✅

// Falta agregar:
@Enumerated(EnumType.name)
EstadoSync estadoSync = EstadoSync.pendiente; // ❌
```

#### LoteEvento - FALTA TODO ⚠️
```dart
// Falta agregar:
@Index()
String? serverId;                           // ❌
DateTime? ultimaActualizacion;              // ❌
@Enumerated(EnumType.name)
EstadoSync estadoSync = EstadoSync.pendiente; // ❌
```

### ✅ Enums ya definidos
```dart
// lib/nucleo/modelos/enums.dart:87-94
enum EstadoSync {
  pendiente,    // Esperando sincronizar
  enProceso,    // Sincronizando ahora
  completado,   // Ya sincronizado
  error,        // Error al sincronizar
  conflicto,    // Conflicto detectado
  cancelado     // Cancelado por el usuario
}
```

---

## Plan de Implementación

### FASE 1: Completar Modelos (1 día)
```
✅ Animal ya tiene todos los campos

⚠️ Agregar a estos modelos:
  - EventoSanitario
  - RegistroProduccion
  - Herd
  - LoteEvento

Campo a agregar:
  @Enumerated(EnumType.name)
  EstadoSync estadoSync = EstadoSync.pendiente;

Luego ejecutar:
  dart run build_runner build --delete-conflicting-outputs
```

### FASE 2: Configurar Firebase (1 día)

#### Paso 1: Crear proyecto en Firebase Console
```
1. Ir a https://console.firebase.google.com
2. Crear nuevo proyecto "SIREGA"
3. Habilitar Firebase Authentication (Email/Password)
4. Crear base de datos Firestore (modo prueba)
5. Configurar reglas de seguridad
```

#### Paso 2: Configurar Flutter
```bash
# Instalar FlutterFire CLI
dart pub global activate flutterfire_cli

# Configurar Firebase en el proyecto
flutterfire configure
```

Esto crea automáticamente:
- `ios/Runner/GoogleService-Info.plist`
- `android/app/google-services.json`
- `lib/firebase_options.dart`

#### Paso 3: Agregar dependencias
```yaml
# pubspec.yaml
dependencies:
  firebase_core: ^3.3.0
  firebase_auth: ^5.1.4
  cloud_firestore: ^5.2.1
  connectivity_plus: ^6.0.3
```

#### Paso 4: Inicializar Firebase
```dart
// lib/main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Inicializar Isar
  await IsarService.init();

  runApp(MyApp());
}
```

### FASE 3: Implementar Autenticación (2 días)

#### Crear AuthService
```dart
// lib/nucleo/servicios/auth_service.dart
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Usuario actual
  User? get currentUser => _auth.currentUser;

  // Stream de cambios de auth
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Registro
  Future<UserCredential> register(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  // Login
  Future<UserCredential> login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Verificar si está autenticado (funciona offline)
  bool isAuthenticated() {
    return currentUser != null;
  }
}
```

#### Crear AuthBloc
```dart
// lib/nucleo/blocs/auth_bloc/auth_bloc.dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final SyncService _syncService;

  AuthBloc(this._authService, this._syncService) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit
  ) async {
    emit(AuthLoading());
    try {
      await _authService.login(event.email, event.password);

      // Sincronización inicial
      await _syncService.syncInitial();

      emit(AuthAuthenticated(_authService.currentUser!));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
```

#### Crear AuthGuard
```dart
// lib/nucleo/guards/auth_guard.dart
class AuthGuard {
  final AuthService _authService;

  AuthGuard(this._authService);

  Future<bool> canActivate(BuildContext context) async {
    if (!_authService.isAuthenticated()) {
      Navigator.pushReplacementNamed(context, '/login');
      return false;
    }
    return true;
  }
}
```

### FASE 4: Implementar SyncService (3-4 días)

```dart
// lib/nucleo/servicios/sync_service.dart
class SyncService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final IsarService _isarService;
  final Connectivity _connectivity = Connectivity();

  StreamSubscription? _connectionSubscription;
  StreamSubscription? _firestoreSubscription;

  bool _isSyncing = false;

  // Iniciar listeners
  void init() {
    _listenToConnectionChanges();
    _listenToFirestoreChanges();
  }

  // Detectar cambios de conexión
  void _listenToConnectionChanges() {
    _connectionSubscription = _connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result != ConnectivityResult.none) {
          syncPendingChanges(); // Auto-sync cuando hay internet
        }
      }
    );
  }

  // Sincronización inicial (después del login)
  Future<void> syncInitial() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    // Descargar todos los datos del usuario
    await _downloadAnimals(userId);
    await _downloadEvents(userId);
    await _downloadProductions(userId);
    await _downloadHerds(userId);
  }

  // Subir cambios pendientes
  Future<void> syncPendingChanges() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      await _uploadPendingAnimals();
      await _uploadPendingEvents();
      await _uploadPendingProductions();
    } finally {
      _isSyncing = false;
    }
  }

  // Escuchar cambios en tiempo real
  void _listenToFirestoreChanges() {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    _firestoreSubscription = _firestore
      .collection('users/$userId/cattle')
      .snapshots()
      .listen((snapshot) {
        for (var change in snapshot.docChanges) {
          if (change.type == DocumentChangeType.added ||
              change.type == DocumentChangeType.modified) {
            _handleRemoteAnimalChange(change.doc);
          }
        }
      });
  }

  // Manejar cambio remoto (evitar bucles)
  Future<void> _handleRemoteAnimalChange(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;
    final remoteUpdatedAt = (data['ultimaActualizacion'] as Timestamp).toDate();

    // Buscar en Isar por serverId
    final localAnimals = await _isarService.isar.animals
      .filter()
      .serverIdEqualTo(doc.id)
      .findAll();

    if (localAnimals.isEmpty) {
      // No existe localmente, crear
      await _createLocalAnimal(doc.id, data);
    } else {
      final localAnimal = localAnimals.first;
      final localUpdatedAt = localAnimal.ultimaActualizacion;

      // Solo actualizar si la versión remota es más reciente
      if (localUpdatedAt == null || remoteUpdatedAt.isAfter(localUpdatedAt)) {
        await _updateLocalAnimal(localAnimal, data);
      }
    }
  }

  // Limpiar listeners
  void dispose() {
    _connectionSubscription?.cancel();
    _firestoreSubscription?.cancel();
  }
}
```

### FASE 5: Integrar en la UI (2 días)

```dart
// Pantalla de login
// Inicializar SyncService después del login exitoso
await syncService.init();

// En cada pantalla donde se modifiquen datos
// Marcar como pendiente automáticamente
animal.estadoSync = EstadoSync.pendiente;
animal.ultimaActualizacion = DateTime.now();
await isarService.guardarAnimal(animal);

// El SyncService detectará y subirá automáticamente
```

### FASE 6: Testing (2-3 días)

```
✅ Test 1: Login y descarga inicial
✅ Test 2: Crear animal offline
✅ Test 3: Sincronizar al conectar
✅ Test 4: Editar en 2 dispositivos (conflicto)
✅ Test 5: Sincronización en tiempo real
✅ Test 6: Manejo de errores
```

---

## Resumen de Dependencias

### NO necesitas instalar:
❌ Firebase Admin SDK (Node.js, Python, Java, Go)
❌ Firebase CLI (solo para deploy de funciones, que no usarás)

### SÍ necesitas:
✅ FlutterFire CLI: `dart pub global activate flutterfire_cli`
✅ Paquetes de Flutter:
  - firebase_core
  - firebase_auth
  - cloud_firestore
  - connectivity_plus

### Conexión a Firestore:
```dart
// Directamente desde Flutter
final firestore = FirebaseFirestore.instance;

// Crear documento
await firestore.collection('users/$userId/cattle').add({
  'nombre': 'Vaca 001',
  'raza': 'Holstein',
  'ultimaActualizacion': FieldValue.serverTimestamp(),
});

// Leer documentos
final docs = await firestore.collection('users/$userId/cattle').get();

// Escuchar cambios en tiempo real
firestore.collection('users/$userId/cattle').snapshots().listen((snapshot) {
  // Se ejecuta cada vez que hay cambios
});
```

---

## Tiempo Estimado Total

| Fase | Tiempo | Complejidad |
|------|--------|-------------|
| 1. Completar modelos | 1 día | ⭐ Fácil |
| 2. Configurar Firebase | 1 día | ⭐⭐ Media |
| 3. Autenticación | 2 días | ⭐⭐ Media |
| 4. SyncService | 3-4 días | ⭐⭐⭐ Alta |
| 5. Integrar UI | 2 días | ⭐⭐ Media |
| 6. Testing | 2-3 días | ⭐⭐⭐ Alta |
| **TOTAL** | **11-13 días** | - |

---

## Próximos Pasos

1. **Ahora mismo:** Completar campos de sincronización en modelos
2. **Mañana:** Crear proyecto en Firebase Console y configurar Flutter
3. **Esta semana:** Implementar autenticación básica
4. **Próxima semana:** Crear SyncService completo

---

## Recursos Útiles

- [FlutterFire Docs](https://firebase.flutter.dev)
- [Firestore Docs](https://firebase.google.com/docs/firestore)
- [Firebase Auth Docs](https://firebase.google.com/docs/auth)
- [Offline Persistence](https://firebase.google.com/docs/firestore/manage-data/enable-offline)

---

**¿Listo para empezar? Podemos comenzar completando los modelos ahora mismo.**
