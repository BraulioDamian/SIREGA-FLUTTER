# 📖 Guía de Uso: Agregar Animal

**Versión Mejorada con Botón Flotante**

---

## 🎯 CÓMO REGISTRAR UN ANIMAL

### Opción 1: Registro Rápido (Solo lo Esencial) ⚡

```
1️⃣ Abrir pantalla "Agregar Animal" (botón + en Home)

2️⃣ Completar tab GENERAL (campos requeridos):
   ✅ Foto (opcional)
   ✅ SINIGA (requerido)
   ✅ Info Básica (requerido)
   ✅ Chip NFC (requerido)

3️⃣ Presionar botón flotante verde "Registrar" 🟢
   └─► Ubicado abajo a la derecha
   └─► ¡Siempre visible en todos los tabs!

4️⃣ ✅ ¡Listo! Animal guardado
```

**Tiempo estimado:** 2-3 minutos

---

### Opción 2: Registro Completo (Con Datos Opcionales) 📝

```
1️⃣ Abrir pantalla "Agregar Animal"

2️⃣ Completar tab GENERAL:
   ✅ Todos los campos requeridos
   ✅ Info adicional (herrado, color, etc.)

3️⃣ Ir a tab SALUD (presionar "Siguiente" o tocar el tab):
   ✅ Estado del animal
   ✅ Estado de salud

4️⃣ Ir a tab REPRODUCCIÓN:
   ✅ Estado reproductivo
   ✅ Ubicación actual

5️⃣ Ir a tab PRODUCCIÓN:
   ✅ Peso al nacer
   ✅ Peso actual

6️⃣ Presionar botón flotante verde "Registrar" 🟢

7️⃣ ✅ ¡Listo! Animal guardado con todos los datos
```

**Tiempo estimado:** 5-7 minutos

---

## 🎨 INTERFAZ VISUAL

### Vista General

```
┌─────────────────────────────────────────────────┐
│ ← Registrar Vacuno                             │
├─────────────────────────────────────────────────┤
│ [General*] [Salud] [Reproducción] [Producción] │
├─────────────────────────────────────────────────┤
│ ℹ️ Complete los campos requeridos en General   │
├─────────────────────────────────────────────────┤
│                                                 │
│ ┌───────────────────────────────────┐          │
│ │ 📷 Foto del Animal                │          │
│ └───────────────────────────────────┘          │
│                                                 │
│ ┌───────────────────────────────────┐          │
│ │ 🏷️ SINIGA           [Requerido]   │          │
│ └───────────────────────────────────┘          │
│                                                 │
│ ...scroll para ver más...                      │
│                                                 │
│                                                 │
├─────────────────────────────────────────────────┤
│        [← Anterior]    [Siguiente →]           │
│                                            🟢   │ ← Botón Flotante
│                                        [Registrar]
└─────────────────────────────────────────────────┘
```

---

## 🟢 BOTÓN FLOTANTE "REGISTRAR"

### Características:

```
✅ Siempre visible en todos los tabs
✅ Color verde (fácil de identificar)
✅ Ubicación: Abajo a la derecha
✅ Funciona desde cualquier tab
✅ Valida automáticamente los campos requeridos
```

### ¿Cuándo Usar?

```
🟢 ÚSALO cuando:
   ✅ Completaste los campos requeridos en General
   ✅ Quieres registrar rápido (sin datos opcionales)
   ✅ Ya agregaste toda la información que querías

⚠️ SI FALTAN DATOS REQUERIDOS:
   └─► Muestra mensaje de error
   └─► Te lleva automáticamente al tab General
   └─► Te dice qué falta completar
```

---

## 🔘 BOTONES DE NAVEGACIÓN INFERIORES

### Tabs 1, 2, 3:

```
┌─────────────────────────────────────┐
│  [← Anterior]     [Siguiente →]    │
└─────────────────────────────────────┘
```

**Uso:**
- **"Anterior"**: Volver al tab previo
- **"Siguiente"**: Ir al siguiente tab

### Tab 4 (Producción - último):

```
┌─────────────────────────────────────┐
│  [← Anterior]                       │
└─────────────────────────────────────┘
```

