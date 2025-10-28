// lib/firebase_options.dart
// IMPORTANTE: Este archivo será reemplazado por FlutterFire CLI
// Ejecuta: flutterfire configure
//
// Este es solo un placeholder. Las opciones reales de Firebase
// se generarán después de configurar Firebase en la consola.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Configuración de Firebase generada por FlutterFire CLI.
///
/// PASOS PARA CONFIGURAR:
/// 1. Crear proyecto en https://console.firebase.google.com
/// 2. Habilitar Authentication (Email/Password)
/// 3. Crear Firestore Database
/// 4. Instalar FlutterFire CLI:
///    dart pub global activate flutterfire_cli
/// 5. Ejecutar configuración:
///    flutterfire configure
/// 6. Este archivo se reemplazará automáticamente
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // PLACEHOLDER - Será reemplazado por flutterfire configure
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'TU_API_KEY_AQUI',
    appId: 'TU_APP_ID_AQUI',
    messagingSenderId: 'TU_MESSAGING_SENDER_ID',
    projectId: 'TU_PROJECT_ID_AQUI',
    storageBucket: 'TU_STORAGE_BUCKET_AQUI',
  );

  // PLACEHOLDER - Será reemplazado por flutterfire configure
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'TU_API_KEY_AQUI',
    appId: 'TU_APP_ID_AQUI',
    messagingSenderId: 'TU_MESSAGING_SENDER_ID',
    projectId: 'TU_PROJECT_ID_AQUI',
    storageBucket: 'TU_STORAGE_BUCKET_AQUI',
    iosBundleId: 'com.tu.app.bundle.id',
  );
}
