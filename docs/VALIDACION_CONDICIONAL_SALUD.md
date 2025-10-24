# 🏥 Validación Condicional de Salud

**Fecha:** Octubre 2025
**Funcionalidad:** Campos condicionales en el formulario de salud

---

## 🎯 OBJETIVO

Cuando el estado de salud de un animal es **Enfermo**, **Crítico** o **En Tratamiento**, el sistema debe solicitar obligatoriamente una descripción detallada de la situación médica.

---

## ✅ ESTADOS QUE REQUIEREN DESCRIPCIÓN

```
Estados críticos (descripción OBLIGATORIA):
├─ Enfermo
├─ Crítico
└─ En Tratamiento

Estados normales (descripción NO requerida):
├─ Sano
├─ Convaleciente
└─ En Observación
```

---

## 🎨 COMPORTAMIENTO DE LA INTERFAZ

### Cuando el estado NO requiere descripción:

```
┌─────────────────────────────────────────────┐
│ Estado de Salud                             │
│ [🟢 Sano              ▼]                    │
│                                             │
│ Estado del Animal                           │
│ [Activo              ▼]                     │
└─────────────────────────────────────────────┘
```

### Cuando el estado SÍ requiere descripción:

```
┌─────────────────────────────────────────────┐
│ Estado de Salud                             │
│ [🟠 Enfermo           ▼]                    │
│                                             │
│ Estado del Animal                           │
│ [Enfermo             ▼]                     │
│                                             │
│ ┌─────────────────────────────────────────┐ │
│ │ ⚠️ Se requiere especificar el          │ │
│ │    diagnóstico, tratamiento o          │ │
│ │    situación del animal                │ │
│ └─────────────────────────────────────────┘ │
│                                             │
│ Descripción de la Situación *              │
│ ┌─────────────────────────────────────────┐ │
│ │ Ej: Fiebre alta, tratamiento con       │ │
│ │ antibióticos...                         │ │
│ │                                         │ │
│ └─────────────────────────────────────────┘ │
│ Especifique diagnóstico, síntomas o        │
│ tratamiento aplicado                       │
└─────────────────────────────────────────────┘
```

---

## 💻 IMPLEMENTACIÓN TÉCNICA

### 1. Modelo de Datos

**Archivo:** `lib/nucleo/modelos/animal_model.dart`

```dart
// Nuevo campo agregado
String? descripcionSalud;
```

- **Tipo:** String nullable
- **Ubicado en:** Sección ESTADO Y SALUD (línea 72)
- **Propósito:** Almacenar la descripción médica cuando el estado lo requiere

---

### 2. Controlador del Formulario

**Archivo:** `lib/presentation/forms/animal_form/controllers/animal_form_controller.dart`

#### TextEditingController:
```dart
late final TextEditingController descripcionSaludController;
```

#### Inicialización:
```dart
descripcionSaludController = TextEditingController(
  text: animalOriginal?.descripcionSalud ?? ''
);
```

#### Método de Validación:
```dart
bool requiereDescripcionSalud(EstadoSalud? estado) {
  if (estado == null) return false;
  return estado == EstadoSalud.enfermo ||
         estado == EstadoSalud.critico ||
         estado == EstadoSalud.enTratamiento;
}
```

#### Lógica al Cambiar Estado:
```dart
void setEstadoSalud(EstadoSalud estado) {
  _estadoSalud = estado;
  // Limpiar la descripción si el nuevo estado no la requiere
  if (!requiereDescripcionSalud(estado)) {
    descripcionSaludController.clear();
  }
  notifyListeners();
}
```

#### Guardado en buildAnimal():
```dart
..estadoSalud = _estadoSalud
..descripcionSalud = descripcionSaludController.text.isEmpty
    ? null
    : descripcionSaludController.text
```

---

### 3. Widget del Formulario

**Archivo:** `lib/presentation/forms/animal_form/widgets/health_form_section.dart`

#### Renderizado Condicional:
```dart
// Campo condicional: Descripción de la situación de salud
if (controller.requiereDescripcionSalud(controller.estadoSalud)) ...[
  // Banner informativo
  Container(...),

  // Campo de texto
  TextFormField(
    controller: controller.descripcionSaludController,
    validator: (value) {
      if (controller.requiereDescripcionSalud(controller.estadoSalud)) {
        if (value == null || value.trim().isEmpty) {
          return 'Debe especificar la situación de salud del animal';
        }
        if (value.trim().length < 10) {
          return 'La descripción debe tener al menos 10 caracteres';
        }
      }
      return null;
    },
  ),
],
```

---

## 🎨 CARACTERÍSTICAS DE UX

### Banner Informativo:
- **Color:** Adaptativo según el estado de salud
  - Enfermo: 🟠 Naranja
  - Crítico: 🔴 Rojo
  - En Tratamiento: 🟣 Morado
- **Mensaje:** "Se requiere especificar el diagnóstico, tratamiento o situación del animal"
- **Icono:** ⚠️ Warning amber rounded

### Campo de Texto:
- **Label:** "Descripción de la Situación *"
- **Placeholder:** "Ej: Fiebre alta, tratamiento con antibióticos..."
- **Helper text:** "Especifique diagnóstico, síntomas o tratamiento aplicado"
- **Tipo:** Multilinea (3 líneas)
- **Capitalización:** Por oraciones
- **Validaciones:**
  - ❌ Campo vacío: "Debe especificar la situación de salud del animal"
  - ❌ Menos de 10 caracteres: "La descripción debe tener al menos 10 caracteres"

