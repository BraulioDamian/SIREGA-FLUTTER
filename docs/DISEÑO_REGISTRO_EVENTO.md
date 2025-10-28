# 📋 Diseño: Registro de Evento

## 🎯 Objetivo
Permitir el registro rápido y eficiente de eventos sanitarios (vacunaciones, desparasitaciones, tratamientos) para uno o múltiples animales de forma intuitiva.

---

## 📝 Nota de Arquitectura (Refactorización)

Anteriormente, el proyecto contaba con dos módulos separados: `3_registro_evento` y `5_registro_evento_masivo`. Para simplificar la estructura y evitar duplicación, se han unificado en un solo módulo.

-   **Ubicación Actual:** Toda la funcionalidad de registro de eventos (tanto para uno como para múltiples animales) se encuentra ahora en `lib/modulos/3_registro_evento/`.
-   **Nombre del Módulo:** El módulo se llama `3_registro_evento`.
-   **Servicio:** El servicio para guardar los datos ha sido renombrado a `RegistroEventoService` y se encuentra en `aplicacion/registro_evento_service.dart` dentro del módulo.

Este documento ahora describe el flujo unificado para el registro de cualquier tipo de evento.

---

## 🔄 Flujo Principal Propuesto

### **Opción 1: Inicio desde la Pantalla Principal**
```
Pantalla Principal → Sección "Acciones Principales" → "Registrar Evento"
```

### **Opción 2: Inicio desde Detalle de Animal**
```
Detalle Animal → FAB "Registrar Evento" (naranja)
```

---

## 📱 PANTALLA 1: Tipo de Evento

### **Layout:**
```
┌─────────────────────────────────────┐
│ ← Registrar Evento                  │
├─────────────────────────────────────┤
│                                     │
│  Selecciona el tipo de evento:     │
│                                     │
│  ┌────────────────────────────┐    │
│  │ 💉 Vacunación              │    │
│  │ Aplicar vacunas al ganado  │    │
│  └────────────────────────────┘    │
│                                     │
│  ┌────────────────────────────┐    │
│  │ 🐛 Desparasitación         │    │
│  │ Aplicar desparasitante     │    │
│  └────────────────────────────┘    │
│                                     │
│  ┌────────────────────────────┐    │
│  │ 💊 Tratamiento Médico      │    │
│  │ Medicamentos y antibióticos│    │
│  └────────────────────────────┘    │
│                                     │
│  ┌────────────────────────────┐    │
│  │ 🔬 Revisión Veterinaria    │    │
│  │ Chequeo general o diagnóstico│  │
│  └────────────────────────────┘    │
│                                     │
│  ┌────────────────────────────┐    │
│  │ ✂️  Castración             │    │
│  │ Procedimiento quirúrgico   │    │
│  └────────────────────────────┘    │
│                                     │
└─────────────────────────────────────┘
```

**Características:**
- Cards grandes y claras con íconos
- Descripción breve de cada tipo
- Al presionar → PANTALLA 2

---

## 📱 PANTALLA 2: Datos del Evento

