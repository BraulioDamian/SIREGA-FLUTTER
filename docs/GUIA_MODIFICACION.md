# 🔍 Guía de Modificación de Código - SIREGA

## 📋 Proceso de Modificación

Esta guía te ayudará a realizar cambios consistentes en el proyecto SIREGA siguiendo los patrones establecidos.

---

## 🚀 Antes de Modificar Código

### 1. Leer la Documentación
```
docs/
├── ARQUITECTURA_DEL_PROYECTO.md  ← Lee PRIMERO
├── PATRONES_Y_CONVENCIONES.md    ← Revisa antes de codificar
└── GUIA_MODIFICACION.md          ← Este archivo
```

### 2. Entender el Contexto
- ¿En qué módulo estás trabajando?
- ¿Qué patrón usa (BLoC, repositorio, servicio)?
- ¿Existen componentes similares que puedas replicar?

### 3. Buscar Ejemplos Similares
```bash
# Buscar implementaciones similares
grep -r "nombre_del_patron" lib/

# Ejemplo: Buscar otros BLoCs
grep -r "extends Bloc" lib/modulos/
```

---

## 📝 Checklist por Tipo de Modificación

### ✅ Agregar un Nuevo Modelo Isar

- [ ] Crear archivo en `lib/nucleo/modelos/nombre_model.dart`
- [ ] Usar decorador `@collection` o `@embedded`
- [ ] Incluir `part 'nombre_model.g.dart';`
- [ ] Definir `Id id = Isar.autoIncrement`
- [ ] Usar `late` para campos requeridos
- [ ] Usar `?` para campos opcionales
- [ ] Agregar constructor con valores por defecto
- [ ] Ejecutar: `flutter pub run build_runner build --delete-conflicting-outputs`
- [ ] Registrar schema en `IsarService.init()`

**Ejemplo:**
```dart
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
  
  MiModelo({
    this.id = Isar.autoIncrement,
    this.nombre = '',
    this.descripcion,
    this.tipo = MiEnum.valorDefault,
    this.fechaCreacion,
  });
}
```

### ✅ Agregar un Nuevo BLoC

- [ ] Crear carpeta `bloc/` en el módulo
- [ ] Crear 3 archivos:
  - `nombre_bloc.dart`
  - `nombre_event.dart`
  - `nombre_state.dart`
- [ ] En event: definir clase base abstracta y eventos concretos
- [ ] En state: definir estados de UI y estados de acción
- [ ] En bloc: registrar handlers en constructor
- [ ] Inyectar dependencias en constructor
- [ ] Usar `Emitter<State>` en handlers
- [ ] Manejar errores con try-catch

**Estructura:**
```
modulos/mi_modulo/
└── bloc/
    ├── mi_bloc.dart
    ├── mi_event.dart
    └── mi_state.dart
```

### ✅ Agregar una Nueva Pantalla

- [ ] Crear archivo en `modulos/N_nombre/presentacion/pantallas/`
- [ ] Extender `StatelessWidget` o `StatefulWidget`
- [ ] Incluir `BlocProvider` si usa BLoC
- [ ] Separar `BlocBuilder` (UI) y `BlocListener` (acciones)
- [ ] Usar `const` donde sea posible
- [ ] Agregar navegación en archivo de rutas

**Plantilla:**
```dart
class MiNuevaPantalla extends StatelessWidget {
  const MiNuevaPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MiBloc>(
      create: (context) => MiBloc(
        service: RepositoryProvider.of<IsarService>(context),
      )..add(CargarDatosIniciales()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Mi Pantalla')),
        body: BlocListener<MiBloc, MiState>(
          listener: (context, state) {
            // Acciones (snackbars, navegación)
          },
          child: BlocBuilder<MiBloc, MiState>(
            builder: (context, state) {
              // UI según el estado
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
```

### ✅ Agregar un Nuevo Widget Reutilizable

- [ ] Crear archivo en `lib/presentation/widgets/` o `modulo/presentacion/widgets/`
- [ ] Usar `const` constructor cuando sea posible
- [ ] Documentar parámetros requeridos
- [ ] Proporcionar valores por defecto
- [ ] Hacer responsive con `MediaQuery` o `LayoutBuilder`

**Plantilla:**
```dart
class MiWidget extends StatelessWidget {
  final String titulo;
  final String? subtitulo;
  final VoidCallback? onTap;
  final Color? color;

  const MiWidget({
    super.key,
    required this.titulo,
    this.subtitulo,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(titulo),
        ),
      ),
    );
  }
}
```

### ✅ Agregar un Nuevo Servicio

- [ ] Crear archivo en `lib/nucleo/servicios/`
- [ ] Implementar patrón Singleton si es global
- [ ] Incluir método `init()` para inicialización
- [ ] Manejar errores apropiadamente
- [ ] Documentar métodos públicos

**Plantilla:**
```dart
class MiServicio {
  static MiServicio? _instance;
  
  static MiServicio get instance {
    _instance ??= MiServicio._();
    return _instance!;
  }
  
  MiServicio._();
  
  Future<void> init() async {
    // Inicialización
  }
  
  Future<void> miMetodo() async {
    try {
      // Lógica
    } catch (e) {
      throw Exception('Error en MiServicio: $e');
    }
  }
}
```

### ✅ Modificar un Modelo Existente

- [ ] Agregar/modificar propiedades
- [ ] Actualizar constructor
- [ ] Regenerar código: `flutter pub run build_runner build --delete-conflicting-outputs`
- [ ] Verificar que no rompa código existente
- [ ] Actualizar migraciones si es necesario

### ✅ Agregar un Nuevo Enum

