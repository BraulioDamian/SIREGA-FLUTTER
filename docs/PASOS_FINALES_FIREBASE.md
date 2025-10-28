# Pasos Finales para Conectar Firebase

## ✅ Lo que YA está listo en tu código

Tu aplicación ya tiene TODO el código necesario para Firebase:

1. ✅ Modelos actualizados con campos de sincronización
2. ✅ AuthService - Manejo de autenticación
3. ✅ ConnectionService - Detecta conexión a internet
4. ✅ FirebaseSyncService - Sincronización bidireccional completa
5. ✅ AuthBloc - Estado de autenticación con BLoC
6. ✅ Dependencias agregadas en pubspec.yaml

---

## 🔥 Pasos para conectar con Firebase

### Paso 1: Instalar dependencias

```bash
cd /Users/damian/Documents/SIREGA/SIREGA-FLUTTER
flutter pub get
```

Esto instalará todos los paquetes de Firebase que se agregaron.

---

### Paso 2: Instalar FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

Verifica la instalación:
```bash
flutterfire --version
```

---

### Paso 3: Crear proyecto en Firebase Console

1. Ve a https://console.firebase.google.com
2. Haz clic en "Agregar proyecto"
3. Nombre del proyecto: **SIREGA**
4. Sigue los pasos (puedes deshabilitar Analytics por ahora)
5. Haz clic en "Crear proyecto"

---

### Paso 4: Configurar Firestore Database

Dentro de tu proyecto Firebase:

1. En el menú lateral, ve a **"Firestore Database"**
2. Haz clic en **"Crear base de datos"**
3. Selecciona **"Comenzar en modo de prueba"** (o producción si prefieres)
4. Elige la ubicación (por ejemplo: us-central1)
5. Haz clic en **"Habilitar"**

#### Configurar Reglas de Seguridad

Ve a la pestaña **"Reglas"** y pega esto:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    // Función para verificar autenticación
    function isAuthenticated() {
      return request.auth != null;
    }

    // Función para verificar que el usuario es dueño
    function isOwner(userId) {
      return isAuthenticated() && request.auth.uid == userId;
    }

    // Reglas para usuarios
    match /users/{userId} {
      allow read, write: if isOwner(userId);

      // Todas las subcolecciones del usuario
      match /{collection}/{document=**} {
        allow read, write: if isOwner(userId);
      }
    }

    // Catálogo de productos (lectura pública si está autenticado)
    match /products_catalog/{productId} {
      allow read: if isAuthenticated();
      allow write: if false; // Solo desde consola
    }
  }
}
```

Haz clic en **"Publicar"**.

---

### Paso 5: Configurar Authentication

Dentro de tu proyecto Firebase:

1. En el menú lateral, ve a **"Authentication"**
2. Haz clic en **"Comenzar"**
3. Ve a la pestaña **"Sign-in method"**
4. Habilita **"Correo electrónico/Contraseña"**
5. Haz clic en **"Guardar"**

---

### Paso 6: Conectar Flutter con Firebase

Ejecuta el comando de configuración automática:

```bash
cd /Users/damian/Documents/SIREGA/SIREGA-FLUTTER
flutterfire configure
```

Esto hará:
1. Te preguntará qué proyecto Firebase usar (selecciona SIREGA)
2. Te preguntará para qué plataformas configurar (selecciona Android e iOS)
3. Generará automáticamente:
   - `lib/firebase_options.dart` (reemplazará el placeholder)
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`

---

### Paso 7: Actualizar main.dart

Reemplaza tu archivo `lib/main.dart` con esto:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sirega_app/firebase_options.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/nucleo/servicios/auth_service.dart';
import 'package:sirega_app/nucleo/servicios/connection_service.dart';
import 'package:sirega_app/nucleo/servicios/firebase_sync_service.dart';
import 'package:sirega_app/modulos/0_autenticacion/presentation/bloc/auth_bloc.dart';
// Importa tu pantalla principal aquí

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 2. Inicializar Isar (base de datos local)
  await IsarService.init();
  await IsarService().poblarDatosIniciales();

  // 3. Crear instancias de servicios
  final authService = AuthService();
  final isarService = IsarService();
  final syncService = FirebaseSyncService(isarService);
  final connectionService = ConnectionService();

  // 4. Inicializar ConnectionService
  await connectionService.init();

  // 5. Configurar auto-sync cuando hay internet
  connectionService.onConnected = () {
    print('🌐 Conexión detectada, sincronizando...');
    syncService.syncPendingChanges();
  };

  connectionService.onDisconnected = () {
    print('📵 Conexión perdida, modo offline');
  };

  runApp(MyApp(
    authService: authService,
    syncService: syncService,
    connectionService: connectionService,
  ));
}

class MyApp extends StatelessWidget {
  final AuthService authService;
  final FirebaseSyncService syncService;
  final ConnectionService connectionService;

