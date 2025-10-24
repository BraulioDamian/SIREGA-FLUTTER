# 📐 Estructura Visual del Proyecto SIREGA

**Última actualización:** Octubre 2025

---

## 🏗️ Visión General de la Arquitectura

```
┌─────────────────────────────────────────────────────────────────┐
│                        SIREGA FLUTTER APP                       │
│                  Sistema de Registro Ganadero                   │
└─────────────────────────────────────────────────────────────────┘
                               │
                   ┌───────────┴───────────┐
                   │                       │
         ┌─────────▼─────────┐   ┌────────▼────────┐
         │   PRESENTATION    │   │    BUSINESS     │
         │   LAYER (UI)      │   │    LOGIC        │
         └─────────┬─────────┘   └────────┬────────┘
                   │                       │
         ┌─────────▼─────────────────┬────▼────────┐
         │                           │             │
    ┌────▼────┐              ┌──────▼──────┐  ┌──▼──────┐
    │ modulos/│              │presentation/│  │ BLoC    │
    │ (5)     │              │ (shared)    │  │ Pattern │
    └─────────┘              └─────────────┘  └─────────┘
         │
    ┌────▼──────────────────────────────────────┐
    │                                            │
┌───▼───┐ ┌─────────┐ ┌───────────┐ ┌─────────┐
│nucleo/│ │services │ │repositories│ │ models  │
│(core) │ │  (8)    │ │    (5)     │ │  (8)    │
└───┬───┘ └─────────┘ └───────────┘ └─────────┘
    │
    └──► Isar Database (Local Storage)
```

---

## 📂 Estructura de Carpetas Detallada

```
lib/
│
├── 📱 main.dart                          ← Punto de entrada
│
├── 📦 modulos/                           ← FEATURE-BASED (Clean Architecture)
│   ├── 0_autenticacion/
│   │   └── presentation/                 ✅ Estandarizado
│   │       ├── bloc/
│   │       ├── pantallas/
│   │       └── widgets/
│   │
│   ├── 1_lista_ganado/
│   │   └── presentation/                 ✅ Estandarizado
│   │       ├── bloc/
│   │       │   ├── cattle_list_bloc.dart
│   │       │   ├── cattle_list_event.dart
│   │       │   └── cattle_list_state.dart
│   │       ├── pantallas/
│   │       │   └── cattle_list_screen.dart
│   │       └── widgets/
│   │           ├── animal_card.dart
│   │           └── filter_chips.dart
│   │
│   ├── 2_detalle_animal/
│   │   └── presentation/                 ✅ Estandarizado
│   │       ├── bloc/
│   │       │   ├── cattle_detail_bloc.dart
│   │       │   ├── cattle_detail_event.dart
│   │       │   └── cattle_detail_state.dart
│   │       ├── pantallas/
│   │       │   ├── cattle_detail_screen.dart
│   │       │   └── editar_animal/
│   │       │       └── editar_animal_screen.dart  ✅ ÚNICO (limpiado)
│   │       └── widgets/
│   │           ├── detail_tab_content.dart
│   │           ├── custom_sliver_header.dart
│   │           └── delete_animal_dialog.dart
│   │
│   ├── 3_registro_evento/
│   │   └── presentation/                 ✅ Estandarizado
│   │       ├── pantallas/
│   │       └── widgets/
│   │
│   └── 4_escaneo_nfc/                    ✅ Clean Architecture COMPLETA
│       ├── presentation/
│       │   ├── screens/
│       │   │   └── escaneo_nfc_screen.dart
│       │   └── widgets/
│       ├── domain/                       ← Use Cases
│       │   └── use_cases/
│       │       ├── scan_nfc_use_case.dart
│       │       ├── connect_to_esp32_use_case.dart
│       │       └── find_animal_by_uid_use_case.dart
│       ├── data/                         ← Repositories
│       │   ├── repositories/
│       │   └── services/
│       └── bloc/
│           ├── nfc_scanner_bloc.dart
│           ├── esp32_scanner_bloc.dart
│           └── ...
│
├── 🎨 presentation/                      ← COMPONENTES COMPARTIDOS
│   ├── forms/                            ← Formularios reutilizables
│   │   └── animal_form/                  ✅ PATRÓN DE REUTILIZACIÓN
│   │       ├── animal_form.dart          ← Formulario maestro
│   │       ├── controllers/
│   │       │   └── animal_form_controller.dart
│   │       └── widgets/                  ← Secciones modulares
│   │           ├── image_picker_section.dart
│   │           ├── siniga_form_section.dart
│   │           ├── basic_info_form_section.dart
│   │           ├── additional_fields_form_section.dart
│   │           ├── nfc_section.dart
│   │           ├── health_form_section.dart
│   │           ├── reproduction_form_section.dart
│   │           ├── location_form_section.dart
│   │           └── validation_summary.dart
│   │
│   ├── screens/                          ← Pantallas compartidas
│   │   ├── home_screen_mejorado.dart
│   │   └── agregar_animal/
│   │       └── agregar_animal_screen.dart
│   │
│   └── widgets/                          ← Widgets globales reutilizables
│       └── (vacío - para expansión futura)
│
├── 🧠 nucleo/                            ← CORE / SHARED
│   ├── modelos/                          ← Modelos de datos (Isar)
│   │   ├── animal_model.dart             🔵 @collection
│   │   ├── siniga_model.dart             🟢 @embedded
│   │   ├── evento_sanitario_model.dart   🔵 @collection
│   │   ├── herd_model.dart               🔵 @collection
│   │   ├── produccion_model.dart         🔵 @collection
│   │   ├── alerta.dart                   🔵 @collection
│   │   ├── configuracion_local.dart      🔵 @collection
│   │   ├── sync_queue.dart               🔵 @collection
│   │   └── enums.dart                    ← Enumeraciones
│   │
│   └── servicios/                        ← Servicios compartidos
│       ├── isar_service.dart             ← Base de datos local
│       ├── firebase_service.dart         ← Sincronización remota
│       ├── nfc_service.dart              ← Lectura NFC
│       ├── alerta_service.dart           ← Sistema de alertas
│       └── ...
│
└── 🎨 ui/                                ← Componentes UI básicos
    └── (componentes de diseño base)
```