- [ ] Crear en `lib/nucleo/modelos/enums.dart`
- [ ] Usar `@Name()` para nombres en Isar
- [ ] Agregar métodos helper (displayName, icono, color)

**Plantilla:**
```dart
@Name("mi_enum")
enum MiEnum {
  @Name("opcion1")
  opcion1,
  
  @Name("opcion2")
  opcion2;

  String get displayName {
    switch (this) {
      case MiEnum.opcion1:
        return 'Opción 1';
      case MiEnum.opcion2:
        return 'Opción 2';
    }
  }
  
  IconData get icono {
    switch (this) {
      case MiEnum.opcion1:
        return Icons.check;
      case MiEnum.opcion2:
        return Icons.close;
    }
  }
}
```

---

## 🔧 Comandos Frecuentes

```bash
# Generar código Isar
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerar)
flutter pub run build_runner watch --delete-conflicting-outputs

# Limpiar y reconstruir
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

# Ejecutar app
flutter run

# Ver errores
flutter analyze
```

---

## 🎯 Patrones Comunes

### Manejo de Estado con BLoC

**Cargar datos al iniciar:**
```dart
BlocProvider<MiBloc>(
  create: (context) => MiBloc(
    service: RepositoryProvider.of<IsarService>(context),
  )..add(CargarDatosIniciales()),  // ← Dispara evento inicial
  child: MiWidget(),
)
```

**Acceder al BLoC desde UI:**
```dart
// Para disparar eventos
context.read<MiBloc>().add(MiEvento());

// Para escuchar estado
context.watch<MiBloc>().state;

// Para leer una vez
final bloc = context.read<MiBloc>();
```

### Navegación

**Navegación simple:**
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => MiPantalla(),
  ),
);
```

**Navegación con nombre:**
```dart
Navigator.pushNamed(
  context,
  '/ruta',
  arguments: misDatos,
);
```

**Navegación desde BLoC (Action State):**
```dart
// En State
class NavigarADetalle extends MiActionState {
  final Animal animal;
  NavigarADetalle(this.animal);
}

// En BLoC
emit(NavigarADetalle(animal));

// En UI (BlocListener)
if (state is NavigarADetalle) {
  Navigator.pushNamed(context, '/detalle', arguments: state.animal);
}
```

### Mostrar Mensajes

**Desde BLoC:**
```dart
// En State
class MostrarMensaje extends MiActionState {
  final String mensaje;
  final bool esError;
  MostrarMensaje(this.mensaje, {this.esError = false});
}

// En BLoC
emit(MostrarMensaje('Operación exitosa'));

// En UI (BlocListener)
if (state is MostrarMensaje) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(state.mensaje),
      backgroundColor: state.esError ? Colors.red : Colors.green,
    ),
  );
}
```

### Formularios

**Con controllers:**
```dart
class _MiFormState extends State<MiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  
  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }
  
  void _guardar() {
    if (_formKey.currentState!.validate()) {
      context.read<MiBloc>().add(
        GuardarDatos(_nombreController.text),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nombreController,
            decoration: const InputDecoration(labelText: 'Nombre'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo requerido';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: _guardar,
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
```

---

## 🐛 Resolución de Problemas Comunes

### Error: "The declaration 'X' isn't referenced"

**Solución:** Eliminar el código no usado o usarlo en alguna parte.

```dart
// ❌ Método privado no usado
bool _esValidoSync() { ... }

// ✅ Solución 1: Eliminarlo
// (borrar el método)

// ✅ Solución 2: Usarlo
bool get esValido => _esValidoSync();
```

### Error: "Missing part of directive"

**Solución:** Agregar `part of` en archivos event y state.

```dart
// En nombre_event.dart
part of 'nombre_bloc.dart';

// En nombre_state.dart
part of 'nombre_bloc.dart';
```

### Error: "Could not find Isar schema"

**Solución:** Regenerar código y registrar en IsarService.

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

```dart
// En isar_service.dart
_isar = await Isar.open([
  AnimalSchema,
  EventoSanitarioSchema,
  MiNuevoModeloSchema,  // ← Agregar
], directory: dir.path);
```

### Error: "BlocProvider not found"

**Solución:** Asegurarse de que el widget está envuelto en BlocProvider.

```dart
// ❌ Incorrecto
class MiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context.read<MiBloc>()... ← Error: no provider
    return Container();
  }
}

// ✅ Correcto
class MiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MiBloc>(
      create: (context) => MiBloc(...),
      child: MiContent(),  // ← Aquí sí puede acceder al bloc
    );
  }
}
```

---

## 📚 Recursos Adicionales

- **Documentación del Proyecto:**
  - `docs/ARQUITECTURA_DEL_PROYECTO.md`
  - `docs/PATRONES_Y_CONVENCIONES.md`

- **Documentación Externa:**
  - [Flutter BLoC](https://bloclibrary.dev/)
  - [Isar Database](https://isar.dev/)
  - [Flutter Docs](https://docs.flutter.dev/)

---

## ✅ Checklist Final

Antes de hacer commit:

- [ ] El código sigue las convenciones de nomenclatura
- [ ] Los imports están ordenados correctamente
- [ ] No hay warnings ni errores de análisis
- [ ] El código compilado y ejecuta correctamente
- [ ] Si modificaste modelos Isar, regeneraste el código
- [ ] Los cambios siguen el patrón BLoC si aplica
- [ ] Agregaste manejo de errores apropiado
- [ ] Los widgets usan `const` donde sea posible
- [ ] Documentaste código complejo si es necesario

---

**Última actualización:** Octubre 2025