### **Layout Mejorado (con Dropdown Inteligente):**
```
┌─────────────────────────────────────┐
│ ← Vacunación                        │
├─────────────────────────────────────┤
│                                     │
│ Información del Evento              │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ Producto/Vacuna *           │    │
│ │ [Complejo Respiratorio ▼]   │    │
│ └─────────────────────────────┘    │
│  ┌────────────────────────────┐    │
│  │ 🔍 Buscar producto...      │    │
│  ├────────────────────────────┤    │
│  │ --- Sugerencias ---        │    │
│  │ ✅ Complejo Respiratorio   │    │
│  │    (IBR, DVB, PI3, VRSB)    │    │
│  │                              │    │
│  │ ☐ Clostridial 8 vías       │    │
│  │ ☐ Rabia Paralítica (Derriengue)│    │
│  │ ☐ Brucelosis Cepa RB51     │    │
│  │                              │    │
│  │ --- Refuerzos ---          │    │
│  │ ☐ Refuerzo Anual Complejo  │    │
│  ├────────────────────────────┤    │
│  │ ➕ Registrar nuevo producto │    │
│  └────────────────────────────┘    │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ Fecha de Aplicación *       │    │
│ │ [📅 25/10/2025]             │    │
│ └─────────────────────────────┘    │
│                                     │
│ ┌───────────┐ ┌───────────┐   │    │
│ │ Dosis *   │ │ Unidad    │   │    │
│ │ [ 5.0 ]   │ │ [ ml ▼]   │   │    │
│ └───────────┘ └───────────┘   │    │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ Veterinario                 │    │
│ │ [Nombre opcional]           │    │
│ └─────────────────────────────┘    │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ Notas                       │    │
│ │ [Opcional...]               │    │
│ └─────────────────────────────┘    │
│                                     │
│        [Continuar ➜]               │
│                                     │
└─────────────────────────────────────┘
```

**Características:**
- **Dropdown Inteligente:**
  - **Búsqueda Rápida:** Filtra la lista mientras escribes.
  - **Sugerencias:** Muestra las vacunas más comunes para ganado.
  - **Categorías:** Separa vacunas primarias de refuerzos.
  - **Personalización:** Permite agregar un nuevo producto si no está en la lista.
- **Campos Claros:** Dosis y unidad están separados para mayor claridad.
- **Validación en tiempo real.**
- Al presionar "Continuar" → PANTALLA 3

---

## 📱 PANTALLA 3: Selección de Animales

### **🔥 PANTALLA CLAVE - Dos Modos:**

### **Modo A: Selección Manual (por defecto)**

```
┌─────────────────────────────────────┐
│ ← Seleccionar Animales          [⚡]│
├─────────────────────────────────────┤
│ 💉 Vacunación: BOBACT 8             │
│ 📅 25/10/2025                       │
├─────────────────────────────────────┤
│                                     │
│ [🔍 Buscar por nombre o ID...]     │
│                                     │
│ ┌─ Filtros ─────────────────────┐  │
│ │ [Todas] [Hembras] [Machos]    │  │
│ │ [Activos] [Zona A ▼]          │  │
│ └───────────────────────────────┘  │
│                                     │
│ ☑️ Seleccionar Todos (45)          │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ ☑️ 🐄 Mariposa              │    │
│ │    00-19-12345678           │    │
│ │    Hembra · Holstein · 2 años│   │
│ └─────────────────────────────┘    │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ ☑️ 🐂 Trueno                │    │
│ │    00-19-87654321           │    │
│ │    Macho · Angus · 3 años   │    │
│ └─────────────────────────────┘    │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ ☐ 🐄 Luna                   │    │
│ │    00-19-11111111           │    │
│ │    Hembra · Jersey · 1 año  │    │
│ └─────────────────────────────┘    │
│                                     │
│ ─────────────────────────────────  │
│                                     │
│ [Cambiar a Modo Escaneo 📡]        │
│                                     │
│ ┌───────────────────────────────┐  │
│ │ 2 animales seleccionados      │  │
│ │ [Registrar Evento ✓]          │  │
│ └───────────────────────────────┘  │
└─────────────────────────────────────┘
```

**Características Modo Manual:**
- ✅ Lista completa de animales activos
- ✅ Checkboxes grandes y fáciles de tocar
- ✅ Búsqueda en tiempo real
- ✅ Filtros por sexo, zona, edad
- ✅ "Seleccionar Todos" para aplicar al rancho completo
- ✅ Contador de seleccionados en tiempo real
- ✅ Botón flotante siempre visible

---

### **Modo B: Escaneo NFC (alternativo)**