  const MyApp({
    super.key,
    required this.authService,
    required this.syncService,
    required this.connectionService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // AuthBloc disponible globalmente
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authService: authService,
            syncService: syncService,
          )..add(AuthCheckRequested()),
        ),
      ],
      child: MaterialApp(
        title: 'SIREGA',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        // Aquí configuras tus rutas o pantalla inicial
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is AuthAuthenticated) {
              // Usuario autenticado - ir a pantalla principal
              return TuPantallaPrincipal(); // Reemplaza con tu pantalla
            } else {
              // Usuario no autenticado - ir a login
              return TuPantallaDeLogin(); // Reemplaza con tu login
            }
          },
        ),
      ),
    );
  }
}

// PLACEHOLDERS - Reemplaza con tus pantallas reales
class TuPantallaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SIREGA - Inicio')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¡Bienvenido a SIREGA!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthLogoutRequested());
              },
              child: const Text('Cerrar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

class TuPantallaDeLogin extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLoginRequested(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ));
                },
                child: const Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### Paso 8: Guardar animales con estado de sincronización

Cuando guardes o edites animales, asegúrate de marcarlos como pendientes:

```dart
// Ejemplo al guardar un animal
animal.estadoSync = EstadoSync.pendiente;
animal.ultimaActualizacion = DateTime.now();
await isarService.guardarAnimal(animal);

// El FirebaseSyncService detectará y subirá automáticamente
// cuando haya internet disponible
```

---

## 🧪 Probar la Aplicación

### Paso 9: Crear usuario de prueba

Opción 1: **Desde la app** (después de correr la app)
- Usa el botón de registro si tienes pantalla de registro
- O usa el login con credenciales nuevas

Opción 2: **Desde Firebase Console**
1. Ve a Authentication > Users
2. Haz clic en "Agregar usuario"
3. Email: `test@example.com`
4. Contraseña: `test123456`
5. Haz clic en "Agregar usuario"

### Paso 10: Ejecutar la aplicación

```bash
# Android
flutter run

# iOS
flutter run
```

---

## 🎯 Verificar que funciona

### Test 1: Login Offline
1. Inicia sesión con internet
2. Cierra la app
3. Desactiva WiFi/Datos
4. Abre la app
5. ✅ Debería seguir autenticado (token local)

### Test 2: Crear Animal Offline
1. Sin internet, crea un animal
2. Verifica en Isar que `estadoSync = pendiente`
3. Activa internet
4. ✅ Debería aparecer en Firebase Console (Firestore Database)

### Test 3: Sincronización Multi-Dispositivo
1. Instala en 2 celulares
2. Inicia sesión con la misma cuenta
3. Crea un animal en el celular A
4. ✅ Debería aparecer automáticamente en el celular B

### Test 4: Resolución de Conflictos
1. Desactiva internet en ambos celulares
2. Edita el mismo animal en ambos
3. Activa internet
4. ✅ La versión más reciente (timestamp) gana

---

## 📊 Ver datos en Firebase Console

Para verificar que los datos se están subiendo:

1. Ve a Firebase Console
2. Firestore Database
3. Deberías ver la estructura:
   ```
   users/
     {userId}/
       cattle/
         {animalId}/
           - nombre
           - raza
           - fechaNacimiento
           - ...
   ```

---

## 🐛 Solución de Problemas

### Error: "DefaultFirebaseOptions not configured"
- Asegúrate de ejecutar `flutterfire configure`
- Verifica que `lib/firebase_options.dart` tiene tus credenciales reales

### Error: "User not authenticated"
- Verifica que Authentication está habilitado en Firebase
- Verifica las reglas de Firestore
- Asegúrate de hacer login antes de sincronizar

### Error: "Permission denied"
- Revisa las reglas de Firestore
- Asegúrate que el UID del usuario coincide con el documento

### Los datos no se sincronizan
- Verifica que ConnectionService detecta internet
- Verifica que los animales tienen `estadoSync = pendiente`
- Mira los logs: `flutter run` debería mostrar mensajes de sync

---

## 📚 Recursos

- [FlutterFire Docs](https://firebase.flutter.dev)
- [Firebase Console](https://console.firebase.google.com)
- [Firestore Rules](https://firebase.google.com/docs/firestore/security/get-started)

---

## ✅ Checklist Final

- [ ] Ejecutar `flutter pub get`
- [ ] Instalar FlutterFire CLI
- [ ] Crear proyecto en Firebase Console
- [ ] Configurar Firestore + Reglas
- [ ] Habilitar Authentication
- [ ] Ejecutar `flutterfire configure`
- [ ] Actualizar `main.dart`
- [ ] Crear usuario de prueba
- [ ] Ejecutar app y hacer login
- [ ] Crear animal de prueba
- [ ] Verificar en Firestore que apareció

---

**¡Listo! Tu aplicación ya está completamente preparada para Firebase.**

Si tienes algún error, revisa la sección de solución de problemas o consulta los logs de la app.
