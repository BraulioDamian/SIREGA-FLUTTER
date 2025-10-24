# 📱 Mapeo: Navegación de la App → Estructura de Código

**Lo que VES vs Dónde ESTÁ en el código**

---

## 🎯 TU OBSERVACIÓN ES CORRECTA

> "Tenemos una pantalla principal, después de ahí podemos irnos a escanear arete NFC, registrar evento, ver inventario, el botón +... **cada una al entrar se convierte en una pantalla principal**"

**✅ CORRECTO!** Así funciona la navegación en Flutter. Cada pantalla que abres se vuelve la "principal" mientras estás en ella.

---

## 📱 FLUJO DE NAVEGACIÓN (Lo que VES)

```
┌─────────────────────────────────────────────────────────────────┐
│                     🏠 PANTALLA PRINCIPAL                       │
│                   (Home Screen Mejorado)                        │
│                                                                 │
│  ┌─────────────────────────────────────────────────────────┐  │
│  │ Buenos Días                                             │  │
│  │ Bienvenido a SIREGA                                     │  │
│  └─────────────────────────────────────────────────────────┘  │
│                                                                 │
│  📊 Estadísticas Rápidas:                                      │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐                  │
│  │ Total: 50 │  │ Activos:45│  │ Alertas:3 │                  │
│  └───────────┘  └───────────┘  └───────────┘                  │
│                                                                 │
│  🎯 Acciones Principales:                                      │
│  ┌───────────────────────────────────────────────────┐         │
│  │ 📡 Escanear Arete (NFC)                     ──────┼─────┐  │
│  │    Identifica un animal rápidamente               │     │  │
│  └───────────────────────────────────────────────────┘     │  │
│                                                             │  │
│  ┌───────────────────────────────────────────────────┐     │  │
│  │ 📝 Registrar Evento                        ──────┼──┐  │  │
│  │    Vacunas, pesajes, tratamientos, etc.          │  │  │  │
│  └───────────────────────────────────────────────────┘  │  │  │
│                                                          │  │  │
│  ┌───────────────────────────────────────────────────┐  │  │  │
│  │ 📦 Ver Inventario                          ──────┼──┼──┼──┐
│  │    Consulta todo tu ganado                       │  │  │  │
│  └───────────────────────────────────────────────────┘  │  │  │
│                                                          │  │  │
│  🔧 Herramientas Secundarias:                           │  │  │
│  • Reportes                                             │  │  │
│  • Botiquín                                             │  │  │
│                                                          │  │  │
│  ┌─────────────────────────────────────────┐            │  │  │
│  │           [  +  ]  ← Botón flotante     │────────────┼──┼──┤
│  └─────────────────────────────────────────┘            │  │  │
│                                                          │  │  │
└──────────────────────────────────────────────────────────┼──┼──┘
                                                           │  │
                  ┌────────────────────────────────────────┘  │
                  │                  ┌────────────────────────┘
                  │                  │          ┌───────────────
                  │                  │          │
                  ▼                  ▼          ▼
     ┌────────────────────┐  ┌─────────────┐  ┌───────────────┐
     │   🔍 PANTALLA      │  │ 📝 PANTALLA │  │  📦 PANTALLA  │
     │   ESCANEAR NFC     │  │  REGISTRAR  │  │  INVENTARIO   │
     │                    │  │   EVENTO    │  │  (Lista)      │
     │  (Nueva principal) │  │ (Nueva      │  │ (Nueva        │
     │                    │  │  principal) │  │  principal)   │
     └────────────────────┘  └─────────────┘  └───────┬───────┘
                                                       │
                                                       │ Click en
                                                       │ un animal
                                                       ▼
                                              ┌────────────────┐
                                              │  🐄 PANTALLA   │
                                              │  DETALLE       │
                                              │  ANIMAL        │
                                              │  (Nueva        │
                                              │   principal)   │
                                              └────────┬───────┘
                                                       │
                                                       │ Botón
                                                       │ "Editar"
                                                       ▼
                                              ┌────────────────┐
                                              │  ✏️ PANTALLA   │
                                              │  EDITAR        │
                                              │  ANIMAL        │
                                              │  (Nueva        │
                                              │   principal)   │
                                              └────────────────┘

          ┌──────────────────────────────────────────┐
          │  Click en botón + (Agregar Animal)       │
          └──────────────────┬───────────────────────┘
                             ▼
                  ┌──────────────────────┐
                  │  ➕ PANTALLA         │
                  │  AGREGAR ANIMAL      │
                  │  (Nueva principal)   │
                  └──────────────────────┘
```