```
┌─────────────────────────────────────┐
│ ← Escanear Animales             [☰]│
├─────────────────────────────────────┤
│ 💉 Vacunación: BOBACT 8             │
│ 📅 25/10/2025                       │
├─────────────────────────────────────┤
│                                     │
│        ┌─────────────────┐          │
│        │                 │          │
│        │      📡         │          │
│        │                 │          │
│        │  Acerca el      │          │
│        │  chip NFC       │          │
│        │                 │          │
│        │   [Scanning]    │          │
│        │                 │          │
│        └─────────────────┘          │
│                                     │
│ Animales Escaneados (3):            │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ ✅ Mariposa                 │ ❌ │
│ │    00-19-12345678           │    │
│ │    Hace 2 min               │    │
│ └─────────────────────────────┘    │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ ✅ Trueno                   │ ❌ │
│ │    00-19-87654321           │    │
│ │    Hace 5 min               │    │
│ └─────────────────────────────┘    │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ ✅ Luna                     │ ❌ │
│ │    00-19-11111111           │    │
│ │    Hace 8 min               │    │
│ └─────────────────────────────┘    │
│                                     │
│ ─────────────────────────────────  │
│                                     │
│ [Cambiar a Modo Manual 📋]         │
│                                     │
│ [Agregar Manual +]                  │
│                                     │
│ ┌───────────────────────────────┐  │
│ │ 3 animales escaneados         │  │
│ │ [Registrar Evento ✓]          │  │
│ └───────────────────────────────┘  │
└─────────────────────────────────────┘
```

**Características Modo Escaneo:**
- ✅ Indicador visual de escaneo activo
- ✅ Feedback inmediato al escanear (vibración + sonido)
- ✅ Lista de escaneados con timestamp
- ✅ Opción de eliminar si se escaneó por error (❌)
- ✅ Botón para agregar manualmente (por si falla un chip)
- ✅ Contador en tiempo real
- ✅ Compatible con NFC del celular Y ESP32

**Estados del Escaneo:**
1. **Esperando:** Ícono 📡 pulsando
2. **Escaneando:** Ícono girando + vibración
3. **Éxito:** ✅ Verde + sonido + agregar a lista
4. **Error/Duplicado:** ⚠️ Amarillo + mensaje "Ya escaneado"
5. **No encontrado:** ❌ Rojo + "Animal no registrado"

---

## 📱 PANTALLA 4: Confirmación

```
┌─────────────────────────────────────┐
│ ← Confirmar Registro                │
├─────────────────────────────────────┤
│                                     │
│ Resumen del Evento                  │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ Tipo: 💉 Vacunación         │    │
│ │ Producto: BOBACT 8          │    │
│ │ Fecha: 25/10/2025           │    │
│ │ Dosis: 5.0 ml               │    │
│ └─────────────────────────────┘    │
│                                     │
│ Animales Seleccionados (3):         │
│                                     │
│ • Mariposa (00-19-12345678)         │
│ • Trueno (00-19-87654321)           │
│ • Luna (00-19-11111111)             │
│                                     │
│ ─────────────────────────────────  │
│                                     │
│ ⚠️ Próxima Aplicación:              │
│ 📅 25/10/2026 (refuerzo anual)     │
│                                     │
│ ☐ Crear recordatorio automático    │
│                                     │
│ ─────────────────────────────────  │
│                                     │
│        [← Atrás]  [Guardar ✓]      │
│                                     │
└─────────────────────────────────────┘
```

**Características:**
- Resumen claro antes de guardar
- Opción de crear recordatorio automático
- Botones grandes y claros

---

## 📱 PANTALLA 5: Resultado

```
┌─────────────────────────────────────┐
│                                     │
│        ┌──────────────┐             │
│        │      ✅      │             │
│        └──────────────┘             │
│                                     │
│    ¡Evento Registrado!              │
│                                     │
│  Se vacunaron 3 animales            │
│  con BOBACT 8                       │
│                                     │
│ ─────────────────────────────────  │
│                                     │
│  Recordatorio creado para:          │
│  📅 25/10/2026                     │
│                                     │
│ ─────────────────────────────────  │
│                                     │
│  [Ver Historial]  [Cerrar]         │
│                                     │
│  [Registrar Otro Evento +]         │
│                                     │
└─────────────────────────────────────┘
```

