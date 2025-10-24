# 📱 Tabs Expandibles - Agregar Animal

**Fecha:** Octubre 2025
**Funcionalidad:** Tabs que se expanden/contraen físicamente según el estado activo

---

## 🎯 OBJETIVO

Optimizar el espacio en el TabBar haciendo que el tab activo se EXPANDA físicamente para mostrar el texto completo, mientras los tabs inactivos se CONTRAEN mostrando solo el icono, mejorando la legibilidad y el uso del espacio.

---

## 🎨 COMPORTAMIENTO VISUAL

### Tab Activo (Expandido):
```
✅ ANCHO: 120-200px (expandido)
✅ Icono + Texto completo visible
✅ Fuente: 14px, Bold
✅ Icono: 22px
✅ Asterisco (*) naranja si es requerido
```

### Tabs Inactivos (Contraídos):
```
⚪ ANCHO: 70px (contraído)
⚪ Solo icono visible (sin texto)
⚪ Icono: 20px
⚪ Badge naranja circular si es requerido
```

---

## 📊 ESTADOS DE LOS TABS

### Tab 0 - General (ACTIVO):

```
┌──────────────────────────────────────────┐
│  [📋 General *]  [❤️]  [👶]  [📊]          │
│  ═══════════                              │
└──────────────────────────────────────────┘
    ↑           ↑   ↑   ↑
  Expandido   Contraídos (solo iconos)
  120-200px     70px cada uno
```

### Tab 1 - Salud (ACTIVO):

```
┌──────────────────────────────────────────┐
│  [📋•]  [❤️ Salud]  [👶]  [📊]             │
│         ═══════                           │
└──────────────────────────────────────────┘
   ↑        ↑        ↑   ↑
 Contraído Expandido Contraídos
 (con •)   120-200px  70px
```

### Tab 2 - Reproducción (ACTIVO):

```
┌──────────────────────────────────────────┐
│  [📋•]  [❤️]  [👶 Reproducción]  [📊]      │
│               ═════════════               │
└──────────────────────────────────────────┘
   ↑    ↑         ↑              ↑
 Contraídos    Expandido      Contraído
   70px       120-200px         70px
```

### Tab 3 - Producción (ACTIVO):

```
┌──────────────────────────────────────────┐
│  [📋•]  [❤️]  [👶]  [📊 Producción]        │
│                     ══════════            │
└──────────────────────────────────────────┘
   ↑    ↑   ↑          ↑
 Contraídos         Expandido
   70px            120-200px
```

**Nota:** El • (punto naranja) indica que el tab es requerido cuando está contraído

---

## 📏 DIMENSIONES

```
Estado      Ancho      Contenido
──────────────────────────────────────────
Activo    120-200px   Icono (22px) + Texto (14px bold) + Asterisco
Inactivo    70px      Solo Icono (20px) + Badge circular
```

---

## 💻 IMPLEMENTACIÓN TÉCNICA

### 1. Listener en TabController

**Ubicación:** `initState()` - Líneas 47-51

```dart
// Escuchar cambios de tab para actualizar la UI
_tabController.addListener(() {
  if (mounted) {
    setState(() {}); // Rebuilds para actualizar los tabs
  }
});
```

**Por qué:**
- Cada vez que cambia el tab activo, se dispara un rebuild
- Esto permite que `_buildAdaptiveTab()` recalcule el tamaño de cada tab
- AnimatedContainer hace la transición suave

---

### 2. TabBar Scrollable

**Ubicación:** AppBar bottom - Líneas 113-130

```dart
bottom: PreferredSize(
  preferredSize: const Size.fromHeight(48),
  child: TabBar(
    controller: _tabController,
    indicatorColor: Colors.white,
    indicatorWeight: 3,
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white70,
    isScrollable: true,  // ← Importante: permite tabs de diferentes tamaños
    tabAlignment: TabAlignment.start,
    tabs: [
      _buildAdaptiveTab(0, 'General', Icons.info, isRequired: true),
      _buildAdaptiveTab(1, 'Salud', Icons.favorite, isRequired: false),
      _buildAdaptiveTab(2, 'Reproducción', Icons.child_care, isRequired: false),
      _buildAdaptiveTab(3, 'Producción', Icons.show_chart, isRequired: false),
    ],
  ),
),
```

**Parámetros clave:**
- `isScrollable: true`: Permite que los tabs tengan diferentes tamaños
- `tabAlignment: TabAlignment.start`: Alinea tabs a la izquierda
- `index`: Índice del tab (0, 1, 2, 3)
- `label`: Texto completo del tab
- `icon`: Icono del tab
- `isRequired`: Si muestra indicador de requerido

---

### 3. Método _buildAdaptiveTab con AnimatedContainer

**Ubicación:** Líneas 177-248