**Uso:**
- Solo botón "Anterior" (para volver)
- Para registrar: usar botón flotante verde 🟢

---

## 📋 CAMPOS POR TAB

### TAB 1 - GENERAL * (Requerido)

```
📷 Foto del Animal
   └─► [Toca para seleccionar imagen]

🏷️ Identificación SINIGA [Requerido]
   ├─ Especie: [Bovino ▼]
   ├─ Arete Visual: [___]
   ├─ País: [484 ▼]
   ├─ Serie: [___]
   ├─ Número: [_______]
   └─ Dígito: [_]

🐄 Información Básica [Requerido]
   ├─ Nombre: [_________]
   ├─ Raza: [__________]
   ├─ Sexo: [Macho ▼]
   ├─ Fecha Nacimiento: [dd/mm/aaaa]
   ├─ Madre: [opcional]
   └─ Padre: [opcional]

📝 Información Adicional
   ├─ Número Herrado: [_____]
   ├─ Color Pelaje: [______]
   └─ Señas: [___________]

📡 Chip NFC [Requerido]
   └─► [Leer Chip NFC]
```

### TAB 2 - SALUD (Opcional)

```
ℹ️ Información opcional. Puede agregarla después.

❤️ Estado de Salud
   ├─ Estado Animal: [Activo ▼]
   └─ Estado Salud: [Sano ▼]
```

### TAB 3 - REPRODUCCIÓN (Opcional)

```
ℹ️ Información opcional. Puede agregarla después.

👶 Estado Reproductivo
   ├─ Estado: [Virgen ▼]
   └─ Gestante: [ ] Sí

📍 Ubicación
   └─ Zona/Potrero: [________]
```

### TAB 4 - PRODUCCIÓN (Opcional)

```
ℹ️ Registre el peso inicial del animal.

📊 Datos de Peso
   ├─ Peso al Nacer (kg): [____]
   └─ Peso Actual (kg): [____]

ℹ️ Los datos de producción láctea se
   agregarán mediante eventos
```

---

## ✅ VALIDACIONES AUTOMÁTICAS

### Al presionar "Registrar":

```
1. ✅ Verifica campos requeridos:
   - SINIGA completo y válido
   - Nombre del animal
   - Raza
   - Sexo
   - Chip NFC leído

2. ✅ Verifica chip NFC único:
   - No existe otro animal con ese chip

3. ❌ Si falta algo:
   - Muestra mensaje de error específico
   - Te lleva al tab correspondiente
   - Resalta el campo faltante

4. ✅ Si todo OK:
   - Guarda el animal
   - Muestra mensaje "Animal registrado exitosamente"
   - Regresa a la pantalla anterior
```

---

## 🚀 FLUJOS DE USO COMUNES

### Escenario 1: Nacimiento de Ternero

```
1. Presionar botón + en Home
2. Tab GENERAL:
   ├─ Foto: [opcional, skip]
   ├─ SINIGA: Completar
   ├─ Nombre: "Ternero #123"
   ├─ Raza: "Holstein"
   ├─ Sexo: "Macho"
   ├─ Fecha: HOY
   └─ NFC: Leer chip
3. Tab SALUD: Skip (default: Sano)
4. Tab REPRODUCCIÓN: Skip
5. Tab PRODUCCIÓN:
   └─ Peso al Nacer: "35 kg"
6. 🟢 Presionar "Registrar"
7. ✅ Listo
```

### Escenario 2: Compra de Vaca

```
1. Presionar botón + en Home
2. Tab GENERAL:
   ├─ Foto: [Tomar foto]
   ├─ SINIGA: Completar
   ├─ Nombre: "Vaca Comprada"
   ├─ Raza: "Jersey"
   ├─ Sexo: "Hembra"
   ├─ Fecha: Aprox.
   └─ NFC: Leer chip
3. Tab SALUD:
   ├─ Estado: "Activo"
   └─ Salud: "Sano"
4. Tab REPRODUCCIÓN:
   ├─ Estado: "Gestante"
   ├─ Gestante: ✓ Sí
   └─ Zona: "Potrero A"
5. Tab PRODUCCIÓN:
   └─ Peso Actual: "450 kg"
6. 🟢 Presionar "Registrar"
7. ✅ Listo
```

