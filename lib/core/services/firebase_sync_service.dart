import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isar/isar.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/models/medical_event_model.dart';
import 'package:sirega_app/core/models/herd_model.dart';
import 'package:sirega_app/core/models/batch_event_model.dart';
import 'package:sirega_app/core/models/production_model.dart';
import 'package:sirega_app/core/services/isar_service.dart';
import 'package:sirega_app/core/services/sync_mappers.dart';

/// Servicio de sincronización bidireccional Isar ↔ Firestore
/// Maneja la lógica offline-first y resolución de conflictos
class FirebaseSyncService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Listeners de Firestore
  StreamSubscription? _animalsListener;
  StreamSubscription? _eventsListener;
  StreamSubscription? _productionsListener;
  StreamSubscription? _herdsListener;
  StreamSubscription? _batchEventsListener;

  // Control de sincronización
  bool _isSyncing = false;
  bool _isInitialized = false;

  // Callbacks
  Function(String message)? onSyncStart;
  Function(String message)? onSyncComplete;
  Function(String error)? onSyncError;
  Function(int pending)? onPendingCountChanged;

  FirebaseSyncService();

  /// Usuario actual
  String? get userId => _auth.currentUser?.uid;

  /// Verificar si hay usuario autenticado
  bool get isAuthenticated => userId != null;

  /// Inicializar sincronización
  /// Se debe llamar después del login exitoso
  Future<void> init() async {
    if (!isAuthenticated) {
      throw Exception('Usuario no autenticado');
    }

    if (_isInitialized) return;

    // Realizar sincronización inicial (descargar datos)
    await syncInitial();

    // Iniciar listeners de tiempo real
    _startRealtimeListeners();

    _isInitialized = true;
  }

  /// Sincronización inicial: Descargar todos los datos del usuario
  /// Se ejecuta una vez después del login
  Future<void> syncInitial() async {
    try {
      onSyncStart?.call('Descargando datos del servidor...');

      await _downloadAnimals();
      await _downloadEvents();
      await _downloadProductions();
      await _downloadHerds();
      await _downloadBatchEvents();

      onSyncComplete?.call('Datos descargados correctamente');
    } catch (e) {
      onSyncError?.call('Error en sincronización inicial: $e');
      rethrow;
    }
  }

  /// Sincronizar cambios pendientes (local → nube)
  /// Se ejecuta automáticamente cuando hay internet
  Future<void> syncPendingChanges() async {
    if (_isSyncing || !isAuthenticated) return;

    _isSyncing = true;

    try {
      onSyncStart?.call('Sincronizando cambios...');

      await _uploadPendingAnimals();
      await _uploadPendingEvents();
      await _uploadPendingProductions();
      await _uploadPendingHerds();
      await _uploadPendingBatchEvents();

      final pending = await getPendingCount();
      onPendingCountChanged?.call(pending);

      onSyncComplete?.call('Sincronización completada');
    } catch (e) {
      onSyncError?.call('Error al sincronizar: $e');
    } finally {
      _isSyncing = false;
    }
  }

  /// Obtener cantidad de registros pendientes de sincronizar
  Future<int> getPendingCount() async {
    final animals = await IsarService.isar.animals
        .filter()
        .syncStatusEqualTo(EstadoSync.pendiente)
        .count();

    final events = await IsarService.isar.medicalEventRecords
        .filter()
        .syncStatusEqualTo(EstadoSync.pendiente)
        .count();

    final productions = await IsarService.isar.productionRecords
        .filter()
        .syncStatusEqualTo(EstadoSync.pendiente)
        .count();

    final herds = await IsarService.isar.herds
        .filter()
        .syncStatusEqualTo(EstadoSync.pendiente)
        .count();

    final batchEvents = await IsarService.isar.batchEventRecords
        .filter()
        .syncStatusEqualTo(EstadoSync.pendiente)
        .count();

    return animals + events + productions + herds + batchEvents;
  }

  /// Eliminar TODOS los datos del usuario de Firestore
  /// ADVERTENCIA: Esta acción NO se puede deshacer
  /// Los datos locales (Isar) NO se verán afectados
  Future<void> deleteAllUserDataFromFirestore() async {
    if (!isAuthenticated) {
      throw Exception('No hay usuario autenticado');
    }

    final batch = _firestore.batch();

    try {
      // Eliminar todos los animales
      final animalsSnapshot = await _firestore
          .collection('users/$userId/cattle')
          .get();
      for (final doc in animalsSnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Eliminar todos los events sanitarios
      final eventsSnapshot = await _firestore
          .collection('users/$userId/events')
          .get();
      for (final doc in eventsSnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Eliminar todos los registros de producción
      final productionsSnapshot = await _firestore
          .collection('users/$userId/productions')
          .get();
      for (final doc in productionsSnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Eliminar todos los hatos
      final herdsSnapshot = await _firestore
          .collection('users/$userId/herds')
          .get();
      for (final doc in herdsSnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Eliminar todos los events masivos
      final batchEventsSnapshot = await _firestore
          .collection('users/$userId/batch_events')
          .get();
      for (final doc in batchEventsSnapshot.docs) {
        batch.delete(doc.reference);
      }

      // Ejecutar batch delete
      await batch.commit();

      // Marcar todos los registros locales como pendientes para re-sincronizar si quieren
      await _markAllAsPending();
    } catch (e) {
      throw Exception('Error al eliminar datos de Firestore: $e');
    }
  }

  /// Marcar todos los registros locales como pendientes
  Future<void> _markAllAsPending() async {
    await IsarService.isar.writeTxn(() async {
      // Animales
      final animals = await IsarService.isar.animals.where().findAll();
      for (final animal in animals) {
        animal.syncStatus = EstadoSync.pendiente;
        animal.serverId = null; // Limpiar serverId para que se cree uno nuevo
        await IsarService.isar.animals.put(animal);
      }

      // Eventos
      final events = await IsarService.isar.medicalEventRecords
          .where()
          .findAll();
      for (final event in events) {
        event.syncStatus = EstadoSync.pendiente;
        event.serverId = null;
        await IsarService.isar.medicalEventRecords.put(event);
      }

      // Producción
      final productions = await IsarService.isar.productionRecords
          .where()
          .findAll();
      for (final prod in productions) {
        prod.syncStatus = EstadoSync.pendiente;
        prod.serverId = null;
        await IsarService.isar.productionRecords.put(prod);
      }

      // Hatos
      final herds = await IsarService.isar.herds.where().findAll();
      for (final herd in herds) {
        herd.syncStatus = EstadoSync.pendiente;
        herd.serverId = null;
        await IsarService.isar.herds.put(herd);
      }

      // Eventos masivos
      final batchEvents = await IsarService.isar.batchEventRecords
          .where()
          .findAll();
      for (final be in batchEvents) {
        be.syncStatus = EstadoSync.pendiente;
        be.serverId = null;
        await IsarService.isar.batchEventRecords.put(be);
      }
    });
  }

  // ========== DESCARGAS (Nube → Local) ==========

  Future<void> _downloadAnimals() async {
    final snapshot = await _firestore.collection('users/$userId/cattle').get();

    await IsarService.isar.writeTxn(() async {
      for (final doc in snapshot.docs) {
        await SyncMappers.createOrUpdateLocalAnimal(doc.id, doc.data());
      }
    });
  }

  Future<void> _downloadEvents() async {
    final snapshot = await _firestore.collection('users/$userId/events').get();

    await IsarService.isar.writeTxn(() async {
      for (final doc in snapshot.docs) {
        await SyncMappers.createOrUpdateLocalEvent(doc.id, doc.data());
      }
    });
  }

  Future<void> _downloadProductions() async {
    final snapshot = await _firestore
        .collection('users/$userId/productions')
        .get();

    await IsarService.isar.writeTxn(() async {
      for (final doc in snapshot.docs) {
        await SyncMappers.createOrUpdateLocalProduction(doc.id, doc.data());
      }
    });
  }

  Future<void> _downloadHerds() async {
    final snapshot = await _firestore.collection('users/$userId/herds').get();

    await IsarService.isar.writeTxn(() async {
      for (final doc in snapshot.docs) {
        await SyncMappers.createOrUpdateLocalHerd(doc.id, doc.data());
      }
    });
  }

  Future<void> _downloadBatchEvents() async {
    final snapshot = await _firestore
        .collection('users/$userId/batch_events')
        .get();

    await IsarService.isar.writeTxn(() async {
      for (final doc in snapshot.docs) {
        await SyncMappers.createOrUpdateLocalBatchEvent(doc.id, doc.data());
      }
    });
  }

  // ========== SUBIDAS (Local → Nube) ==========

  Future<void> _uploadPendingAnimals() async {
    final pending = await IsarService.isar.animals
        .filter()
        .syncStatusEqualTo(EstadoSync.pendiente)
        .findAll();

    for (final animal in pending) {
      try {
        final data = SyncMappers.animalToMap(animal);

        if (animal.serverId == null) {
          // Crear nuevo en Firestore
          final docRef = await _firestore
              .collection('users/$userId/cattle')
              .add(data);

          // Actualizar local con serverId
          animal.serverId = docRef.id;
        } else {
          // Actualizar existente
          await _firestore
              .collection('users/$userId/cattle')
              .doc(animal.serverId)
              .set(data, SetOptions(merge: true));
        }

        // Marcar como sincronizado
        animal.syncStatus = EstadoSync.completado;
        await IsarService.isar.writeTxn(
          () => IsarService.isar.animals.put(animal),
        );
      } catch (e) {
        animal.syncStatus = EstadoSync.error;
        await IsarService.isar.writeTxn(
          () => IsarService.isar.animals.put(animal),
        );
      }
    }
  }

  Future<void> _uploadPendingEvents() async {
    final pending = await IsarService.isar.medicalEventRecords
        .filter()
        .syncStatusEqualTo(EstadoSync.pendiente)
        .findAll();

    for (final event in pending) {
      try {
        final data = SyncMappers.eventToMap(event);

        if (event.serverId == null) {
          final docRef = await _firestore
              .collection('users/$userId/events')
              .add(data);
          event.serverId = docRef.id;
        } else {
          await _firestore
              .collection('users/$userId/events')
              .doc(event.serverId)
              .set(data, SetOptions(merge: true));
        }

        event.syncStatus = EstadoSync.completado;
        await IsarService.isar.writeTxn(
          () => IsarService.isar.medicalEventRecords.put(event),
        );
      } catch (e) {
        event.syncStatus = EstadoSync.error;
        await IsarService.isar.writeTxn(
          () => IsarService.isar.medicalEventRecords.put(event),
        );
      }
    }
  }

  Future<void> _uploadPendingProductions() async {
    final pending = await IsarService.isar.productionRecords
        .filter()
        .syncStatusEqualTo(EstadoSync.pendiente)
        .findAll();

    for (final production in pending) {
      try {
        final data = SyncMappers.productionToMap(production);

        if (production.serverId == null) {
          final docRef = await _firestore
              .collection('users/$userId/productions')
              .add(data);
          production.serverId = docRef.id;
        } else {
          await _firestore
              .collection('users/$userId/productions')
              .doc(production.serverId)
              .set(data, SetOptions(merge: true));
        }

        production.syncStatus = EstadoSync.completado;
        await IsarService.isar.writeTxn(
          () => IsarService.isar.productionRecords.put(production),
        );
      } catch (e) {
        production.syncStatus = EstadoSync.error;
        await IsarService.isar.writeTxn(
          () => IsarService.isar.productionRecords.put(production),
        );
      }
    }
  }

  Future<void> _uploadPendingHerds() async {
    final pending = await IsarService.isar.herds
        .filter()
        .syncStatusEqualTo(EstadoSync.pendiente)
        .findAll();

    for (final herd in pending) {
      try {
        final data = SyncMappers.herdToMap(herd);

        if (herd.serverId == null) {
          final docRef = await _firestore
              .collection('users/$userId/herds')
              .add(data);
          herd.serverId = docRef.id;
        } else {
          await _firestore
              .collection('users/$userId/herds')
              .doc(herd.serverId)
              .set(data, SetOptions(merge: true));
        }

        herd.syncStatus = EstadoSync.completado;
        await IsarService.isar.writeTxn(() => IsarService.isar.herds.put(herd));
      } catch (e) {
        herd.syncStatus = EstadoSync.error;
        await IsarService.isar.writeTxn(() => IsarService.isar.herds.put(herd));
      }
    }
  }

  Future<void> _uploadPendingBatchEvents() async {
    final pending = await IsarService.isar.batchEventRecords
        .filter()
        .syncStatusEqualTo(EstadoSync.pendiente)
        .findAll();

    for (final batch in pending) {
      try {
        final data = SyncMappers.batchEventToMap(batch);

        if (batch.serverId == null) {
          final docRef = await _firestore
              .collection('users/$userId/batch_events')
              .add(data);
          batch.serverId = docRef.id;
        } else {
          await _firestore
              .collection('users/$userId/batch_events')
              .doc(batch.serverId)
              .set(data, SetOptions(merge: true));
        }

        batch.syncStatus = EstadoSync.completado;
        await IsarService.isar.writeTxn(
          () => IsarService.isar.batchEventRecords.put(batch),
        );
      } catch (e) {
        batch.syncStatus = EstadoSync.error;
        await IsarService.isar.writeTxn(
          () => IsarService.isar.batchEventRecords.put(batch),
        );
      }
    }
  }

  // ========== LISTENERS DE TIEMPO REAL ==========

  void _startRealtimeListeners() {
    // Escuchar cambios en animales
    _animalsListener = _firestore
        .collection('users/$userId/cattle')
        .snapshots()
        .listen((snapshot) {
          for (final change in snapshot.docChanges) {
            if (change.type == DocumentChangeType.added ||
                change.type == DocumentChangeType.modified) {
              _handleRemoteAnimalChange(change.doc);
            }
          }
        });

    // Escuchar cambios en events
    _eventsListener = _firestore
        .collection('users/$userId/events')
        .snapshots()
        .listen((snapshot) {
          for (final change in snapshot.docChanges) {
            if (change.type == DocumentChangeType.added ||
                change.type == DocumentChangeType.modified) {
              _handleRemoteEventChange(change.doc);
            }
          }
        });

    // Escuchar cambios en productions
    _productionsListener = _firestore
        .collection('users/$userId/productions')
        .snapshots()
        .listen((snapshot) {
          for (final change in snapshot.docChanges) {
            if (change.type == DocumentChangeType.added ||
                change.type == DocumentChangeType.modified) {
              _handleRemoteProductionChange(change.doc);
            }
          }
        });

    // Escuchar cambios en herds
    _herdsListener = _firestore
        .collection('users/$userId/herds')
        .snapshots()
        .listen((snapshot) {
          for (final change in snapshot.docChanges) {
            if (change.type == DocumentChangeType.added ||
                change.type == DocumentChangeType.modified) {
              _handleRemoteHerdChange(change.doc);
            }
          }
        });

    // Escuchar cambios en batch events
    _batchEventsListener = _firestore
        .collection('users/$userId/batch_events')
        .snapshots()
        .listen((snapshot) {
          for (final change in snapshot.docChanges) {
            if (change.type == DocumentChangeType.added ||
                change.type == DocumentChangeType.modified) {
              _handleRemoteBatchEventChange(change.doc);
            }
          }
        });
  }

  // Manejar cambio remoto de animal
  Future<void> _handleRemoteAnimalChange(DocumentSnapshot doc) async {
    await IsarService.isar.writeTxn(() async {
      await SyncMappers.createOrUpdateLocalAnimal(
        doc.id,
        doc.data() as Map<String, dynamic>,
      );
    });
  }

  Future<void> _handleRemoteEventChange(DocumentSnapshot doc) async {
    await IsarService.isar.writeTxn(() async {
      await SyncMappers.createOrUpdateLocalEvent(
        doc.id,
        doc.data() as Map<String, dynamic>,
      );
    });
  }

  Future<void> _handleRemoteProductionChange(DocumentSnapshot doc) async {
    await IsarService.isar.writeTxn(() async {
      await SyncMappers.createOrUpdateLocalProduction(
        doc.id,
        doc.data() as Map<String, dynamic>,
      );
    });
  }

  Future<void> _handleRemoteHerdChange(DocumentSnapshot doc) async {
    await IsarService.isar.writeTxn(() async {
      await SyncMappers.createOrUpdateLocalHerd(
        doc.id,
        doc.data() as Map<String, dynamic>,
      );
    });
  }

  Future<void> _handleRemoteBatchEventChange(DocumentSnapshot doc) async {
    await IsarService.isar.writeTxn(() async {
      await SyncMappers.createOrUpdateLocalBatchEvent(
        doc.id,
        doc.data() as Map<String, dynamic>,
      );
    });
  }

  /// Limpiar listeners al cerrar la app
  void dispose() {
    _animalsListener?.cancel();
    _eventsListener?.cancel();
    _productionsListener?.cancel();
    _herdsListener?.cancel();
    _batchEventsListener?.cancel();
  }
}
