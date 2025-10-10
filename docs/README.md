# 📚 Índice de Documentación - SIREGA

Bienvenido a la documentación del proyecto SIREGA. Esta carpeta contiene toda la información necesaria para entender la estructura, patrones y convenciones del proyecto.

---

## 📖 Guías Disponibles

### 1. 🏗️ [ARQUITECTURA_DEL_PROYECTO.md](./ARQUITECTURA_DEL_PROYECTO.md)
**Lectura obligatoria para nuevos desarrolladores**

Contenido:
- Información general del proyecto
- Estructura de carpetas y archivos
- Patrones de arquitectura (Clean Architecture, BLoC)
- Gestión de estado
- Base de datos Isar
- Estructura de módulos
- Ejemplos de implementación
- Dependencias principales
- Comandos útiles

**Leer esto primero** si eres nuevo en el proyecto.

---

### 2. 📝 [PATRONES_Y_CONVENCIONES.md](./PATRONES_Y_CONVENCIONES.md)
**Guía de referencia para código consistente**

Contenido:
- Nomenclatura (archivos, clases, variables, constantes)
- Estructura de archivos e imports
- Patrón BLoC detallado (Events, States, Bloc)
- Modelos Isar
- Widgets (Stateless y Stateful)
- Servicios
- Enums
- Checklist de código

**Consultar esto** antes de escribir cualquier código nuevo.

---

### 3. 🔍 [GUIA_MODIFICACION.md](./GUIA_MODIFICACION.md)
**Proceso paso a paso para modificar código**

Contenido:
- Proceso de modificación
- Checklists por tipo de cambio:
  - Agregar modelo Isar
  - Agregar BLoC
  - Agregar pantalla
  - Agregar widget
  - Agregar servicio
  - Modificar modelo existente
  - Agregar enum
- Comandos frecuentes
- Patrones comunes (navegación, mensajes, formularios)
- Resolución de problemas comunes

**Seguir esto** cuando vayas a modificar o agregar código.

---

## 🚀 Flujo de Trabajo Recomendado

### Para Nuevos Desarrolladores:
```
1. Leer → ARQUITECTURA_DEL_PROYECTO.md
2. Revisar → PATRONES_Y_CONVENCIONES.md
3. Ejecutar → flutter pub get
4. Ejecutar → flutter pub run build_runner build --delete-conflicting-outputs
5. Ejecutar → flutter run
```

### Para Modificaciones:
```
1. Consultar → GUIA_MODIFICACION.md
2. Revisar → PATRONES_Y_CONVENCIONES.md (según el tipo de cambio)
3. Buscar ejemplos similares en el código
4. Implementar siguiendo los patrones
5. Verificar con el checklist
```

### Para Agregar Funcionalidad Nueva:
```
1. Leer → ARQUITECTURA_DEL_PROYECTO.md (sección de módulos)
2. Consultar → GUIA_MODIFICACION.md (checklist específico)
3. Seguir → PATRONES_Y_CONVENCIONES.md (para código consistente)
4. Implementar
5. Documentar si es necesario
```

---

## 🔧 Comandos Rápidos

```bash
# Ver documentación desde terminal
cat docs/ARQUITECTURA_DEL_PROYECTO.md
cat docs/PATRONES_Y_CONVENCIONES.md
cat docs/GUIA_MODIFICACION.md

# Generar código Isar
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerar)
flutter pub run build_runner watch --delete-conflicting-outputs

# Analizar código
flutter analyze

# Ejecutar app
flutter run
```

---

## 📊 Estructura del Proyecto

```
SIREGA-FLUTTER/
├── docs/                               ← Estás aquí
│   ├── README.md                       ← Este archivo
│   ├── ARQUITECTURA_DEL_PROYECTO.md    ← Arquitectura general
│   ├── PATRONES_Y_CONVENCIONES.md      ← Guía de estilo
│   └── GUIA_MODIFICACION.md            ← Proceso de cambios
├── lib/
│   ├── main.dart
│   ├── modulos/                        ← Features por módulo
│   ├── nucleo/                         ← Modelos y servicios compartidos
│   ├── presentation/                   ← UI compartida
│   └── ui/                             ← Componentes UI
├── assets/
├── test/
└── pubspec.yaml
```

---

## 🎯 Preguntas Frecuentes

### ¿Dónde agrego un nuevo modelo?
→ `lib/nucleo/modelos/` + seguir [GUIA_MODIFICACION.md](./GUIA_MODIFICACION.md#-agregar-un-nuevo-modelo-isar)

### ¿Cómo creo un nuevo BLoC?
→ En el módulo correspondiente + seguir [PATRONES_Y_CONVENCIONES.md](./PATRONES_Y_CONVENCIONES.md#-patrón-bloc)

### ¿Qué convención de nombres usar?
→ Ver [PATRONES_Y_CONVENCIONES.md](./PATRONES_Y_CONVENCIONES.md#-nomenclatura)

### ¿Cómo estructuro un nuevo módulo?
→ Ver [ARQUITECTURA_DEL_PROYECTO.md](./ARQUITECTURA_DEL_PROYECTO.md#-estructura-de-módulos)

### ¿Dónde están los ejemplos de código?
→ [ARQUITECTURA_DEL_PROYECTO.md](./ARQUITECTURA_DEL_PROYECTO.md#-ejemplos-de-implementación)

---

## 🐛 Problemas Comunes

| Problema | Solución |
|----------|----------|
| Error "isn't referenced" | Ver [GUIA_MODIFICACION.md](./GUIA_MODIFICACION.md#error-the-declaration-x-isnt-referenced) |
| Missing part of directive | Ver [GUIA_MODIFICACION.md](./GUIA_MODIFICACION.md#error-missing-part-of-directive) |
| Isar schema not found | Ver [GUIA_MODIFICACION.md](./GUIA_MODIFICACION.md#error-could-not-find-isar-schema) |
| BlocProvider not found | Ver [GUIA_MODIFICACION.md](./GUIA_MODIFICACION.md#error-blocprovider-not-found) |

---

## 📞 Contacto

Para preguntas sobre la documentación o sugerencias de mejora, contacta al equipo de desarrollo.

---

**Última actualización:** Octubre 2025  
**Mantenido por:** Equipo SIREGA

---

## 🎓 Recursos de Aprendizaje

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [Isar Database](https://isar.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