**Leyenda:**
- 🔵 = Isar Collection (tabla independiente)
- 🟢 = Isar Embedded (objeto anidado)
- ✅ = Estandarizado y limpio

---

## 🔄 Flujo de Datos (Clean Architecture)

### Ejemplo: Editar Animal

```
┌─────────────────────────────────────────────────────────────────┐
│                   EDITAR ANIMAL - FLUJO COMPLETO                │
└─────────────────────────────────────────────────────────────────┘

1️⃣  USER INTERACTION
    │
    ├─► EditarAnimalScreen
    │   (modulos/2_detalle_animal/presentation/pantallas/)
    │
    └─► REUTILIZA: AnimalForm
        (presentation/forms/animal_form/)
        - showExtendedFields: true
        - Todos los campos de edición

                    │
                    ▼
2️⃣  STATE MANAGEMENT (BLoC Pattern)
    │
    ├─► AnimalFormController
    │   - Valida campos
    │   - Construye objeto Animal
    │
    └─► CattleDetailBloc
        - Event: UpdateAnimal
        - State: AnimalUpdated / Error

                    │
                    ▼
3️⃣  BUSINESS LOGIC
    │
    └─► IsarService (nucleo/servicios/)
        - Lógica de negocio
        - Validaciones

                    │
                    ▼
4️⃣  DATA LAYER
    │
    └─► Isar Database
        - Persistencia local
        - Transacciones ACID

                    │
                    ▼
5️⃣  SYNC (Opcional)
    │
    └─► FirebaseService
        - Sincronización remota
        - Backup en la nube
```

---

## 🎯 Patrón de Reutilización: AnimalForm

### Diagrama de Uso

