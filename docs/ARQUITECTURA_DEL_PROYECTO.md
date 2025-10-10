# 📚 Arquitectura del Proyecto SIREGA

## 📋 Tabla de Contenidos
1. [Información General](#información-general)
2. [Estructura del Proyecto](#estructura-del-proyecto)
3. [Patrones de Arquitectura](#patrones-de-arquitectura)
4. [Convenciones de Código](#convenciones-de-código)
5. [Gestión de Estado](#gestión-de-estado)
6. [Base de Datos](#base-de-datos)
7. [Estructura de Módulos](#estructura-de-módulos)
8. [Ejemplos de Implementación](#ejemplos-de-implementación)

---

## 🎯 Información General

**Nombre del Proyecto:** SIREGA (Sistema de Registro Ganadero)  
**Plataforma:** Flutter  
**Versión:** 1.0.0+1  
**SDK Dart:** ^3.9.0  

### Descripción
Sistema de gestión ganadera con capacidades de:
- Registro y seguimiento de ganado bovino
- Lectura NFC (móvil y dispositivo externo ESP32)
- Gestión de eventos sanitarios
- Sincronización y almacenamiento local

---

## 🏗️ Estructura del Proyecto

```
lib/
├── main.dart                    # Punto de entrada de la aplicación
├── modulos/                     # Módulos de funcionalidad (por feature)
│   ├── 0_autenticacion/
│   ├── 1_lista_ganado/
│   ├── 2_detalle_animal/
│   ├── 3_registro_evento/
│   └── 4_escaneo_nfc/
├── nucleo/                      # Core/Shared (modelos, servicios compartidos)
│   ├── modelos/
│   └── servicios/
├── presentation/                # UI compartida y pantallas globales
│   ├── screens/
│   └── widgets/
└── ui/                          # Componentes UI reutilizables
```

### Principio de Organización
- **Por Feature (Módulos):** Cada módulo contiene toda su lógica (BLoC, UI, repositorios)
- **Núcleo Compartido:** Modelos y servicios usados por múltiples módulos
- **Presentación Global:** Pantallas y widgets compartidos

---

## 🏛️ Patrones de Arquitectura

### 1. **Clean Architecture Simplificada**
```
Presentation Layer (UI + BLoC)
       ↓
Domain Layer (Use Cases - opcional)
       ↓
Data Layer (Repositories + Services)
```

### 2. **BLoC Pattern** (Gestión de Estado)
- **Biblioteca:** `flutter_bloc: ^9.1.1`
- **Separación clara:** Events, States, Bloc
- **Estados de Acción:** Para side-effects (navegación, snackbars)

### 3. **Repository Pattern**
- Abstracción de fuentes de datos
- Implementaciones específicas para servicios

---

## 📝 Convenciones de Código

### Nomenclatura

#### Archivos
```dart
// Modelos
animal_model.dart
siniga_model.dart

// BLoC
cattle_list_bloc.dart
cattle_list_event.dart
cattle_list_state.dart

// Pantallas
cattle_detail_screen.dart
escaneo_nfc_screen.dart

// Widgets
primary_action_card.dart
scan_result_widget.dart

// Servicios
isar_service.dart
nfc_service.dart
```

#### Clases y Variables
```dart
// Clases: PascalCase
class AnimalModel {}
class CattleDetailBloc {}

// Variables y funciones: camelCase
final int animalId;
void loadCattleDetail() {}

// Constantes: camelCase con const
const String defaultEspecie = '00';

// Privados: prefijo _
bool _isScrolled = false;
void _onLoadCattle() {}
```

### Imports
```dart
// 1. Dart core
import 'dart:convert';

// 2. Flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 3. Paquetes externos (alfabético)
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

// 4. Imports internos (alfabético)
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

// 5. Imports relativos (si aplica)
import '../widgets/custom_card.dart';
```

---

## 🔄 Gestión de Estado

### Patrón BLoC Utilizado

#### Estructura de Archivos
```
bloc/
├── nombre_bloc.dart           # Lógica del BLoC
├── nombre_event.dart          # Eventos (part of bloc)
└── nombre_state.dart          # Estados (part of bloc)
```

#### Estados: Dos Tipos

**1. Estados de UI (para BlocBuilder)**
```dart
abstract class CattleDetailState {}

class CattleDetailInitial extends CattleDetailState {}
class CattleDetailLoading extends CattleDetailState {}
class CattleDetailLoaded extends CattleDetailState {
  final Animal animal;
  final List<EventoSanitario> eventos;
  CattleDetailLoaded({required this.animal, required this.eventos});
}
class CattleDetailError extends CattleDetailState {
  final String message;
  CattleDetailError(this.message);
}
```

**2. Estados de Acción (para BlocListener - Side Effects)**
```dart
// Estados que NO modifican la UI directamente, sino que disparan acciones
abstract class CattleDetailActionState extends CattleDetailState {}

class ShowInfoSnackbar extends CattleDetailActionState {
  final String message;
  ShowInfoSnackbar(this.message);
}

class NavigateToEditScreen extends CattleDetailActionState {
  final Animal animal;
  NavigateToEditScreen(this.animal);
}

class AnimalDeactivationSuccess extends CattleDetailActionState {}
```

#### Eventos
```dart
abstract class CattleDetailEvent {}

// Eventos de carga de datos
class LoadCattleDetail extends CattleDetailEvent {
  final int animalId;
  LoadCattleDetail(this.animalId);
}

// Eventos de acciones del usuario
class EditAnimalClicked extends CattleDetailEvent {
  final Animal animal;
  EditAnimalClicked(this.animal);
}

class DeactivateAnimal extends CattleDetailEvent {
  final Animal animal;
  DeactivateAnimal(this.animal);
}
```

#### BLoC
```dart
class CattleDetailBloc extends Bloc<CattleDetailEvent, CattleDetailState> {
  final IsarService isarService;

  CattleDetailBloc({required this.isarService}) : super(CattleDetailInitial()) {
    // Registrar handlers
    on<LoadCattleDetail>(_onLoadCattleDetail);
    on<DeactivateAnimal>(_onDeactivateAnimal);
    on<EditAnimalClicked>(_onEditAnimalClicked);
  }

  Future<void> _onLoadCattleDetail(
    LoadCattleDetail event, 
    Emitter<CattleDetailState> emit
  ) async {
    emit(CattleDetailLoading());
    try {
      final animal = await isarService.obtenerAnimalPorId(event.animalId);
      if (animal != null) {
        final eventos = await isarService.obtenerEventosPorAnimal(event.animalId);
        emit(CattleDetailLoaded(animal: animal, eventos: eventos));
      } else {
        emit(CattleDetailError('Animal no encontrado'));
      }
    } catch (e) {
      emit(CattleDetailError(e.toString()));
    }
  }

  void _onEditAnimalClicked(
    EditAnimalClicked event, 
    Emitter<CattleDetailState> emit
  ) {
    emit(NavigateToEditScreen(event.animal));
  }
}
```

#### Uso en UI
```dart
// BlocProvider - Inyectar el BLoC
BlocProvider<CattleDetailBloc>(
  create: (context) => CattleDetailBloc(
    isarService: RepositoryProvider.of<IsarService>(context),
  )..add(LoadCattleDetail(animalId)),
  child: MyWidget(),
)

// BlocBuilder - Para UI
BlocBuilder<CattleDetailBloc, CattleDetailState>(
  builder: (context, state) {
    if (state is CattleDetailLoading) return CircularProgressIndicator();
    if (state is CattleDetailLoaded) {
      return DetailView(animal: state.animal);
    }
    if (state is CattleDetailError) return ErrorWidget(state.message);
    return Container();
  },
)

// BlocListener - Para acciones (navegación, snackbars)
BlocListener<CattleDetailBloc, CattleDetailState>(
  listener: (context, state) {
    if (state is ShowInfoSnackbar) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
    if (state is NavigateToEditScreen) {
      Navigator.pushNamed(context, '/edit-animal', arguments: state.animal);
    }
  },
  child: MyWidget(),
)
```

---

## 💾 Base de Datos

### Isar Database
- **Biblioteca:** `isar: ^3.1.0+1`
- **Generador:** `isar_generator: ^3.1.0+1`
- **Motor:** `xxf_isar_flutter_libs: ^3.1.0+3`

### Servicio Principal
```dart
// nucleo/servicios/isar_service.dart
class IsarService {
  static Isar? _isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([
      AnimalSchema,
      EventoSanitarioSchema,
      ConfiguracionLocalSchema,
    ], directory: dir.path);
  }

  // Métodos CRUD
  Future<void> guardarAnimal(Animal animal) async { ... }
  Future<Animal?> obtenerAnimalPorId(int id) async { ... }
  Future<List<Animal>> obtenerTodosLosAnimales() async { ... }
}
```

### Modelos con Isar
```dart
@collection
class Animal {
  Id id = Isar.autoIncrement;
  
  late String nombre;
  late String raza;
  
  @enumerated
  late Sexo sexo;
  
  @enumerated
  late EstadoAnimal estado;
  
  // Embedded objects
  SinigaId? sinigaId;
  
  DateTime? fechaNacimiento;
}

// Generar código:
// flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 📦 Estructura de Módulos

### Convención de Módulo
Cada módulo sigue esta estructura:

```
modulos/N_nombre_modulo/
├── presentacion/
│   ├── bloc/
│   │   ├── nombre_bloc.dart
│   │   ├── nombre_event.dart
│   │   └── nombre_state.dart
│   ├── pantallas/
│   │   └── nombre_screen.dart
│   └── widgets/
│       └── componente_widget.dart
├── dominio/                    # Opcional
│   └── use_cases/
│       └── nombre_use_case.dart
└── data/                       # Opcional
    ├── repositories/
    │   └── nombre_repository.dart
    └── services/
        └── nombre_service.dart
```

### Ejemplo: Módulo Escaneo NFC
```
4_escaneo_nfc/
├── presentation/
│   ├── screens/
│   │   └── escaneo_nfc_screen.dart
│   └── widgets/
│       ├── escaner_movil_tab.dart
│       ├── escaner_externo_tab.dart
│       └── scan_result_widget.dart
├── bloc/
│   ├── nfc_scanner_bloc.dart
│   ├── nfc_scanner_event.dart
│   ├── nfc_scanner_state.dart
│   ├── esp32_scanner_bloc.dart
│   ├── esp32_scanner_event.dart
│   └── esp32_scanner_state.dart
├── domain/
│   └── use_cases/
│       ├── scan_nfc_use_case.dart
│       ├── connect_to_esp32_use_case.dart
│       └── find_animal_by_uid_use_case.dart
└── data/
    ├── repositories/
    │   ├── nfc_repository_impl.dart
    │   └── esp32_repository_impl.dart
    └── services/
        ├── nfc_service.dart
        ├── esp32_service.dart
        └── animal_database_service.dart
```

---

## 🔧 Ejemplos de Implementación

### 1. Crear un Nuevo Modelo Isar

```dart
// nucleo/modelos/mi_modelo.dart
import 'package:isar/isar.dart';

part 'mi_modelo.g.dart';

@collection
class MiModelo {
  Id id = Isar.autoIncrement;
  
  late String nombre;
  String? descripcion;
  
  @enumerated
  late MiEnum tipo;
  
  DateTime? fechaCreacion;
  
  // Embedded object
  OtroModelo? relacion;
}

// Ejecutar: flutter pub run build_runner build --delete-conflicting-outputs
```

### 2. Crear un Nuevo BLoC

```dart
// bloc/mi_nuevo_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

part 'mi_nuevo_event.dart';
part 'mi_nuevo_state.dart';

class MiNuevoBloc extends Bloc<MiNuevoEvent, MiNuevoState> {
  final IsarService isarService;

  MiNuevoBloc({required this.isarService}) : super(MiNuevoInitial()) {
    on<CargarDatos>(_onCargarDatos);
    on<GuardarDatos>(_onGuardarDatos);
  }

  Future<void> _onCargarDatos(
    CargarDatos event, 
    Emitter<MiNuevoState> emit
  ) async {
    emit(MiNuevoCargando());
    try {
      final datos = await isarService.obtenerDatos();
      emit(MiNuevoCargado(datos));
    } catch (e) {
      emit(MiNuevoError(e.toString()));
    }
  }

  Future<void> _onGuardarDatos(
    GuardarDatos event, 
    Emitter<MiNuevoState> emit
  ) async {
    try {
      await isarService.guardarDatos(event.datos);
      emit(DatosGuardadosExito());
    } catch (e) {
      emit(MostrarMensaje('Error al guardar: ${e.toString()}'));
    }
  }
}
```

```dart
// bloc/mi_nuevo_event.dart
part of 'mi_nuevo_bloc.dart';

abstract class MiNuevoEvent {}

class CargarDatos extends MiNuevoEvent {
  final int? filtroId;
  CargarDatos({this.filtroId});
}

class GuardarDatos extends MiNuevoEvent {
  final MiModelo datos;
  GuardarDatos(this.datos);
}
```

```dart
// bloc/mi_nuevo_state.dart
part of 'mi_nuevo_bloc.dart';

abstract class MiNuevoState {}

// Estados de UI
class MiNuevoInitial extends MiNuevoState {}
class MiNuevoCargando extends MiNuevoState {}
class MiNuevoCargado extends MiNuevoState {
  final List<MiModelo> datos;
  MiNuevoCargado(this.datos);
}
class MiNuevoError extends MiNuevoState {
  final String mensaje;
  MiNuevoError(this.mensaje);
}

// Estados de Acción
abstract class MiNuevoActionState extends MiNuevoState {}

class DatosGuardadosExito extends MiNuevoActionState {}
class MostrarMensaje extends MiNuevoActionState {
  final String mensaje;
  MostrarMensaje(this.mensaje);
}
```

### 3. Crear una Pantalla con BLoC

```dart
// pantallas/mi_nueva_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import '../bloc/mi_nuevo_bloc.dart';

class MiNuevaScreen extends StatelessWidget {
  const MiNuevaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MiNuevoBloc>(
      create: (context) => MiNuevoBloc(
        isarService: RepositoryProvider.of<IsarService>(context),
      )..add(CargarDatos()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Mi Nueva Pantalla')),
        body: BlocListener<MiNuevoBloc, MiNuevoState>(
          listener: (context, state) {
            if (state is DatosGuardadosExito) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Datos guardados exitosamente')),
              );
            }
            if (state is MostrarMensaje) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.mensaje)),
              );
            }
          },
          child: BlocBuilder<MiNuevoBloc, MiNuevoState>(
            builder: (context, state) {
              if (state is MiNuevoCargando) {
                return const Center(child: CircularProgressIndicator());
              }
              
              if (state is MiNuevoCargado) {
                return ListView.builder(
                  itemCount: state.datos.length,
                  itemBuilder: (context, index) {
                    final item = state.datos[index];
                    return ListTile(
                      title: Text(item.nombre),
                      subtitle: Text(item.descripcion ?? ''),
                    );
                  },
                );
              }
              
              if (state is MiNuevoError) {
                return Center(child: Text('Error: ${state.mensaje}'));
              }
              
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
```

### 4. Widget Reutilizable

```dart
// widgets/mi_card_widget.dart
import 'package:flutter/material.dart';

class MiCardWidget extends StatelessWidget {
  final String titulo;
  final String? subtitulo;
  final IconData icono;
  final VoidCallback? onTap;
  final Color? color;

  const MiCardWidget({
    super.key,
    required this.titulo,
    this.subtitulo,
    required this.icono,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = color ?? theme.primaryColor;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cardColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icono, color: cardColor, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (subtitulo != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitulo!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 🎨 Buenas Prácticas

### 1. **Separación de Responsabilidades**
- BLoC: Solo lógica de negocio
- UI: Solo presentación
- Servicios: Acceso a datos

### 2. **Immutabilidad**
```dart
// ✅ Bueno
final String nombre;
const EdgeInsets padding = EdgeInsets.all(16);

// ❌ Evitar
String nombre;
var padding = EdgeInsets.all(16);
```

### 3. **Manejo de Errores**
```dart
try {
  final resultado = await servicio.obtenerDatos();
  emit(ExitoState(resultado));
} catch (e) {
  emit(ErrorState('Error al cargar datos: ${e.toString()}'));
}
```

### 4. **Null Safety**
```dart
// Usar tipos nullable cuando sea necesario
String? descripcion;

// Usar valores por defecto
String nombre = '';
int contador = 0;

// Operadores null-aware
final longitud = descripcion?.length ?? 0;
```

### 5. **Constantes**
```dart
// Crear constantes para valores repetidos
class AppConstants {
  static const double padding = 16.0;
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const String defaultEspecie = '00';
}
```

---

## 📱 Dependencias Principales

```yaml
dependencies:
  # Estado
  flutter_bloc: ^9.1.1
  equatable: ^2.0.5
  
  # Base de Datos
  isar: ^3.1.0+1
  xxf_isar_flutter_libs: ^3.1.0+3
  path_provider: ^2.1.3
  
  # NFC y Hardware
  flutter_nfc_kit: ^3.6.0
  android_intent_plus: ^5.3.1
  permission_handler: ^12.0.1
  
  # UI y Utilidades
  image_picker: ^1.1.2
  fl_chart: ^1.0.0
  flutter_typeahead: ^5.2.0
  intl: ^0.20.2
  
  # Conectividad
  web_socket_channel: ^2.4.0
  connectivity_plus: ^6.0.1
```

---

## 🚀 Comandos Útiles

```bash
# Generar código Isar
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerar)
flutter pub run build_runner watch --delete-conflicting-outputs

# Limpiar build
flutter clean

# Obtener dependencias
flutter pub get

# Ejecutar app
flutter run

# Ejecutar tests
flutter test
```

---

## 📚 Referencias

- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [Isar Database](https://isar.dev/)
- [Flutter Clean Architecture](https://github.com/ResoCoder/flutter-clean-architecture)

---

**Última actualización:** Octubre 2025  
**Mantenido por:** Equipo SIREGA