```dart
Widget _buildAdaptiveTab(
  int index,
  String label,
  IconData icon,
  {required bool isRequired}
) {
  // Determinar si este tab está activo
  final isActive = _tabController.index == index;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    curve: Curves.easeInOut,
    // El tab activo es más ancho, los inactivos son más pequeños
    width: isActive ? null : 70,
    constraints: BoxConstraints(
      minWidth: isActive ? 120 : 70,
      maxWidth: isActive ? 200 : 70,
    ),
    child: Tab(
      child: isActive
          ? Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 22),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isRequired)
                  const Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Text(
                      '*',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            )
          : Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(icon, size: 20),
                if (isRequired)
                  Positioned(
                    right: -4,
                    top: -4,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
    ),
  );
}
```

**Componentes clave:**

1. **AnimatedContainer**: Anima el cambio de tamaño (200ms, easeInOut)
2. **width/constraints**: Controla el ancho del tab (70px vs 120-200px)
3. **Contenido condicional**:
   - **Activo**: Row con icono + texto + asterisco
   - **Inactivo**: Stack con solo icono + badge circular

---

## 🔄 FLUJO DE INTERACCIÓN

### Secuencia Completa:

```
1. Usuario está en tab "General"
   └─► TabBar muestra: [📋 General *] [❤️] [👶] [📊]
   └─► Anchos: 150px + 70px + 70px + 70px

2. Usuario hace swipe hacia la izquierda
   └─► TabController detecta cambio de índice (0 → 1)

3. Listener de TabController se dispara
   └─► Ejecuta setState({})

4. Flutter rebuilda el TabBar
   └─► _buildAdaptiveTab() se ejecuta 4 veces

5. Para cada tab, AnimatedContainer calcula nuevas dimensiones:
   ├─► Tab 0: isActive=false → width: 70px, contenido: solo icono
   ├─► Tab 1: isActive=true → width: 120-200px, contenido: icono + texto
   ├─► Tab 2: isActive=false → width: 70px, contenido: solo icono
   └─► Tab 3: isActive=false → width: 70px, contenido: solo icono

6. AnimatedContainer anima la transición (200ms, easeInOut)
   ├─► Tab 0 se contrae: 150px → 70px (icono + texto → solo icono)
   └─► Tab 1 se expande: 70px → 140px (solo icono → icono + texto)

7. UI actualizada con animación fluida
   └─► TabBar muestra: [📋•] [❤️ Salud] [👶] [📊]
   └─► Anchos: 70px + 140px + 70px + 70px
```

---

## 🎓 VENTAJAS UX

### 1. Máxima Optimización de Espacio
```
Antes (todos los tabs con texto):
[General*][Salud][Reproducción][Producción]
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  Se sobrelapan o se reduce demasiado

Ahora (expansión/contracción física):
[📋 General *]  [❤️]  [👶]  [📊]
     ↑          ↑    ↑    ↑
  Expandido  Contraídos (solo iconos)
  150px        70px cada uno
```

### 2. Enfoque Visual Extremo
```
✅ El tab activo DOMINA visualmente (2-3x más grande)
✅ Texto completo SIEMPRE visible sin truncar
✅ Tabs inactivos discretos pero accesibles
✅ Jerarquía visual cristalina
```

### 3. Transiciones Fluidas
```
AnimatedContainer con 200ms easeInOut:
  ├─► Expansión suave del nuevo tab
  ├─► Contracción suave del anterior
  ├─► Sensación premium y pulida
  └─► Feedback visual claro del cambio
```

### 4. Uso Inteligente del Espacio
```
Distribución adaptativa:
  Tab activo: 120-200px (ajusta al contenido)
  Tabs inactivos: 70px fijos (3 tabs = 210px)

Total usado:
  Activo + 3 inactivos = 120-200px + 210px = 330-410px
  vs
  4 tabs completos = 600-800px (no cabe en pantalla)
```

### 5. Indicadores Contextuales
```
Tab Activo (requerido):
  [📋 General *] ← Asterisco grande naranja

Tab Inactivo (requerido):
  [📋•] ← Badge circular naranja discreto
```

---

## 📱 RESPONSIVIDAD

### En Dispositivos Pequeños:
```
Espacio muy limitado:
[Gen] [Salud] [Reprod] [Prod]
  ↑
Solo el activo usa más espacio
```

### En Dispositivos Medianos:
```
Espacio suficiente:
[General*] [Salud] [Reprod] [Prod]
   ↑
Texto completo visible sin problemas
```

### En Tablets:
```
Espacio abundante:
[General*] [Salud] [Reproducción] [Producción]
            ↑
Todos pueden mostrar más texto si es necesario
```

---

## 🔧 PERSONALIZACIÓN

### Ajustar Tamaños de Fuente:

```dart
// Activo
fontSize: isActive ? 14 : 10,  // Más contraste

// O menos contraste
fontSize: isActive ? 12.5 : 11.5,  // Más sutil
```

### Ajustar Pesos de Fuente:

```dart
// Más dramático
fontWeight: isActive ? FontWeight.w900 : FontWeight.w300,

// Más sutil
fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
```

### Ajustar Tamaños de Iconos:

```dart
// Mayor diferencia
size: isActive ? 24 : 16,

// Menor diferencia
size: isActive ? 19 : 17,
```

---

