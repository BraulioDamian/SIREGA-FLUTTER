# SIREGA - Plan de Refactorizacion: Tipado y Nombres

> Decision: Todo el codigo nuevo sera en **ingles sin tildes**.  
> Se ira migrando poco a poco sin romper lo que ya funciona.

---

## Estado Actual: Resumen de Problemas

### Problema 1: Map<String, dynamic> en vez de modelos tipados

**Donde:** `AnimalFormController` almacena pesajes, leche, partos y eventos medicos como `List<Map<String, dynamic>>` con claves string inventadas.

**Flujo actual (malo):**
```
DB (Isar) -> Modelo tipado (RegistroProduccion)
    | SE DESTRUYE EL TIPO
Controller -> Map<String, dynamic> {'peso': ..., 'fecha': ...}
    | SE RECONSTRUYE
SaveHelper -> RegistroProduccion de nuevo -> DB
```

**Archivos afectados:**
- `lib/presentation/forms/animal_form/controllers/animal_form_controller.dart`
  - `_registrosPesajes: List<Map<String, dynamic>>` (lineas ~154)
  - `_registrosProduccionLeche: List<Map<String, dynamic>>` (lineas ~158)
  - `_registrosPartos: List<Map<String, dynamic>>` (lineas ~150)
  - `_eventosMedicos: List<Map<String, dynamic>>` (lineas ~147)
- `lib/presentation/forms/animal_form/helpers/animal_save_helper.dart`
  - Toda la clase re-arma modelos desde Maps con casts manuales

**Nombres que no coinciden entre capas:**

| Concepto | Modelo (Isar) | Map key (Controller) | Notas |
|----------|---------------|----------------------|-------|
| Peso | `pesoKg` | `'peso'` | Diferente nombre |
| Litros | `litrosPorDia` | `'litros'` | Diferente nombre |
| Producto | `nombreProducto` | `'producto'` | Diferente nombre |
| ID Isar | `id` | `'isarId'` | Inventado |
| Tipo evento | `TipoEvento` (enum) | `'tipo'` (string distinto) | Conversion doble |

---

### Problema 2: RegistroProduccion.tipo es String libre

**Donde:** `lib/nucleo/modelos/produccion_model.dart`

```dart
late String tipo;  // "Pesaje" | "Produccion de Leche" | "Parto"
```

**Se filtra con strings literales en:**
- `lib/presentation/forms/animal_form/helpers/animal_save_helper.dart` - lineas de actualizarCamposCalculados
- `lib/modulos/2_detalle_animal/presentation/widgets/tabs/production_tab.dart` - filtros por tipo
- `lib/presentation/forms/animal_form/controllers/animal_form_controller.dart` - switch en _loadLinkedData

**Riesgo:** Un typo como `'Produccion de Leche'` (sin tilde) no encuentra nada, sin error de compilacion.

---

### Problema 3: Doble conversion de enums (TipoEvento)

**Flujo actual:**
```
DB:          TipoEvento.desparasitante (enum)
Controller:  'desparasitacion' (string DIFERENTE)
SaveHelper:  switch -> TipoEvento.desparasitante (de vuelta)
```

**Mapeo actual (inconsistente):**

| Enum (modelo) | String (form) | Coinciden? |
|----------------|--------------|------------|
| `TipoEvento.desparasitante` | `'desparasitacion'` | NO |
| `TipoEvento.tratamiento` | `'tratamiento'` | SI |
| `TipoEvento.revisionVeterinaria` | `'diagnostico'` | NO |
| `TipoEvento.castracion` | `'cirugia'` | NO |

**Archivos con la conversion duplicada:**
- `AnimalFormController._tipoEventoToFormString()` - enum a string
- `AnimalSaveHelper.guardarEventosMedicos()` - string a enum (switch inverso)

---

### Problema 4: sexoCria codificado en notas (hack)

**Donde:** Partos en `animal_save_helper.dart` y `animal_form_controller.dart`

```dart
// GUARDAR: mete sexo dentro de notas
notas = 'Sexo: Macho. Las notas originales'

// CARGAR: lo parsea de vuelta
_parseSexoFromNotas(registro.notas)  // busca "Sexo: Macho" en el string
```

**Riesgo:** Se rompe si el usuario escribe "Sexo:" en las notas, o si cambia el formato.