```
                    ┌──────────────────────┐
                    │   AnimalForm         │
                    │   (Componente Base)  │
                    └──────────┬───────────┘
                               │
                ┌──────────────┴──────────────┐
                │                             │
      ┌─────────▼─────────┐         ┌────────▼────────┐
      │ MODO REGISTRO     │         │  MODO EDICIÓN   │
      │                   │         │                 │
      │ showExtendedFields│         │ showExtendedFields│
      │ = false           │         │ = true          │
      └─────────┬─────────┘         └────────┬────────┘
                │                            │
                │                            │
    ┌───────────▼───────────┐    ┌───────────▼──────────┐
    │ AgregarAnimalScreen  │    │ EditarAnimalScreen   │
    │ (presentation/       │    │ (modulos/2_detalle_  │
    │  screens/)           │    │  animal/presentation)│
    └──────────────────────┘    └──────────────────────┘

SECCIONES MOSTRADAS:

┌─────────────────────┬─────────────┬──────────────┐
│ Sección             │  Registro   │   Edición    │
├─────────────────────┼─────────────┼──────────────┤
│ ImagePickerSection  │     ✅      │      ✅      │
│ SinigaFormSection   │     ✅      │      ✅      │
│ BasicInfoSection    │     ✅      │      ✅      │
│ NfcSection          │     ✅      │      ✅      │
├─────────────────────┼─────────────┼──────────────┤
│ AdditionalFields    │     ❌      │      ✅      │
│ HealthSection       │     ❌      │      ✅      │
│ ReproductionSection │     ❌      │      ✅      │
│ LocationSection     │     ❌      │      ✅      │
├─────────────────────┼─────────────┼──────────────┤
│ ValidationSummary   │     ✅      │      ❌      │
└─────────────────────┴─────────────┴──────────────┘
```

**Ventajas:**
- ✅ Un solo componente, dos modos
- ✅ Mantenimiento centralizado
- ✅ Consistencia de UX
- ✅ Menos código duplicado

---

## 🔧 Patrones Arquitectónicos Aplicados

### 1. Clean Architecture (Módulo 4 - Completo)

```
┌─────────────────────────────────────────────────────┐
│              4_escaneo_nfc/ (Ejemplo)               │
└─────────────────────────────────────────────────────┘

    ┌───────────────────────────────────────┐
    │   PRESENTATION LAYER                  │
    │   - Screens (UI)                      │
    │   - Widgets                           │
    │   - BLoC (State Management)           │
    └──────────────┬────────────────────────┘
                   │
                   ▼
    ┌───────────────────────────────────────┐
    │   DOMAIN LAYER                        │
    │   - Use Cases (Business Logic)        │
    │   - Abstract Repositories             │
    │   - Entities                          │
    └──────────────┬────────────────────────┘
                   │
                   ▼
    ┌───────────────────────────────────────┐
    │   DATA LAYER                          │
    │   - Repository Implementations        │
    │   - Services (NFC, ESP32)             │
    │   - Data Sources                      │
    └───────────────────────────────────────┘
```

### 2. BLoC Pattern (Todos los módulos)

```
┌────────────────────────────────────────────────────────────┐
│                     BLOC PATTERN                           │
└────────────────────────────────────────────────────────────┘

    UI (Widget)
        │
        ├─► add(Event)  ──────┐
        │                     │
        ▼                     ▼
    BlocBuilder         ┌──────────┐
    BlocListener        │   BLoC   │
        ▲               │          │
        │               │  on<E>() │
        └─── emit(State)│          │
                        └────┬─────┘
                             │
                        ┌────▼─────┐
                        │ Service  │
                        │ (Isar,   │
                        │Firebase) │
                        └──────────┘

ESTADOS:
├── UI States              (BlocBuilder)
│   ├── Initial
│   ├── Loading
│   ├── Loaded(data)
│   └── Error(message)
│
└── Action States          (BlocListener)
    ├── ShowSnackbar(msg)
    ├── NavigateTo(route)
    └── UpdateSuccess
```

### 3. Repository Pattern

```
┌──────────────┐         ┌──────────────┐
│    BLoC      │────────►│  Repository  │
│              │         │  (Abstract)  │
└──────────────┘         └──────┬───────┘
                                │
                    ┌───────────┴────────────┐
                    │                        │
            ┌───────▼────────┐      ┌────────▼────────┐
            │ IsarRepository │      │ FirebaseRepo    │
            │ (Local)        │      │ (Remote)        │
            └────────────────┘      └─────────────────┘
```

---

## 📊 Módulos: Responsabilidades

```
┌──────────────────┬─────────────────────────────────────────────┐
│     Módulo       │            Responsabilidad                  │
├──────────────────┼─────────────────────────────────────────────┤
│ 0_autenticacion  │ Login, registro, gestión de usuarios       │
├──────────────────┼─────────────────────────────────────────────┤
│ 1_lista_ganado   │ Lista de animales, filtros, búsqueda       │
├──────────────────┼─────────────────────────────────────────────┤
│ 2_detalle_animal │ Detalles del animal, edición, eventos      │
├──────────────────┼─────────────────────────────────────────────┤
│ 3_registro_evento│ Registro de eventos sanitarios             │
├──────────────────┼─────────────────────────────────────────────┤
│ 4_escaneo_nfc    │ Escaneo NFC (móvil + ESP32)                │
└──────────────────┴─────────────────────────────────────────────┘
```