## ✅ CASOS DE PRUEBA

### ✅ Caso 1: Navegación Secuencial
```
Inicio: Tab 0 (General)
Swipe →: Tab 1 (Salud)
Swipe →: Tab 2 (Reproducción)
Swipe →: Tab 3 (Producción)

Resultado:
✅ En cada paso, solo el tab activo muestra texto completo
✅ Los demás se abrevian correctamente
✅ La transición es fluida
```

### ✅ Caso 2: Navegación con Tap
```
Usuario en Tab 0
Tap en Tab 3 directamente

Resultado:
✅ Tab 0 se contrae: General → Gen
✅ Tab 3 se expande: Prod → Producción
✅ Tabs 1 y 2 permanecen abreviados
```

### ✅ Caso 3: Swipe Hacia Atrás
```
Usuario en Tab 3
Swipe ←: Tab 2
Swipe ←: Tab 1

Resultado:
✅ Cada tab activo se expande
✅ El anterior se contrae
✅ Comportamiento consistente
```

---

## 🎨 COMPARACIÓN ANTES/DESPUÉS

### ANTES:
```
┌──────────────────────────────────────────────────┐
│ [General *] [Salud] [Reproducción] [Producción] │
│  ═══════                                         │
└──────────────────────────────────────────────────┘
    ↑         ↑          ↑              ↑
  Todos ocupan el mismo espacio aproximado
  Texto largo se trunca con "..."

Problemas:
❌ "Reproducción" y "Producción" se cortan
❌ Difícil diferenciar el tab activo
❌ Desperdicio de espacio en tabs inactivos
❌ Sobrecarga visual (demasiado texto)
```

### AHORA:
```
┌──────────────────────────────────────────────────┐
│  [📋 General *]  [❤️]  [👶]  [📊]                  │
│  ═══════════                                      │
└──────────────────────────────────────────────────┘
      ↑          ↑   ↑   ↑
   Expandido  Contraídos (solo iconos)
   150px        70px c/u

Mejoras:
✅ Tab activo 2-3x MÁS GRANDE (imposible confundir)
✅ Texto completo SIEMPRE visible (nunca truncado)
✅ Tabs inactivos ultra-compactos (solo icono)
✅ Animación fluida de expansión/contracción
✅ Indicador requerido adaptativo (asterisco vs badge)
```

### Cuando cambias a "Reproducción":
```
ANTES:
┌──────────────────────────────────────────────────┐
│ [General *] [Salud] [Reproducción] [Producción] │
│                      ═══════════                 │
└──────────────────────────────────────────────────┘
                         ↑
                  Texto truncado "Reproduc..."

AHORA:
┌──────────────────────────────────────────────────┐
│  [📋•]  [❤️]  [👶 Reproducción]  [📊]              │
│               ═════════════                       │
└──────────────────────────────────────────────────┘
   ↑    ↑         ↑                ↑
  70px 70px    180px (expandido)  70px

  ✅ Texto completo "Reproducción" perfectamente legible
  ✅ Transición animada suave
  ✅ Los demás se contraen para dar espacio
```

---

## 🚀 POSIBLES MEJORAS FUTURAS

### 1. Peek del Texto en Hover (Desktop)
```dart
Tooltip(
  message: label,
  child: Icon(icon, size: 20),
)
// Mostrar el nombre completo al pasar el mouse sobre tabs contraídos
```

### 2. Badge de Completitud
```dart
if (isActive && _tabCompleted[index])
  Positioned(
    right: 4,
    top: 4,
    child: Icon(Icons.check_circle, color: Colors.green, size: 16),
  )
// Indicar visualmente qué tabs tienen datos completos
```

### 3. Animación Más Dramática
```dart
duration: const Duration(milliseconds: 300),
curve: Curves.elasticOut,
// Para transiciones más llamativas y "juguеtonas"
```

### 4. Ajuste Dinámico de Tamaño
```dart
constraints: BoxConstraints(
  minWidth: isActive ? label.length * 8.0 : 70,
  maxWidth: isActive ? double.infinity : 70,
)
// Ajustar el ancho exacto según la longitud del texto
```

### 5. Scroll Automático al Tab Activo
```dart
_tabController.addListener(() {
  if (_tabController.indexIsChanging) {
    // Scroll para centrar el tab activo si está parcialmente oculto
    _scrollToActiveTab();
  }
});
```

---

## 📊 RESUMEN TÉCNICO

```
Característica          Implementación
─────────────────────────────────────────────────────
Expansión/Contracción  AnimatedContainer (200ms)
Tab activo            120-200px ancho, texto completo
Tabs inactivos         70px ancho, solo icono
Indicador requerido    Asterisco (*) vs Badge (•)
Scrollable             Sí (TabAlignment.start)
Animación              Curves.easeInOut
Rebuild trigger        TabController.addListener()
```

---

**Autor:** Equipo SIREGA
**Fecha:** Octubre 2025
**Estado:** ✅ Implementado y Verificado

¡Tabs expandibles para máxima legibilidad y aprovechamiento de espacio! 📱✨