**Solucion:** Agregar campo `sexoCria` real al modelo `RegistroProduccion` (o crear modelo separado de Parto).

---

### Problema 5: Mezcla de idiomas sin patron

| Capa | Idioma actual | Ejemplo |
|------|---------------|---------|
| Modelos Isar | Espanol | `EventoSanitario`, `RegistroProduccion`, `pesoKg` |
| Servicios | Espanol | `guardarEvento()`, `obtenerAnimalPorId()` |
| Controller | Ingles | `AnimalFormController`, `isEditMode` |
| Bloc | Ingles | `CattleDetailBloc`, `CattleDetailState` |
| Archivos | Ingles | `animal_save_helper.dart`, `production_form_section.dart` |
| Map keys | Mezclado | `'isarId'`, `'fecha'`, `'peso'`, `'notas'` |
| Carpetas | Mezclado | `modulos/`, `pantallas/`, `presentation/`, `nucleo/` |
| Enums | Espanol | `EstadoAnimal`, `EstadoSalud`, `TipoEvento` |

**Decision:** Todo nuevo en ingles. Lo viejo se migra cuando se toque.

---

### Problema 6: Controller hace demasiado (~900 lineas)

`AnimalFormController` es:
- State manager (ChangeNotifier)
- Data loader (lee de Isar via links)
- Data transformer (modelo a Map, enum a string)
- Form validator
- Snapshot tracker (IDs originales para edicion)
- Contiene modelos locales (RazaBovina, EstadoMexico)

---

## Plan de Refactorizacion por Fases

### FASE 1: DTOs tipados (reemplazar Map<String, dynamic>)

**Crear en** `lib/nucleo/modelos/form_dtos.dart`:

```dart
class WeightRecord {
  final int? isarId;
  final DateTime date;
  final double weightKg;
  final String? notes;

  const WeightRecord({this.isarId, required this.date, required this.weightKg, this.notes});
}

class MilkRecord {
  final int? isarId;
  final DateTime date;
  final double litersPerDay;
  final String? notes;

  const MilkRecord({this.isarId, required this.date, required this.litersPerDay, this.notes});
}

class BirthRecord {
  final int? isarId;
  final DateTime date;
  final String? offspringId;
  final Sexo? offspringSex;
  final double? weightKg;
  final String? notes;

  const BirthRecord({this.isarId, required this.date, this.offspringId, this.offspringSex, this.weightKg, this.notes});
}

class MedicalEventRecord {
  final int? isarId;
  final TipoEvento type;
  final DateTime date;
  final String productName;
  final String? notes;

  const MedicalEventRecord({this.isarId, required this.type, required this.date, required this.productName, this.notes});
}
```

**Cambios requeridos:**
1. Controller: `List<Map<String, dynamic>>` -> `List<WeightRecord>` etc.
2. SaveHelper: ya no necesita cast manuales, lee campos tipados
3. Forms (UI): reciben DTOs en vez de Maps
4. Eliminar metodos `eliminarRegistroPesaje(int index)` que usan indice -> usar por ID

**Archivos a modificar:**
- `animal_form_controller.dart` - Cambiar listas y metodos add/remove
- `animal_save_helper.dart` - Leer de DTOs tipados
- `production_form_section.dart` - Construir DTOs al agregar
- `offspring_form_section.dart` - Construir BirthRecord al agregar

---

### FASE 2: Enum para tipo de produccion

**Crear en** `lib/nucleo/modelos/enums.dart`:

```dart
enum ProductionType {
  weight,    // antes 'Pesaje'
  milk,      // antes 'Produccion de Leche'
  birth,     // antes 'Parto'
}
```

**Cambios requeridos:**
1. `produccion_model.dart`: `late String tipo` -> `@Enumerated(EnumType.name) late ProductionType tipo`
2. Regenerar Isar schemas (`build_runner`)
3. Agregar migracion (version 2) para convertir strings existentes a enum values
4. Actualizar todos los filtros de `r.tipo == 'Pesaje'` a `r.tipo == ProductionType.weight`

**Archivos a modificar:**
- `produccion_model.dart` + regenerar `.g.dart`
- `isar_service.dart` - filtros
- `animal_save_helper.dart` - asignacion de tipo
- `animal_form_controller.dart` - switch en _loadLinkedData
- `production_tab.dart` - filtros de display
- Migracion nueva en `isar_service.dart`