---

## 🗄️ Modelos de Datos (Isar Collections)

```
┌──────────────────────────────────────────────────────────────┐
│                    ISAR DATABASE SCHEMA                      │
└──────────────────────────────────────────────────────────────┘

    ┌─────────────────┐
    │     Animal      │ @collection
    ├─────────────────┤
    │ Id id           │
    │ String nombre   │
    │ SinigaId siniga │──► @embedded
    │ String raza     │
    │ Sexo sexo       │
    │ ...             │
    └────────┬────────┘
             │
             │ 1:N
             ▼
    ┌─────────────────┐
    │ EventoSanitario │ @collection
    ├─────────────────┤
    │ Id id           │
    │ int animalId    │──► FK to Animal
    │ TipoEvento tipo │
    │ DateTime fecha  │
    └─────────────────┘

    Otras Collections:
    ├── HerdModel
    ├── ProduccionModel
    ├── Alerta
    ├── ConfiguracionLocal
    └── SyncQueue

    Total: 8 Collections + 1 Embedded
```

---

## 🎨 Componentes UI Reutilizables

### Actual

```
presentation/
├── forms/
│   └── animal_form/              ✅ EXCELENTE
│       ├── animal_form.dart
│       ├── controllers/
│       └── widgets/ (9 secciones)
│
├── screens/
│   ├── home_screen_mejorado.dart
│   └── agregar_animal/
│
└── widgets/
    └── (vacío - para expansión)
```

### Recomendación Futura

```
presentation/
└── widgets/                      📌 PARA CREAR
    ├── buttons/
    │   ├── primary_button.dart
    │   └── icon_button_custom.dart
    ├── cards/
    │   ├── animal_card.dart      ← Mover aquí
    │   └── event_card.dart
    └── inputs/
        ├── custom_text_field.dart
        └── custom_dropdown.dart
```

---

## ✅ Estado Actual del Proyecto

### ✅ Completado (Limpieza Oct 2025)

- [x] Eliminados archivos duplicados
- [x] Estandarizada nomenclatura (presentacion → presentation)
- [x] Actualizados todos los imports
- [x] Un solo EditarAnimalScreen activo
- [x] AnimalForm completamente modular

### 📊 Métricas

```
Archivos Dart:              ~117 archivos
Módulos:                    5 módulos
Isar Collections:           8 colecciones
BLoC implementados:         7+ blocs
Pantallas principales:      10+ screens
Componentes reutilizables:  AnimalForm (9 secciones)
```

### 🎯 Calificación de Arquitectura

```
┌───────────────────────┬───────┬────────────────────┐
│ Aspecto               │ Nota  │ Comentario         │
├───────────────────────┼───────┼────────────────────┤
│ Organización          │  A+   │ Excelente          │
│ Separación de capas   │  A    │ Muy buena          │
│ Reutilización código  │  A+   │ AnimalForm modelo  │
│ Consistencia          │  A    │ Post-limpieza      │
│ Documentación         │  A+   │ 7 docs completos   │
│ Clean Architecture    │  B+   │ Módulo 4 completo  │
└───────────────────────┴───────┴────────────────────┘

CALIFICACIÓN GENERAL: A (Excelente)
```

---

## 🚀 Próximos Pasos Recomendados

### Corto Plazo
1. Aplicar Clean Architecture a módulos 0-3
2. Crear más widgets reutilizables en `presentation/widgets/`
3. Migrar widgets específicos de módulos a compartidos

### Mediano Plazo
4. Implementar testing unitario para BLoCs
5. Agregar logging centralizado
6. Documentar todos los servicios

### Largo Plazo
7. Implementar CI/CD
8. Agregar monitoreo de errores
9. Optimizar performance con lazy loading

---

## 📚 Referencias

- **Arquitectura Base:** Clean Architecture + BLoC Pattern
- **Base de Datos:** Isar (NoSQL local)
- **Estado:** flutter_bloc: ^9.1.1
- **Docs del Proyecto:** /docs/*.md

---

**Documento creado:** Octubre 2025
**Autor:** Equipo SIREGA
**Propósito:** Guía visual de referencia rápida de arquitectura