### Escenario 3: Registro Rápido

```
1. Presionar botón + en Home
2. Tab GENERAL:
   ├─ SINIGA: Completar (mínimo)
   ├─ Nombre: "Animal X"
   ├─ Raza: "Brahman"
   ├─ Sexo: "Hembra"
   └─ NFC: Leer chip
3. 🟢 Presionar "Registrar" (sin llenar otros tabs)
4. ✅ Listo (datos opcionales para después)
```

---

## ⚠️ MENSAJES DE ERROR COMUNES

### "Por favor complete todos los campos requeridos"

```
Causa: Faltó algún campo en tab General
Solución:
  1. Revisa que SINIGA esté completo
  2. Verifica nombre, raza, sexo
  3. Asegúrate de haber leído el chip NFC
```

### "El ID SINIGA no es válido"

```
Causa: Dígito verificador incorrecto
Solución:
  1. Revisa el número correlativo
  2. El dígito verificador se calcula automáticamente
  3. Verifica que el número sea correcto
```

### "Debe leer el chip NFC"

```
Causa: No se ha escaneado el chip
Solución:
  1. Ir a sección "Chip NFC" en tab General
  2. Presionar "Leer Chip NFC"
  3. Acercar el dispositivo al arete del animal
```

### "Ya existe un animal con ese chip NFC"

```
Causa: El chip ya está registrado
Solución:
  1. Verificar que el chip sea correcto
  2. Buscar el animal existente en el inventario
  3. Usar un chip diferente si es un animal nuevo
```

---

## 💡 CONSEJOS Y BUENAS PRÁCTICAS

### ✅ Recomendaciones:

```
1. Completa primero los datos REQUERIDOS
   └─► Así puedes registrar rápido si tienes prisa

2. Puedes navegar entre tabs libremente
   └─► El botón flotante siempre está disponible

3. Los datos opcionales se pueden agregar después
   └─► Desde la pantalla de "Editar Animal"

4. Toma foto del animal si es posible
   └─► Ayuda a identificarlo visualmente

5. Verifica el chip NFC dos veces
   └─► Debe ser único para cada animal
```

### ❌ Evita:

```
1. No presiones "Registrar" sin verificar datos
   └─► Puede causar errores después

2. No uses el mismo chip NFC para varios animales
   └─► Cada animal debe tener chip único

3. No dejes campos requeridos vacíos
   └─► El sistema no te dejará guardar
```

---

## 🔄 DESPUÉS DE REGISTRAR

### ¿Qué pasa?

```
1. ✅ Se guarda el animal en la base de datos local
2. ✅ Regresa a la pantalla anterior
3. ✅ El animal aparece en el inventario
4. ✅ Puedes verlo en "Ver Inventario"
5. ✅ Puedes editarlo cuando quieras
```

### ¿Cómo agregar más datos después?

```
1. Ir a "Ver Inventario"
2. Buscar el animal
3. Tocar para ver detalles
4. Presionar botón "Editar"
5. Agregar información adicional
6. Guardar
```

---

## 📊 RESUMEN VISUAL

```
                    AGREGAR ANIMAL
                         │
        ┌────────────────┼────────────────┐
        │                │                │
    ¿Rápido?        ¿Completo?       ¿Parcial?
        │                │                │
        ▼                ▼                ▼
   Tab General     Todos los tabs   General + 1-2 tabs
        │                │                │
        │                │                │
        └────────────────┼────────────────┘
                         │
                         ▼
              🟢 Presionar "Registrar"
                         │
                         ▼
                   ¿Válido?
                    /    \
                  Sí      No
                  │        │
                  ▼        ▼
              ✅ Guardado  ❌ Error
                  │        │
                  ▼        └─► Corregir
              Regresar
                HOME
```

---

**Autor:** Equipo SIREGA
**Fecha:** Octubre 2025
**Versión:** 2.0 (con botón flotante)

¡Ahora registrar animales es más rápido e intuitivo! 🚀