---

## 🗺️ MAPEO: PANTALLA → CARPETA

### Cada pantalla que abres VIVE en un lugar específico:

```
┌──────────────────────────────┬─────────────────────────────────────┐
│ LO QUE VES (Pantalla)        │ DÓNDE ESTÁ (Estructura de código)  │
├──────────────────────────────┼─────────────────────────────────────┤
│ 🏠 Pantalla Principal        │ presentation/screens/               │
│    (Home)                    │   └── home_screen_mejorado.dart    │
│                              │                                     │
│    ¿Por qué ahí?             │ Es compartida/global, no es parte  │
│                              │ de un módulo específico             │
├──────────────────────────────┼─────────────────────────────────────┤
│ 📡 Escanear Arete NFC        │ modulos/4_escaneo_nfc/              │
│                              │   └── presentation/screens/         │
│                              │       └── escaneo_nfc_screen.dart   │
│                              │                                     │
│    ¿Por qué ahí?             │ Es una FUNCIONALIDAD COMPLETA del  │
│                              │ negocio (escaneo NFC)               │
├──────────────────────────────┼─────────────────────────────────────┤
│ 📝 Registrar Evento          │ modulos/3_registro_evento/          │
│                              │   └── presentation/pantallas/       │
│                              │       └── add_event_screen.dart     │
│                              │                                     │
│    ¿Por qué ahí?             │ Es una FUNCIONALIDAD COMPLETA       │
│                              │ (registrar eventos sanitarios)      │
├──────────────────────────────┼─────────────────────────────────────┤
│ 📦 Ver Inventario (Lista)    │ modulos/1_lista_ganado/             │
│                              │   └── presentation/pantallas/       │
│                              │       └── cattle_list_screen.dart   │
│                              │                                     │
│    ¿Por qué ahí?             │ Es una FUNCIONALIDAD COMPLETA       │
│                              │ (mostrar lista de animales)         │
├──────────────────────────────┼─────────────────────────────────────┤
│ 🐄 Detalle de Animal         │ modulos/2_detalle_animal/           │
│    (Al hacer click en lista) │   └── presentation/pantallas/       │
│                              │       └── cattle_detail_screen.dart │
│                              │                                     │
│    ¿Por qué ahí?             │ Es una FUNCIONALIDAD COMPLETA       │
│                              │ (ver detalles de UN animal)         │
├──────────────────────────────┼─────────────────────────────────────┤
│ ✏️ Editar Animal             │ modulos/2_detalle_animal/           │
│    (Desde detalle)           │   └── presentation/pantallas/       │
│                              │       └── editar_animal/            │
│                              │           └── editar_animal_screen  │
│                              │                                     │
│    ¿Por qué ahí?             │ Es PARTE del módulo "detalle"       │
│                              │ (editas desde el detalle)           │
├──────────────────────────────┼─────────────────────────────────────┤
│ ➕ Agregar Animal            │ presentation/screens/               │
│    (Botón +)                 │   └── agregar_animal/               │
│                              │       └── agregar_animal_screen     │
│                              │                                     │
│    ¿Por qué ahí?             │ Se puede acceder desde VARIOS       │
│                              │ lugares (Home, Lista, etc.)         │
│                              │ = Compartida                        │
└──────────────────────────────┴─────────────────────────────────────┘
```

---

## 🧩 TU OBSERVACIÓN: "Se Convierte en Pantalla Principal"

### Esto es navegación por STACK (pila):