**Características:**
- Diálogo de éxito con auto-cierre (2 seg)
- Opción de ver historial completo
- Opción de registrar otro evento rápidamente

---

## 🔄 Flujo Alternativo: Desde Detalle de Animal

Si se inicia desde el detalle de un animal específico:

```
Detalle Animal → FAB Naranja
    ↓
PANTALLA 1: Tipo de Evento
    ↓
PANTALLA 2: Datos del Evento
    ↓
PANTALLA 3: Selección de Animales
    (Animal actual PRE-SELECCIONADO)
    [Opción: "Solo este animal" o "Agregar más"]
    ↓
PANTALLA 4: Confirmación
    ↓
PANTALLA 5: Resultado
```

---

## 🎨 Mejoras UX Propuestas

### **1. Integración NFC Inteligente**

#### **Detección Automática:**
```dart
// Al abrir la pantalla de selección
if (await NfcManager.isAvailable()) {
  // Mostrar ambos modos
  // Modo manual por defecto
  // Botón "Cambiar a Escaneo" visible
} else {
  // Solo modo manual
  // Ocultar opción de escaneo
}
```

#### **Escaneo en Segundo Plano:**
- El escaneo NFC puede estar activo incluso en modo manual
- Si detecta un chip → marca automáticamente el checkbox
- Feedback visual inmediato

### **2. Búsqueda Inteligente**

```
Búsqueda por:
- Nombre (ej: "Mari" → Mariposa)
- SINIGA (ej: "12345" → 00-19-12345678)
- NFC parcial
- Zona/Potrero
- Características (ej: "Holstein hembra")
```

### **3. Filtros Rápidos**

```
[Chip de filtro] que se puede combinar:
- 🚺 Solo Hembras
- 🚹 Solo Machos
- 📍 Zona A
- 📅 < 1 año
- 📅 1-3 años
- 📅 > 3 años
- 🏆 Alta Producción
```

### **4. Acciones por Lote**

Si seleccionas "Todos":
```
┌─────────────────────────────────┐
│ ¿Aplicar a todos los animales?  │
│                                 │
│ Se registrará el evento para    │
│ 45 animales activos             │
│                                 │
│ [Cancelar] [Confirmar]          │
└─────────────────────────────────┘
```

### **5. Historial Inteligente**

Al registrar un evento, el sistema sugiere:
```
💡 Sugerencia:
Los siguientes animales recibieron
BOBACT 8 hace 11 meses:
- Mariposa
- Luna
(Requieren refuerzo)

[Agregar a Selección]
```

---

## 📊 Pantalla de Historial de Eventos

```
┌─────────────────────────────────────┐
│ ← Historial de Eventos          [+]│
├─────────────────────────────────────┤
│                                     │
│ [📅 Mes ▼] [Tipo ▼] [Animal ▼]    │
│                                     │
│ Octubre 2025                        │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ 💉 Vacunación BOBACT 8      │    │
│ │ 📅 25/10/2025               │    │
│ │ 👥 3 animales               │ > │
│ └─────────────────────────────┘    │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ 🐛 Desparasitación          │    │
│ │ 📅 15/10/2025               │    │
│ │ 👤 Mariposa                 │ > │
│ └─────────────────────────────┘    │
│                                     │
│ Septiembre 2025                     │
│                                     │
│ ┌─────────────────────────────┐    │
│ │ 🔬 Revisión Veterinaria     │    │
│ │ 📅 01/09/2025               │    │
│ │ 👥 45 animales              │ > │
│ └─────────────────────────────┘    │
│                                     │
└─────────────────────────────────────┘
```

Al presionar un evento → Ver detalles con lista de animales

---

## 🛠️ Consideraciones Técnicas

### **Modelo de Datos Actualizado:**