---

### FASE 3: Eliminar doble conversion de enums medicos

**Cambios requeridos:**
1. `MedicalEventRecord` ya almacena `TipoEvento type` directamente (no string)
2. Eliminar `_tipoEventoToFormString()` del controller
3. Eliminar switch de string->enum del SaveHelper
4. UI dropdowns trabajan con `TipoEvento` directamente

**Archivos a modificar:**
- `animal_form_controller.dart` - eliminar conversion
- `animal_save_helper.dart` - leer tipo directamente del DTO
- `health_form_section.dart` (o equivalente) - dropdown usa TipoEvento

---

### FASE 4: Campo sexoCria real (sacar de notas)

**Cambios requeridos:**
1. Agregar `String? sexoCria` a `RegistroProduccion` modelo (o `@Enumerated Sexo?`)
2. Regenerar Isar schemas
3. Migracion (version 3): parsear notas existentes -> extraer sexo -> guardar en campo
4. Eliminar `_parseSexoFromNotas()` y `_limpiarNotasSexo()` del controller
5. SaveHelper guarda `BirthRecord.offspringSex` directo en campo

**Archivos a modificar:**
- `produccion_model.dart` + regenerar
- `animal_form_controller.dart` - simplificar carga de partos
- `animal_save_helper.dart` - simplificar guardado de partos
- `offspring_form_section.dart` - sin cambios (ya maneja Sexo)
- Migracion nueva

---

### FASE 5: Estandarizar nombres a ingles

**Renombrar gradualmente (cuando se toque cada archivo):**

| Actual (espanol) | Nuevo (ingles) |
|-------------------|----------------|
| `EventoSanitario` | `HealthEvent` |
| `RegistroProduccion` | `ProductionRecord` |
| `guardarEvento()` | `saveEvent()` |
| `obtenerAnimalPorId()` | `getAnimalById()` |
| `eliminarEventoSanitario()` | `deleteHealthEvent()` |
| `obtenerProduccionPorAnimal()` | `getProductionByAnimal()` |
| `guardarRegistroProduccion()` | `saveProductionRecord()` |
| `pesoKg` | `weightKg` |
| `litrosPorDia` | `litersPerDay` |
| `nombreProducto` | `productName` |
| `fechaProximaAplicacion` | `nextApplicationDate` |
| `esAplicacionUnica` | `isSingleApplication` |
| `nucleo/` | `core/` |
| `modelos/` | `models/` |
| `servicios/` | `services/` |
| `pantallas/` | `screens/` |
| `modulos/` | `modules/` |

> NOTA: Los modelos Isar requieren `build_runner` al renombrar. Renombrar cuando se regeneren schemas.

---

### FASE 6: Partir el controller

**Extraer de `AnimalFormController` (900 lineas):**

| Responsabilidad | Clase nueva |
|-----------------|-------------|
| Carga de datos linked | `AnimalDataLoader` |
| Tracking de originales para edicion | `EditModeTracker` |
| Validacion de formulario | `AnimalFormValidator` |
| Modelos locales (RazaBovina, EstadoMexico) | `lib/core/models/` |

---

## Orden de Ejecucion Sugerido

```
FASE 1 (DTOs) ──────► FASE 3 (quitar doble conversion)
     |                       |
     v                       v
FASE 2 (enum tipo) ──► FASE 4 (sexoCria campo real)
                              |
                              v
                       FASE 5 (nombres ingles)
                              |
                              v
                       FASE 6 (partir controller)
```

- **Fase 1** es la mas importante: elimina todos los `Map<String, dynamic>` y sus riesgos
- **Fase 2** requiere regenerar Isar + migracion
- **Fases 3-4** se pueden hacer junto con Fase 1 si se hace al mismo tiempo
- **Fase 5** es gradual, se hace cuando se toca cada archivo
- **Fase 6** es opcional, se hace si el controller sigue creciendo

---

## Checklist de Validacion por Fase

Para cada fase, verificar:
- [ ] `dart analyze lib/` sin errores
- [ ] Migracion creada si se modifico modelo Isar
- [ ] `build_runner` ejecutado si se modifico modelo Isar
- [ ] Ningun `Map<String, dynamic>` nuevo para datos de produccion/eventos
- [ ] Ningun string literal para tipos que deberian ser enums
- [ ] Tests (si existen) pasan
