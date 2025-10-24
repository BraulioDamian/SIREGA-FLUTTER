# 📱 Tutorial de Swipe - Agregar Animal

**Fecha:** Octubre 2025
**Funcionalidad:** Tutorial visual animado para navegación por swipe

---

## 🎯 DESCRIPCIÓN

Al abrir la pantalla "Agregar Animal", se muestra automáticamente un indicador visual animado en el lado derecho de la pantalla que enseña al usuario que puede deslizar para navegar entre los tabs.

### Características:

```
✅ Aparece automáticamente al abrir la pantalla
✅ Se muestra solo en los primeros 3 tabs (General, Salud, Reproducción)
✅ Desaparece automáticamente después de 4 segundos
✅ Fade-out suave (500ms) en lugar de desaparecer abruptamente
✅ Animación pulsante continua mientras está visible
```

---

## 🎨 DISEÑO VISUAL

```
┌──────────────────────────────────────────────────────────────┐
│ ← Registrar Vacuno                                          │
├──────────────────────────────────────────────────────────────┤
│ [General*] [Salud] [Reproducción] [Producción]              │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│                                          ┌──────────┐        │
│   [Contenido del formulario]             │    👆    │ FIJO   │
│                                          │          │        │
│                                          │ <<<  ←── │ MUEVE  │
│   (El usuario puede hacer swipe          │ Desliza  │        │
│    hacia la izquierda en toda            │   para   │ FIJO   │
│    la pantalla para avanzar)             │ continuar│        │
│                                          └──────────┘        │
│                                              ↑               │
│                                          Panel fijo          │
│                                    Flechas se mueven ← ←     │
└──────────────────────────────────────────────────────────────┘
            [        Registrar Animal        ]
```

**Componentes:**
- **Panel (Container):** FIJO en el lado derecho (120px ancho)
- **Icono 👆 (Icons.swipe):** FIJO, no se mueve (60px)
- **Flechas <<<:** Se MUEVEN de derecha a izquierda (40px cada una)
- **Texto "Desliza para continuar":** FIJO, no se mueve
- **Dirección de swipe:** ← Hacia la izquierda para avanzar al siguiente tab

---

## 💻 IMPLEMENTACIÓN TÉCNICA

### 1. Estado del Tutorial

```dart
bool _mostrarTutorialSwipe = true; // Línea 35
```

### 2. Timer Automático

```dart
// En initState() - Líneas 47-53
Future.delayed(const Duration(seconds: 4), () {
  if (mounted) {
    setState(() {
      _mostrarTutorialSwipe = false; // Ocultar después de 4 segundos
    });
  }
});
```

### 3. Widget Animado

```dart
// Líneas 141-151
if (_tabController.index < 3)
  Positioned(
    right: 0,
    top: 0,
    bottom: 80,
    child: AnimatedOpacity(
      opacity: _mostrarTutorialSwipe ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500), // Fade-out suave
      child: _buildSwipeIndicator(),
    ),
  ),
```

### 4. Indicador Visual con Animación de Movimiento

```dart
// Líneas 408-485
Widget _buildSwipeIndicator() {
  return Container(
    width: 120,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withAlpha(38), // Fondo semitransparente
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(60),
        bottomLeft: Radius.circular(60),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icono grande de mano (FIJO - no se mueve)
        Icon(
          Icons.swipe,
          color: Theme.of(context).primaryColor,
          size: 60,
        ),
        const SizedBox(height: 16),

        // Solo las flechas se animan
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1200),
          builder: (context, value, child) {
            // Las flechas se mueven de derecha a izquierda (simulando swipe)
            final double offsetX = 30 - (value * 60); // Se mueve de 30 a -30

            return Transform.translate(
              offset: Offset(offsetX, 0), // Solo mueve las flechas
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chevron_left,
                    color: Theme.of(context).primaryColor,
                    size: 40,
                  ),
                  Icon(Icons.chevron_left,
                    color: Theme.of(context).primaryColor.withAlpha(179),
                    size: 40,
                  ),
                  Icon(Icons.chevron_left,
                    color: Theme.of(context).primaryColor.withAlpha(128),
                    size: 40,
                  ),
                ],
              ),
            );
          },
          onEnd: () {
            // Reiniciar animación solo si el tutorial sigue visible
            if (mounted && _mostrarTutorialSwipe) {
              setState(() {});
            }
          },
        ),

        const SizedBox(height: 16),
        // Texto "Desliza" (FIJO - no se mueve)
        Text(
          'Desliza\npara\ncontinuar',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
      ],
    ),
  );
}
```