```dart
class EventoSanitario {
  Id id = Isar.autoIncrement;

  // Relación con animal (ACTUAL - individual)
  final animal = IsarLink<Animal>();

  // NUEVO: Para eventos masivos
  String? loteId; // UUID del lote de eventos
  int? totalAnimalesLote;

  @enumerated
  late TipoEvento tipo;

  late DateTime fecha;
  String? nombreProducto;
  double? dosis;
  String? unidadDosis; // ml, mg, tabletas
  String? veterinario;
  String? notas;

  DateTime? fechaProximaAplicacion; // Para refuerzos

  @enumerated
  Prioridad prioridad = Prioridad.media;

  DateTime fechaCreacion = DateTime.now();
}

// NUEVO: Modelo para agrupar eventos masivos
class LoteEvento {
  Id id = Isar.autoIncrement;
  late String loteId; // UUID

  @enumerated
  late TipoEvento tipo;

  late DateTime fecha;
  String? nombreProducto;
  int cantidadAnimales;

  // IDs de los animales en el lote
  List<int> animalesIds = [];

  DateTime fechaCreacion = DateTime.now();
}
```

### **Estrategia de Guardado:**

```dart
Future<void> registrarEventoMasivo({
  required TipoEvento tipo,
  required String producto,
  required DateTime fecha,
  required List<Animal> animales,
  double? dosis,
  String? veterinario,
  String? notas,
}) async {
  final loteId = Uuid().v4();

  await isar.writeTxn(() async {
    // Crear un evento individual por cada animal
    for (final animal in animales) {
      final evento = EventoSanitario()
        ..tipo = tipo
        ..fecha = fecha
        ..nombreProducto = producto
        ..dosis = dosis
        ..veterinario = veterinario
        ..notas = notas
        ..loteId = loteId
        ..totalAnimalesLote = animales.length;

      await isar.eventoSanitarios.put(evento);
      evento.animal.value = animal;
      await evento.animal.save();
    }

    // Guardar registro del lote (para historial)
    final lote = LoteEvento()
      ..loteId = loteId
      ..tipo = tipo
      ..fecha = fecha
      ..nombreProducto = producto
      ..cantidadAnimales = animales.length
      ..animalesIds = animales.map((a) => a.id).toList();

    await isar.loteEventos.put(lote);
  });
}
```

### **Integración NFC:**

```dart
class NfcEventRegistrationService {
  final StreamController<Animal> _scannedAnimals = StreamController();
  Stream<Animal> get scannedAnimalsStream => _scannedAnimals.stream;

  Future<void> startScanning() async {
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        final nfcId = _extractNfcId(tag);
        final animal = await _isarService.obtenerAnimalPorNfc(nfcId);

        if (animal != null) {
          // Vibración + sonido de éxito
          HapticFeedback.mediumImpact();
          _playSuccessSound();

          _scannedAnimals.add(animal);
        } else {
          // Error - animal no encontrado
          HapticFeedback.heavyImpact();
          _playErrorSound();
        }
      },
    );
  }

  void stopScanning() {
    NfcManager.instance.stopSession();
  }
}
```

---

## 📈 Métricas y Reportes

### **Dashboard de Eventos:**
```
Eventos del Mes:
├─ 💉 Vacunaciones: 45 aplicaciones
├─ 🐛 Desparasitaciones: 23 aplicaciones
├─ 💊 Tratamientos: 5 aplicaciones
└─ 🔬 Revisiones: 45 animales

Próximos Eventos:
├─ 📅 En 1 semana: Refuerzo COVEXIN (12 animales)
├─ 📅 En 2 semanas: Desparasitación Zona A (30 animales)
└─ 📅 En 1 mes: Revisión General (45 animales)
```

---

## 🎯 Resumen de Ventajas

### **✅ Modo Manual:**
- Rápido para grupos pequeños
- Control total de selección
- Filtros y búsqueda potentes
- Ideal para: refuerzos anuales de todo el rancho