---

## 🔄 FLUJO DE USUARIO

### Escenario 1: Animal Sano → Animal Enfermo

```
1. Usuario abre el formulario
2. Estado de Salud = "Sano"
3. [Campo de descripción NO visible]
4. Usuario cambia a "Enfermo"
5. ✨ Campo de descripción APARECE automáticamente
6. 🟠 Banner naranja con advertencia
7. Usuario escribe: "Fiebre de 40°C, tratamiento con antibióticos"
8. ✅ Validación pasa
9. Animal guardado con descripción
```

### Escenario 2: Animal Enfermo → Animal Sano

```
1. Usuario edita animal enfermo
2. Estado de Salud = "Enfermo"
3. [Campo de descripción visible con texto previo]
4. Usuario cambia a "Sano"
5. ✨ Campo de descripción DESAPARECE automáticamente
6. 🗑️ Descripción se limpia del controller
7. ✅ Animal guardado sin descripción
```

### Escenario 3: Intento de Guardar Sin Descripción

```
1. Usuario selecciona "Crítico"
2. [Campo de descripción aparece]
3. Usuario NO escribe nada
4. Usuario presiona "Registrar Animal"
5. ❌ Validación falla
6. Mensaje: "Debe especificar la situación de salud del animal"
7. Campo se resalta en rojo
8. Usuario debe completar antes de continuar
```

---

## ✅ VALIDACIONES IMPLEMENTADAS

### 1. Validación de Existencia
```dart
if (value == null || value.trim().isEmpty) {
  return 'Debe especificar la situación de salud del animal';
}
```

### 2. Validación de Longitud Mínima
```dart
if (value.trim().length < 10) {
  return 'La descripción debe tener al menos 10 caracteres';
}
```

### 3. Validación Condicional
```dart
if (controller.requiereDescripcionSalud(controller.estadoSalud)) {
  // Validar solo si el estado lo requiere
}
```

---

## 📊 CASOS DE PRUEBA

### ✅ Caso 1: Registro con Estado Crítico
```
Entrada:
- Estado de Salud: Crítico
- Descripción: "Dificultad respiratoria severa, oxigenoterapia aplicada"

Resultado:
✅ Campo visible
✅ Validación pasa (> 10 caracteres)
✅ Animal guardado con descripción
```

### ✅ Caso 2: Registro con Estado Sano
```
Entrada:
- Estado de Salud: Sano
- Descripción: [Campo no visible]

Resultado:
✅ Campo no aparece
✅ No se requiere descripción
✅ Animal guardado sin descripción (null)
```

### ❌ Caso 3: Estado Enfermo Sin Descripción
```
Entrada:
- Estado de Salud: Enfermo
- Descripción: ""

Resultado:
❌ Validación falla
❌ Mensaje de error mostrado
❌ No se permite guardar
```

### ❌ Caso 4: Descripción Muy Corta
```
Entrada:
- Estado de Salud: En Tratamiento
- Descripción: "Fiebre"

Resultado:
❌ Validación falla (solo 6 caracteres)
❌ Mensaje: "La descripción debe tener al menos 10 caracteres"
❌ No se permite guardar
```

### ✅ Caso 5: Cambio de Estado con Limpieza
```
Entrada:
- Estado inicial: Enfermo
- Descripción: "Infección ocular"
- Cambio a: Sano

Resultado:
✅ Campo desaparece
✅ Descripción se limpia automáticamente
✅ Animal actualizado sin descripción
```

---

## 🎓 PATRONES DE DISEÑO UTILIZADOS

### 1. Renderizado Condicional
```dart
if (condicion) ...[
  Widget1(),
  Widget2(),
],
```

### 2. Validación Reactiva
- El formulario reacciona automáticamente a cambios de estado
- Notificación mediante `notifyListeners()`

### 3. Single Source of Truth
- El estado se maneja centralmente en `AnimalFormController`
- El widget solo refleja el estado, no lo modifica directamente

### 4. Validación en Múltiples Capas
- UX: Campo visible solo cuando es necesario
- Controller: Limpieza automática del campo
- Validador: Verificación al intentar guardar

---

## 💾 ALMACENAMIENTO EN BASE DE DATOS

El campo se almacena en Isar como:

```dart
@collection
class Animal {
  ...
  String? descripcionSalud;
  ...
}
```

**Características:**
- ✅ Nullable (opcional en estados normales)
- ✅ Indexable (puede agregar `@Index()` si se necesita búsqueda)
- ✅ Migración automática (Isar maneja el nuevo campo)

---

## 🚀 MEJORAS FUTURAS OPCIONALES

### 1. Historial de Descripciones
```dart
List<DescripcionSalud> historialSalud = [];

class DescripcionSalud {
  DateTime fecha;
  EstadoSalud estado;
  String descripcion;
  String? veterinario;
}
```

### 2. Templates de Descripción
```dart
final templates = [
  'Tratamiento antibiótico iniciado',
  'Fiebre de {temperatura}°C detectada',
  'Lesión en {zona}, requiere atención veterinaria',
];
```

### 3. Fotos de Evidencia
```dart
List<String> fotosSituacion = [];
```

### 4. Recordatorios de Seguimiento
```dart
DateTime? proximaRevision;
bool requiereSeguimiento;
```

---

**Autor:** Equipo SIREGA
**Fecha:** Octubre 2025
**Estado:** ✅ Implementado y Verificado

¡Funcionalidad de validación condicional completamente operativa! 🏥