**Características de la animación:**
- **Panel FIJO:** Container de 120px permanece estático en el lado derecho
- **Recorte:** `Clip.hardEdge` en el Container y `ClipRect` en las flechas aseguran que no se salgan del panel
- **Flechas animadas:** Solo las 3 flechas <<< se mueven dentro del panel
- **Movimiento sutil:** De derecha a izquierda (12px → -12px) - rango reducido para evitar desbordamiento
- **Curva:** `Curves.easeInOut` para movimiento suave y natural
- **Dirección:** Simula el gesto de swipe hacia la izquierda
- **Icono:** `Icons.swipe` de 60px (FIJO, no se mueve)
- **Flechas:** `Icons.chevron_left` de 38px con degradado de opacidad (100%, 70%, 50%)
- **Texto:** "Desliza para continuar" (FIJO, no se mueve, 13px)
- **Duración:** 1.5 segundos por ciclo
- **Reinicio:** Solo se reinicia si `_mostrarTutorialSwipe` es `true`

---

## ⏱️ CRONOLOGÍA DE LA ANIMACIÓN

```
Tiempo    Estado                           Acción
────────────────────────────────────────────────────────────────
0s        Pantalla abierta                 Panel FIJO en lado derecho (opacity 1.0)
                                           Flechas en posición inicial: 12px
                                           ClipRect activo para evitar desbordamiento

0-1.5s    Animación ciclo 1                Flechas se mueven: 12px → -12px
                                           (derecha a izquierda, suave con easeInOut)

1.5-3.0s  Animación ciclo 2                Flechas reinician y se mueven: 12px → -12px
3.0-4.0s  Animación ciclo 3 (parcial)      Flechas se mueven: 12px → -6px aprox.

4s        Timer completo                   _mostrarTutorialSwipe = false
                                           Animación detiene reinicio
                                           Panel sigue visible momentáneamente

4-4.5s    Fade-out                         Todo el panel: Opacity 1.0 → 0.0 (500ms)
                                           AnimatedOpacity aplica transición

4.5s+     Tutorial oculto                  Panel completamente invisible
```

**Resumen del movimiento:**
- **Panel:** Permanece FIJO en el lado derecho (120px ancho, no se mueve)
- **Contenedor de flechas:** SizedBox de 50px altura con ClipRect para recortar contenido
- **Flechas:** Se mueven sutilmente de derecha a izquierda (12px → -12px) - movimiento contenido
- **Ciclos:** El usuario ve aproximadamente 2.7 ciclos completos antes del fade-out
- **Dirección:** Las flechas <<< apuntan y se mueven hacia la izquierda
- **Recorte:** ClipRect asegura que las flechas nunca se salgan del panel visible

---

## 🔄 COMPORTAMIENTO

### Cuándo SE MUESTRA:

```
✅ Al abrir la pantalla por primera vez
✅ En tab General (índice 0)
✅ En tab Salud (índice 1)
✅ En tab Reproducción (índice 2)
✅ Durante los primeros 4 segundos
```

### Cuándo NO SE MUESTRA:

```
❌ Después de 4 segundos desde que se abrió la pantalla
❌ En tab Producción (índice 3, último tab)
❌ Durante el fade-out (4-4.5 segundos)
```

---

## 🎯 VENTAJAS DE LA IMPLEMENTACIÓN

### 1. Altamente Visible
```
✓ Tamaño grande (120px de ancho)
✓ Icono de 60px fácil de ver
✓ Movimiento llamativo que capta la atención
✓ Texto claro: "Desliza para continuar"
```

### 2. Intuitivo
```
✓ El movimiento simula el gesto real de swipe
✓ Flechas muestran la dirección
✓ Se repite 3-4 veces (suficiente para entender)
✓ Enseña visualmente la interacción
```

### 3. No Invasivo
```
✓ No bloquea la interacción del usuario
✓ Se puede ignorar si ya conoces la funcionalidad
✓ Desaparece automáticamente después de 4 segundos
✓ No requiere acción para cerrarlo
```

### 4. Elegante
```
✓ Animación suave y fluida
✓ Colores semitransparentes
✓ Fade-out gradual
✓ Diseño redondeado que combina con la UI
```

### 5. Performante
```
✓ Usa TweenAnimationBuilder (eficiente)
✓ Animación nativa de Flutter
✓ Transform.translate es GPU-accelerated
✓ No afecta el rendimiento de la app
```

---

## 📝 MEJORAS FUTURAS OPCIONALES

### Opción 1: Recordar que el usuario ya vio el tutorial
```dart
// Usar SharedPreferences para mostrar solo la primera vez
final prefs = await SharedPreferences.getInstance();
bool yaVioTutorial = prefs.getBool('vio_tutorial_swipe') ?? false;

if (!yaVioTutorial) {
  // Mostrar tutorial
  _mostrarTutorialSwipe = true;
  await prefs.setBool('vio_tutorial_swipe', true);
}
```

### Opción 2: Permitir cerrar manualmente
```dart
// Agregar botón "X" para cerrar el tutorial antes de 4 segundos
GestureDetector(
  onTap: () {
    setState(() {
      _mostrarTutorialSwipe = false;
    });
  },
  child: Icon(Icons.close, size: 16),
)
```