```
INICIO:
┌─────────────┐
│    HOME     │ ← Única pantalla
└─────────────┘

Usuario hace click en "Escanear NFC":
┌─────────────┐
│ ESCANEAR NFC│ ← Nueva "principal" (está arriba)
├─────────────┤
│    HOME     │ ← Todavía existe, pero oculta
└─────────────┘

Usuario hace click ATRÁS:
┌─────────────┐
│    HOME     │ ← Vuelve a ser la "principal"
└─────────────┘

Usuario hace click en "Ver Inventario":
┌─────────────┐
│ INVENTARIO  │ ← Nueva "principal"
├─────────────┤
│    HOME     │ ← Oculta
└─────────────┘

Usuario hace click en un animal de la lista:
┌─────────────┐
│   DETALLE   │ ← Nueva "principal"
├─────────────┤
│ INVENTARIO  │ ← Oculta
├─────────────┤
│    HOME     │ ← Oculta
└─────────────┘

Usuario hace click en "Editar":
┌─────────────┐
│   EDITAR    │ ← Nueva "principal"
├─────────────┤
│   DETALLE   │ ← Oculta
├─────────────┤
│ INVENTARIO  │ ← Oculta
├─────────────┤
│    HOME     │ ← Oculta
└─────────────┘
```

**Cada vez que navegas, la nueva pantalla se vuelve "principal" temporalmente**

---

## 🎯 REGLA PARA ORGANIZAR PANTALLAS

### ¿Dónde pongo una pantalla nueva?

```
┌────────────────────────────────────────┬─────────────────────┐
│ Pregunta                               │ Respuesta           │
├────────────────────────────────────────┼─────────────────────┤
│ ¿Es una funcionalidad COMPLETA del     │ modulos/N_nombre/   │
│ negocio? (con su propia lógica,        │                     │
│ BLoC, widgets específicos)             │                     │
│                                        │                     │
│ Ejemplos:                              │                     │
│ • Escanear NFC                         │ ✅ MÓDULO           │
│ • Ver lista completa de ganado         │ ✅ MÓDULO           │
│ • Ver detalle de un animal             │ ✅ MÓDULO           │
│ • Registrar eventos sanitarios         │ ✅ MÓDULO           │
├────────────────────────────────────────┼─────────────────────┤
│ ¿Es una pantalla COMPARTIDA que se     │ presentation/       │
│ puede acceder desde MÚLTIPLES lugares? │ screens/            │
│                                        │                     │
│ Ejemplos:                              │                     │
│ • Pantalla principal (Home)            │ ✅ COMPARTIDA       │
│ • Agregar animal (se accede desde      │ ✅ COMPARTIDA       │
│   Home, Lista, etc.)                   │                     │
│ • Configuración                        │ ✅ COMPARTIDA       │
│ • Perfil de usuario                    │ ✅ COMPARTIDA       │
└────────────────────────────────────────┴─────────────────────┘
```

---

## 💡 EJEMPLO PRÁCTICO: Flujo Completo

### Caso de uso: "Quiero editar el animal #42"

```
1️⃣ Usuario abre la app
   📂 presentation/screens/home_screen_mejorado.dart
   └─► Pantalla: Home

2️⃣ Usuario hace click en "Ver Inventario"
   📂 modulos/1_lista_ganado/presentation/pantallas/cattle_list_screen.dart
   └─► Pantalla: Lista de Ganado

3️⃣ Usuario hace click en el animal #42
   📂 modulos/2_detalle_animal/presentation/pantallas/cattle_detail_screen.dart
   └─► Pantalla: Detalle del Animal #42

4️⃣ Usuario hace click en botón "Editar"
   📂 modulos/2_detalle_animal/presentation/pantallas/editar_animal/editar_animal_screen.dart
   └─► Pantalla: Editar Animal #42

5️⃣ Formulario usa componente reutilizable
   📂 presentation/forms/animal_form/animal_form.dart
   └─► Componente: AnimalForm (showExtendedFields: true)

6️⃣ Al guardar, usa servicio de base de datos
   📂 nucleo/servicios/isar_service.dart
   └─► Servicio: IsarService.actualizarAnimal()

7️⃣ Usuario regresa a detalle (presiona atrás)
   📂 modulos/2_detalle_animal/presentation/pantallas/cattle_detail_screen.dart
   └─► Pantalla: Detalle del Animal #42 (actualizado)
```

