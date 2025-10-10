# 🎯 Patrones y Convenciones de Código - SIREGA

## 📋 Índice
1. [Nomenclatura](#nomenclatura)
2. [Estructura de Archivos](#estructura-de-archivos)
3. [Patrón BLoC](#patrón-bloc)
4. [Modelos Isar](#modelos-isar)
5. [Widgets](#widgets)
6. [Servicios](#servicios)
7. [Enums](#enums)

---

## 📝 Nomenclatura

### Archivos y Carpetas

```
✅ CORRECTO                    ❌ INCORRECTO
animal_model.dart              animalModel.dart
cattle_list_bloc.dart          CattleListBloc.dart
escaneo_nfc_screen.dart        EscaneoNfcScreen.dart
primary_action_card.dart       PrimaryActionCard.dart
isar_service.dart              IsarService.dart
```

**Regla:** `snake_case` para todos los archivos y carpetas

### Clases

```dart
✅ CORRECTO
class AnimalModel {}
class CattleDetailBloc {}
class IsarService {}
class PrimaryActionCard extends StatelessWidget {}

❌ INCORRECTO
class animalModel {}
class cattle_detail_bloc {}
class isar_service {}
```

**Regla:** `PascalCase` para nombres de clases

### Variables y Funciones

```dart
✅ CORRECTO
final int animalId;
String nombreCompleto = '';
void cargarDatos() {}
Future<Animal?> obtenerAnimalPorId(int id) async {}

❌ INCORRECTO
final int AnimalId;
String NombreCompleto = '';
void CargarDatos() {}
```

**Regla:** `camelCase` para variables y funciones

### Constantes

```dart
✅ CORRECTO
const String defaultEspecie = '00';
const double defaultPadding = 16.0;
const Duration animationDuration = Duration(milliseconds: 300);

// Para constantes de clase
class AppConstants {
  static const String bovinoCode = '00';
  static const int maxImageWidth = 1920;
}

❌ INCORRECTO
const String DEFAULT_ESPECIE = '00';
const double PADDING = 16.0;
```

**Regla:** `camelCase` para constantes (NO usar UPPER_SNAKE_CASE como en otros lenguajes)

### Miembros Privados

```dart
✅ CORRECTO
class MiWidget extends StatefulWidget {
  bool _isLoading = false;
  final TextEditingController _controller = TextEditingController();
  
  void _cargarDatos() {}
  Future<void> _guardarLocal() async {}
}

❌ INCORRECTO
bool isLoading = false;  // Debería ser privado
void cargarDatos() {}    // Debería ser privado
```

**Regla:** Prefijo `_` para miembros privados de clase

---

## 📂 Estructura de Archivos

### Imports - Orden Correcto

```dart
// 1. Imports de Dart core
import 'dart:async';
import 'dart:convert';

// 2. Imports de Flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 3. Paquetes externos (orden alfabético)
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

// 4. Imports del proyecto (orden alfabético)
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

// 5. Imports relativos (si aplica)
import '../widgets/custom_card.dart';
import 'bloc/cattle_detail_bloc.dart';

// 6. Parts (siempre al final)
part 'cattle_detail_event.dart';
part 'cattle_detail_state.dart';
```

### Estructura de Clase Widget

```dart
class MiWidget extends StatefulWidget {
  // 1. Propiedades del widget (final)
  final String titulo;
  final VoidCallback? onTap;
  
  // 2. Constructor
  const MiWidget({
    super.key,
    required this.titulo,
    this.onTap,
  });

  @override
  State<MiWidget> createState() => _MiWidgetState();
}

class _MiWidgetState extends State<MiWidget> {
  // 1. Variables de estado privadas
  bool _isLoading = false;
  String? _errorMessage;
  
  // 2. Controllers
  final TextEditingController _controller = TextEditingController();
  
  // 3. Lifecycle methods
  @override
  void initState() {
    super.initState();
    _inicializar();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  // 4. Build method
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
  // 5. Métodos privados helper
  void _inicializar() {}
  Future<void> _cargarDatos() async {}
}
```

---

## 🔄 Patrón BLoC

### Estructura Estándar

#### 1. Event (nombre_event.dart)
```dart
part of 'cattle_detail_bloc.dart';

// ✅ PATRÓN CORRECTO
abstract class CattleDetailEvent {}

// Eventos de carga/actualización de datos
class LoadCattleDetail extends CattleDetailEvent {
  final int animalId;
  LoadCattleDetail(this.animalId);
}

class UpdateAnimal extends CattleDetailEvent {
  final Animal animal;
  UpdateAnimal(this.animal);
}

// Eventos de acciones de usuario
class EditAnimalClicked extends CattleDetailEvent {
  final Animal animal;
  EditAnimalClicked(this.animal);
}

class DeleteAnimalClicked extends CattleDetailEvent {
  final int animalId;
  DeleteAnimalClicked(this.animalId);
}
```

**Convenciones de Eventos:**
- Nombres descriptivos de la acción
- Sufijo `Clicked` para acciones de UI
- `Load` para cargas iniciales
- `Update` para actualizaciones
- Incluir solo datos necesarios

#### 2. State (nombre_state.dart)
```dart
part of 'cattle_detail_bloc.dart';

// ✅ PATRÓN CORRECTO

// --- Estados de UI (para BlocBuilder) ---
@immutable
abstract class CattleDetailState {}

class CattleDetailInitial extends CattleDetailState {}

class CattleDetailLoading extends CattleDetailState {}

class CattleDetailLoaded extends CattleDetailState {
  final Animal animal;
  final List<EventoSanitario> eventos;
  
  CattleDetailLoaded({
    required this.animal, 
    required this.eventos
  });
}

class CattleDetailError extends CattleDetailState {
  final String message;
  CattleDetailError(this.message);
}

// --- Estados de Acción (para BlocListener - Side Effects) ---
abstract class CattleDetailActionState extends CattleDetailState {}

class ShowSuccessMessage extends CattleDetailActionState {
  final String message;
  ShowSuccessMessage(this.message);
}

class ShowErrorMessage extends CattleDetailActionState {
  final String message;
  ShowErrorMessage(this.message);
}

class NavigateToEditScreen extends CattleDetailActionState {
  final Animal animal;
  NavigateToEditScreen(this.animal);
}

class AnimalDeletedSuccess extends CattleDetailActionState {}
```

**Convenciones de Estados:**
- Estados de UI: Para reconstruir widgets
- Estados de Acción: Para efectos secundarios (navegación, snackbars, dialogs)
- Usar `@immutable` en la clase base
- Nombres descriptivos: `Initial`, `Loading`, `Loaded`, `Error`
- ActionStates: Heredan de clase base pero no modifican UI principal

#### 3. BLoC (nombre_bloc.dart)
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:meta/meta.dart';

part 'cattle_detail_event.dart';
part 'cattle_detail_state.dart';

// ✅ PATRÓN CORRECTO
class CattleDetailBloc extends Bloc<CattleDetailEvent, CattleDetailState> {
  final IsarService isarService;

  CattleDetailBloc({required this.isarService}) : super(CattleDetailInitial()) {
    // Registrar event handlers
    on<LoadCattleDetail>(_onLoadCattleDetail);
    on<UpdateAnimal>(_onUpdateAnimal);
    on<EditAnimalClicked>(_onEditAnimalClicked);
    on<DeleteAnimalClicked>(_onDeleteAnimalClicked);
  }

  // Handlers para lógica de datos
  Future<void> _onLoadCattleDetail(
    LoadCattleDetail event,
    Emitter<CattleDetailState> emit,
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
      emit(CattleDetailError('Error: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateAnimal(
    UpdateAnimal event,
    Emitter<CattleDetailState> emit,
  ) async {
    try {
      await isarService.guardarAnimal(event.animal);
      final eventos = await isarService.obtenerEventosPorAnimal(event.animal.id);
      emit(CattleDetailLoaded(animal: event.animal, eventos: eventos));
      emit(ShowSuccessMessage('Animal actualizado correctamente'));
    } catch (e) {
      emit(ShowErrorMessage('Error al actualizar: ${e.toString()}'));
    }
  }

  // Handlers para acciones de UI (sin lógica compleja)
  void _onEditAnimalClicked(
    EditAnimalClicked event,
    Emitter<CattleDetailState> emit,
  ) {
    emit(NavigateToEditScreen(event.animal));
  }

  void _onDeleteAnimalClicked(
    DeleteAnimalClicked event,
    Emitter<CattleDetailState> emit,
  ) async {
    try {
      await isarService.eliminarAnimal(event.animalId);
      emit(AnimalDeletedSuccess());
    } catch (e) {
      emit(ShowErrorMessage('Error al eliminar: ${e.toString()}'));
    }
  }
}
```

**Convenciones de BLoC:**
- Dependencias inyectadas en constructor
- State inicial en `super()`
- Registrar handlers en constructor
- Nombres de handlers: `_on{EventName}`
- Handlers async cuando acceden a servicios
- Handlers síncronos para acciones simples

### Uso en UI

```dart
// ✅ PATRÓN CORRECTO

// 1. BlocProvider - Inyectar el BLoC
BlocProvider<CattleDetailBloc>(
  create: (context) => CattleDetailBloc(
    isarService: RepositoryProvider.of<IsarService>(context),
  )..add(LoadCattleDetail(animalId)),
  child: CattleDetailView(),
)

// 2. BlocBuilder - Para reconstruir UI
BlocBuilder<CattleDetailBloc, CattleDetailState>(
  builder: (context, state) {
    if (state is CattleDetailLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    
    if (state is CattleDetailLoaded) {
      return DetailView(
        animal: state.animal,
        eventos: state.eventos,
      );
    }
    
    if (state is CattleDetailError) {
      return Center(child: Text('Error: ${state.message}'));
    }
    
    return Container();
  },
)

// 3. BlocListener - Para efectos secundarios
BlocListener<CattleDetailBloc, CattleDetailState>(
  listener: (context, state) {
    if (state is ShowSuccessMessage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Colors.green,
        ),
      );
    }
    
    if (state is ShowErrorMessage) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Colors.red,
        ),
      );
    }
    
    if (state is NavigateToEditScreen) {
      Navigator.pushNamed(
        context,
        '/edit-animal',
        arguments: state.animal,
      );
    }
    
    if (state is AnimalDeletedSuccess) {
      Navigator.pop(context);
    }
  },
  child: MyContent(),
)

// 4. Disparar eventos
ElevatedButton(
  onPressed: () {
    context.read<CattleDetailBloc>().add(
      EditAnimalClicked(animal),
    );
  },
  child: const Text('Editar'),
)
```

---

## 🗄️ Modelos Isar

### Estructura de Modelo

```dart
// ✅ PATRÓN CORRECTO
import 'package:isar/isar.dart';

part 'animal_model.g.dart';

@collection
class Animal {
  // 1. ID (siempre primero)
  Id id = Isar.autoIncrement;
  
  // 2. Propiedades requeridas (late)
  late String nombre;
  late String raza;
  
  // 3. Enums
  @enumerated
  late Sexo sexo;
  
  @enumerated
  late EstadoAnimal estado;
  
  // 4. Propiedades opcionales
  String? observaciones;
  String? numeroArete;
  
  // 5. Fechas
  DateTime? fechaNacimiento;
  DateTime? fechaRegistro;
  
  // 6. Embedded objects
  SinigaId? sinigaId;
  
  // 7. Constructor con valores por defecto
  Animal({
    this.id = Isar.autoIncrement,
    this.nombre = '',
    this.raza = '',
    this.sexo = Sexo.macho,
    this.estado = EstadoAnimal.activo,
    this.observaciones,
    this.numeroArete,
    this.fechaNacimiento,
    this.fechaRegistro,
    this.sinigaId,
  });
  
  // 8. Métodos helper
  bool get esActivo => estado == EstadoAnimal.activo;
  
  int get edadEnMeses {
    if (fechaNacimiento == null) return 0;
    return DateTime.now().difference(fechaNacimiento!).inDays ~/ 30;
  }
}

// Embedded Object (sin @collection)
@embedded
class SinigaId {
  String? especie;
  String? estadoClave;
  String? numeroNacional;
  
  SinigaId({
    this.especie = '00',
    this.estadoClave,
    this.numeroNacional,
  });
  
  @override
  String toString() {
    if (especie == null || estadoClave == null || numeroNacional == null) {
      return '';
    }
    return '$especie$estadoClave$numeroNacional';
  }
}
```

**Convenciones Isar:**
- Decorador `@collection` para entidades principales
- Decorador `@embedded` para objetos anidados
- `Id id = Isar.autoIncrement` para IDs auto-generados
- `@enumerated` para enums
- `late` para propiedades requeridas
- `?` para propiedades opcionales
- Part directive para archivo generado

### Generar Código Isar

```bash
# Generar una vez
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerar al guardar)
flutter pub run build_runner watch --delete-conflicting-outputs
```

---

## 🎨 Widgets

### Widget Stateless

```dart
// ✅ PATRÓN CORRECTO
class MiCardWidget extends StatelessWidget {
  // 1. Propiedades (final)
  final String titulo;
  final String? subtitulo;
  final IconData icono;
  final VoidCallback? onTap;
  final Color? color;

  // 2. Constructor const cuando sea posible
  const MiCardWidget({
    super.key,
    required this.titulo,
    this.subtitulo,
    required this.icono,
    this.onTap,
    this.color,
  });

  // 3. Build method
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icono, color: color ?? theme.primaryColor),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titulo, style: theme.textTheme.titleMedium),
                    if (subtitulo != null)
                      Text(subtitulo!, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Widget Stateful

```dart
// ✅ PATRÓN CORRECTO
class AnimatedCounterWidget extends StatefulWidget {
  // 1. Propiedades
  final int initialValue;
  final ValueChanged<int>? onChanged;

  // 2. Constructor
  const AnimatedCounterWidget({
    super.key,
    this.initialValue = 0,
    this.onChanged,
  });

  @override
  State<AnimatedCounterWidget> createState() => _AnimatedCounterWidgetState();
}

class _AnimatedCounterWidgetState extends State<AnimatedCounterWidget>
    with SingleTickerProviderStateMixin {
  // 1. Variables de estado
  late int _counter;
  
  // 2. Controllers y Animaciones
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  // 3. Lifecycle - initState
  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  // 4. Lifecycle - dispose
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 5. Build method
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _decrementar,
        ),
        ScaleTransition(
          scale: _scaleAnimation,
          child: Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _incrementar,
        ),
      ],
    );
  }

  // 6. Métodos privados
  void _incrementar() {
    setState(() => _counter++);
    _controller.forward().then((_) => _controller.reverse());
    widget.onChanged?.call(_counter);
  }

  void _decrementar() {
    if (_counter > 0) {
      setState(() => _counter--);
      _controller.forward().then((_) => _controller.reverse());
      widget.onChanged?.call(_counter);
    }
  }
}
```

---

## 🔧 Servicios

```dart
// ✅ PATRÓN CORRECTO
class IsarService {
  // 1. Singleton o instancia estática
  static Isar? _isar;
  
  // 2. Método de inicialización
  static Future<void> init() async {
    if (_isar != null) return;
    
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [AnimalSchema, EventoSanitarioSchema],
      directory: dir.path,
    );
  }

  // 3. Getter para acceder a la instancia
  Isar get isar {
    if (_isar == null) {
      throw Exception('IsarService no inicializado. Llama a init() primero.');
    }
    return _isar!;
  }

  // 4. Métodos CRUD
  Future<void> guardarAnimal(Animal animal) async {
    await isar.writeTxn(() async {
      await isar.animals.put(animal);
    });
  }

  Future<Animal?> obtenerAnimalPorId(int id) async {
    return await isar.animals.get(id);
  }

  Future<List<Animal>> obtenerTodosLosAnimales() async {
    return await isar.animals.where().findAll();
  }

  Future<void> eliminarAnimal(int id) async {
    await isar.writeTxn(() async {
      await isar.animals.delete(id);
    });
  }

  // 5. Queries complejas
  Future<List<Animal>> obtenerAnimalesActivos() async {
    return await isar.animals
        .filter()
        .estadoEqualTo(EstadoAnimal.activo)
        .findAll();
  }

  Future<List<Animal>> buscarPorNombre(String query) async {
    return await isar.animals
        .filter()
        .nombreContains(query, caseSensitive: false)
        .findAll();
  }
}
```

---

## 📊 Enums

```dart
// ✅ PATRÓN CORRECTO
@Name("sexo_enum")
enum Sexo {
  @Name("macho")
  macho,
  
  @Name("hembra")
  hembra;

  // Métodos helper
  String get displayName {
    switch (this) {
      case Sexo.macho:
        return 'Macho';
      case Sexo.hembra:
        return 'Hembra';
    }
  }
  
  IconData get icono {
    switch (this) {
      case Sexo.macho:
        return Icons.male;
      case Sexo.hembra:
        return Icons.female;
    }
  }
}

enum EstadoAnimal {
  activo,
  vendido,
  muerto,
  transferido;

  String get displayName {
    switch (this) {
      case EstadoAnimal.activo:
        return 'Activo';
      case EstadoAnimal.vendido:
        return 'Vendido';
      case EstadoAnimal.muerto:
        return 'Muerto';
      case EstadoAnimal.transferido:
        return 'Transferido';
    }
  }
  
  Color get color {
    switch (this) {
      case EstadoAnimal.activo:
        return Colors.green;
      case EstadoAnimal.vendido:
        return Colors.blue;
      case EstadoAnimal.muerto:
        return Colors.red;
      case EstadoAnimal.transferido:
        return Colors.orange;
    }
  }
}
```

---

## ✅ Checklist de Código

Antes de hacer commit, verifica:

- [ ] Nombres de archivos en `snake_case`
- [ ] Nombres de clases en `PascalCase`
- [ ] Variables y funciones en `camelCase`
- [ ] Miembros privados con prefijo `_`
- [ ] Imports ordenados correctamente
- [ ] BLoC con event/state en archivos separados (part of)
- [ ] Modelos Isar con `@collection` o `@embedded`
- [ ] Widgets const cuando sea posible
- [ ] Manejo de errores con try-catch
- [ ] Null safety aplicado correctamente
- [ ] Código generado actualizado (`build_runner`)

---

**Última actualización:** Octubre 2025