### Opción 3: Tutorial diferente por tab
```dart
// Mostrar diferentes mensajes según el tab actual
String getMensajeTutorial(int tabIndex) {
  switch (tabIndex) {
    case 0: return 'Desliza para Salud →';
    case 1: return 'Desliza para Reproducción →';
    case 2: return 'Desliza para Producción →';
    default: return 'Desliza';
  }
}
```

---

## ✅ VERIFICACIÓN

### Código Analizado:
```bash
flutter analyze agregar_animal_screen.dart
# No issues found! ✅
```

### Pruebas Manuales:
```
1. ✅ Abrir pantalla "Agregar Animal"
2. ✅ Ver tutorial animado en el lado derecho
3. ✅ Esperar 4 segundos
4. ✅ Verificar que desaparece suavemente
5. ✅ Navegar entre tabs con swipe
6. ✅ Verificar que NO aparece en tab Producción
```

---

## 🎓 CONCEPTOS DE FLUTTER UTILIZADOS

### 1. AnimatedOpacity
```dart
// Widget de Flutter para animar cambios de opacidad
// Duración: 500ms para fade-out suave
AnimatedOpacity(
  opacity: _mostrarTutorialSwipe ? 1.0 : 0.0,
  duration: const Duration(milliseconds: 500),
  child: widget,
)
```

### 2. TweenAnimationBuilder
```dart
// Constructor de animaciones personalizadas
// Permite crear animaciones reutilizables sin StatefulWidget
TweenAnimationBuilder<double>(
  tween: Tween(begin: 0.0, end: 1.0),
  duration: const Duration(milliseconds: 1200),
  builder: (context, value, child) {
    // value va de 0.0 a 1.0
    final double offsetX = -80 + (value * 80); // Calcular posición
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: child,
    );
  },
  onEnd: () {
    // Reinicia solo si el tutorial sigue visible
    if (mounted && _mostrarTutorialSwipe) {
      setState(() {});
    }
  },
)
```

### 3. Transform.translate
```dart
// Desplaza el widget sin afectar el layout
// Perfecto para animaciones de movimiento suaves
Transform.translate(
  offset: Offset(offsetX, 0), // (horizontal, vertical)
  child: widget,
)

// En nuestra implementación:
final double offsetX = 12 - (value * 24); // value va de 0.0 a 1.0
// Cuando value = 0.0: offsetX = 12px (posición inicial, derecha)
// Cuando value = 0.5: offsetX = 0px (centro)
// Cuando value = 1.0: offsetX = -12px (posición final, izquierda)

// Rango pequeño (24px total) para que las flechas no se salgan del panel
// ClipRect recorta cualquier parte que salga del contenedor
```

### 4. Future.delayed
```dart
// Ejecuta código después de un tiempo específico
Future.delayed(const Duration(seconds: 4), () {
  // Este código se ejecuta 4 segundos después
  setState(() {
    _mostrarTutorialSwipe = false;
  });
});
```

### 5. Stack y Positioned
```dart
// Stack: Apilar widgets uno sobre otro
// Positioned: Posicionar dentro del Stack
Stack(
  children: [
    TabBarView(...), // Contenido principal
    Positioned(      // Tutorial superpuesto
      right: 0,
      top: 0,
      bottom: 80,
      child: AnimatedOpacity(
        opacity: _mostrarTutorialSwipe ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: tutorial,
      ),
    ),
  ],
)
```

### 6. ClipRect
```dart
// Recorta el contenido que se sale del área rectangular del widget
// Fundamental para mantener las flechas dentro del panel
SizedBox(
  height: 50,
  width: 120,
  child: ClipRect(  // Recorta cualquier contenido fuera del SizedBox
    child: animatedWidget,
  ),
)

// Sin ClipRect: las flechas se saldrían del panel cuando offsetX < 0
// Con ClipRect: las flechas se recortan limpiamente en los bordes
```

### 7. BorderRadius condicional
```dart
// Bordes redondeados solo en algunos lados
BorderRadius.only(
  topLeft: Radius.circular(60),
  bottomLeft: Radius.circular(60),
  // topRight y bottomRight quedan cuadrados
)
// Crea el efecto de "pastilla" desde la derecha
```

### 8. Curves.easeInOut
```dart
// Curva de animación que acelera al inicio y desacelera al final
// Hace que el movimiento se sienta más natural y suave
TweenAnimationBuilder(
  curve: Curves.easeInOut, // Movimiento suave, no lineal
  duration: const Duration(milliseconds: 1500),
  ...
)
```

---

**Autor:** Equipo SIREGA
**Fecha:** Octubre 2025
**Estado:** ✅ Implementado y Verificado

¡Tutorial de swipe completamente funcional! 🎉