---

## 🏗️ ARQUITECTURA: Vista Completa

```
┌─────────────────────────────────────────────────────────────────┐
│                         NAVEGACIÓN                              │
│                    (Lo que el usuario ve)                       │
└─────────────────────────────────────────────────────────────────┘
                               │
                ┌──────────────┴──────────────┐
                │                             │
    ┌───────────▼──────────┐      ┌──────────▼──────────┐
    │ PANTALLAS GLOBALES   │      │ PANTALLAS POR       │
    │ (presentation/)      │      │ FUNCIONALIDAD       │
    │                      │      │ (modulos/)          │
    │ • Home               │      │                     │
    │ • Agregar Animal     │      │ • Lista Ganado      │
    │ • Configuración      │      │ • Detalle Animal    │
    │                      │      │ • Escaneo NFC       │
    │                      │      │ • Registro Evento   │
    └───────────┬──────────┘      └──────────┬──────────┘
                │                            │
                └──────────────┬─────────────┘
                               │
                ┌──────────────▼──────────────┐
                │ COMPONENTES COMPARTIDOS     │
                │ (presentation/forms/)       │
                │                             │
                │ • AnimalForm                │
                │ • Otros formularios         │
                └──────────────┬──────────────┘
                               │
                ┌──────────────▼──────────────┐
                │ WIDGETS BÁSICOS             │
                │ (ui/)                       │
                │                             │
                │ • Botones genéricos         │
                │ • Inputs genéricos          │
                └──────────────┬──────────────┘
                               │
                ┌──────────────▼──────────────┐
                │ NÚCLEO (nucleo/)            │
                │                             │
                │ • Modelos (Animal, etc.)    │
                │ • Servicios (Isar, etc.)    │
                │ • Enums                     │
                └─────────────────────────────┘
```

---

## 🎯 RESUMEN PARA TU PREGUNTA

**Tu observación:**
> "Tenemos una pantalla principal y de ahí cada una se convierte en pantalla principal"

**Respuesta:**

✅ **CORRECTO** - Así funciona la navegación en Flutter (stack/pila de pantallas)

**Cómo se organiza en código:**

1. **Home (pantalla inicial)** → `presentation/screens/` (es global)

2. **Pantallas de funcionalidades** → `modulos/N_nombre/` (cada módulo)
   - Lista de ganado → `modulos/1_lista_ganado/`
   - Detalle de animal → `modulos/2_detalle_animal/`
   - Escanear NFC → `modulos/4_escaneo_nfc/`
   - Registrar evento → `modulos/3_registro_evento/`

3. **Pantallas compartidas** → `presentation/screens/` (accesibles desde varios lugares)
   - Agregar animal (se accede desde home, desde lista, etc.)

4. **Componentes reutilizables** → `presentation/forms/`
   - AnimalForm (usado en agregar Y editar)

5. **Lo que TODOS usan** → `nucleo/`
   - Modelos, servicios, enums

---

## 🚀 EN RESUMEN

```
NAVEGACIÓN (Usuario):          ESTRUCTURA (Código):

    [Home]                →    presentation/screens/
       ↓
    [Inventario]          →    modulos/1_lista_ganado/
       ↓
    [Detalle Animal]      →    modulos/2_detalle_animal/
       ↓
    [Editar]              →    modulos/2_detalle_animal/editar_animal/
       │
       └─ usa AnimalForm  →    presentation/forms/animal_form/
          │
          └─ guarda con   →    nucleo/servicios/isar_service.dart
```

**Cada pantalla se vuelve "principal" cuando navegas a ella, pero en el código cada una está organizada según su propósito y reutilización.**

---

**¿Ahora tiene más sentido la organización?** 🎯