### **✅ Modo Escaneo:**
- Rápido para grupos grandes
- No hay errores de selección
- Registro en el campo mientras se aplica
- Ideal para: vacunaciones en corrales, eventos en vivo

### **✅ Flexibilidad:**
- Combinar ambos modos
- Iniciar escaneando y agregar manualmente
- Quitar animales escaneados por error

---

## 🚀 Implementación Sugerida - Fases

### **Fase 1: MVP (Mínimo Viable)**
1. ✅ Pantalla de selección de tipo de evento
2. ✅ Formulario de datos del evento
3. ✅ Modo manual con checkboxes
4. ✅ Guardado individual por animal
5. ✅ Confirmación básica

### **Fase 2: Escaneo NFC**
1. ✅ Integración NFC manager
2. ✅ Modo escaneo con lista
3. ✅ Feedback háptico y visual
4. ✅ Manejo de errores (duplicados, no encontrados)

### **Fase 3: Mejoras UX**
1. ✅ Búsqueda y filtros avanzados
2. ✅ Historial de eventos con lotes
3. ✅ Sugerencias inteligentes
4. ✅ Recordatorios automáticos

### **Fase 4: Integracion ESP32**
1. ✅ Comunicación Bluetooth con ESP32
2. ✅ Sincronización de eventos escaneados
3. ✅ Modo offline con sincronización posterior

---

## 💡 Casos de Uso Reales

### **Caso 1: Vacunación Anual - 45 Animales**
```
Método: Modo Manual
1. Seleccionar "Vacunación"
2. Producto: BOBACT 8
3. Fecha: Hoy
4. Click "Seleccionar Todos"
5. Confirmar
⏱️ Tiempo total: ~30 segundos
```

### **Caso 2: Desparasitación Selectiva - 10 Hembras en Zona A**
```
Método: Modo Manual con Filtros
1. Seleccionar "Desparasitación"
2. Producto: IVERMECTINA 3.15%
3. Filtrar: Hembras + Zona A
4. Seleccionar visualmente las necesarias
5. Confirmar
⏱️ Tiempo total: ~1 minuto
```

### **Caso 3: Tratamiento Individual en Campo**
```
Método: Modo Escaneo
1. Seleccionar "Tratamiento"
2. Producto: Antibiótico
3. Cambiar a modo escaneo
4. Acercar chip NFC del animal enfermo
5. Confirmar
⏱️ Tiempo total: ~15 segundos
```

### **Caso 4: Vacunación Masiva en Corral con ESP32**
```
Método: Escaneo con ESP32
1. Seleccionar "Vacunación"
2. Producto: COVEXIN 10
3. Activar escaneo
4. Veterinario aplica y pasa ESP32
5. App registra automáticamente cada escaneo
6. Al terminar, confirmar lista completa
⏱️ Tiempo por animal: ~5 segundos
```

---

## 🎨 Paleta de Colores Sugerida

```dart
// Tipos de eventos
TipoEvento.vacuna → Colors.green
TipoEvento.desparasitante → Colors.orange
TipoEvento.tratamiento → Colors.blue
TipoEvento.revisionVeterinaria → Colors.teal
TipoEvento.castracion → Colors.purple

// Estados
Escaneando → Colors.blue (pulsando)
Éxito → Colors.green
Error → Colors.red
Advertencia → Colors.amber
```

---

## 📝 Notas de Implementación

1. **Persistencia:** Guardar el último tipo de evento y producto usado para pre-llenar
2. **Validaciones:** No permitir fechas futuras (excepto para recordatorios)
3. **Confirmación:** Siempre mostrar resumen antes de guardar
4. **Feedback:** Vibración + sonido en cada escaneo exitoso
5. **Offline:** Permitir registro sin conexión, sincronizar después
6. **Permisos:** Solicitar permisos NFC solo cuando se active ese modo

---

¿Te gusta este diseño? ¿Quieres que comience a implementarlo o ajustamos algo del flujo?
