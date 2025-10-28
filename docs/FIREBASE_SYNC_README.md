# Arquitectura de Sincronización con Firebase

## Introducción

Este documento describe la arquitectura y el flujo de trabajo para sincronizar la base de datos local (Isar) con Firebase, permitiendo una experiencia multi-usuario y persistencia de datos en la nube.

## Arquitectura de Datos en Firebase

### Firebase Authentication

Se utilizará Firebase Authentication para gestionar el registro y la autenticación de usuarios. Cada usuario tendrá un identificador único (UID) que será la clave para asociar los datos con el usuario.

### Estructura de Datos en Firestore

La base de datos en la nube será Firestore. La estructura estará organizada por usuario para garantizar la privacidad y la escalabilidad.

- **Colección Raíz:** `users`
- **Documentos de Usuario:** Cada documento en la colección `users` tendrá como ID el UID del usuario de Firebase Authentication.
- **Sub-colecciones:** Dentro de cada documento de usuario, se crearán sub-colecciones para los diferentes tipos de datos:

```
/users/{userId}/
  - cattle/{animalId}
  - events/{eventId}
  - herds/{herdId}
  - productions/{productionId}
  - batch_events/{batchEventId}
```

Esta estructura asegura que cada usuario solo pueda acceder a sus propios datos mediante las reglas de seguridad de Firestore.

## Mapeo de Modelos Isar a Firestore

A continuación se detalla cómo se mapearán los modelos de Isar a los documentos de Firestore.

| Modelo Isar          | Colección Firestore | Campos Adicionales/Cambios en Firestore                                                                                                                            |
| -------------------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Animal`             | `cattle`            | - `padre` y `madre` (IsarLink) se convierten en `padreId` y `madreId` (String).<br>- `herd` (IsarLink) se convierte en `herdId` (String).                               |
| `EventoSanitario`    | `events`            | - `animal` (IsarLink) se convierte en `animalId` (String).                                                                                                         |
| `Herd`               | `herds`             | - `animales` (IsarLinks) no se almacena directamente. La relación se mantiene a través del campo `herdId` en cada documento de `Animal`.                               |
| `RegistroProduccion` | `productions`       | - `animal` (IsarLink) se convierte en `animalId` (String).                                                                                                         |
| `LoteEvento`         | `batch_events`      | - `animalesIds` (List<int>) se convierte en una lista de `String` con los IDs de los documentos de los animales en Firestore.                                        |
| `SinigaId`           | - (Embebido)        | - Se almacena como un `Map` dentro del documento `Animal`.                                                                                                         |
| `ProductoCatalogo`   | `products_catalog`  | - (Opcional) Esta podría ser una colección global, no específica del usuario, si el catálogo es el mismo para todos.                                                |

## Lógica de Sincronización

La sincronización será bidireccional, permitiendo que los cambios se reflejen tanto en la nube como en el dispositivo local.

### Sincronización Inicial (Descarga de Datos)

Cuando un usuario inicia sesión en un nuevo dispositivo, la aplicación descargará todos sus datos de Firestore y los guardará en la base de datos local de Isar. Esto asegura que el usuario tenga acceso a sus datos incluso sin conexión a internet.

### Sincronización de Local a la Nube (Subida de Datos)

Cuando el usuario realiza un cambio en el dispositivo (crear, actualizar o eliminar un dato), se seguirán los siguientes pasos:

1.  **Marcar para Sincronizar:** El dato modificado se guardará localmente en Isar con un campo `syncStatus` establecido en `pending`.
2.  **Cola de Sincronización:** Un servicio en segundo plano se encargará de revisar periódicamente los datos marcados como `pending`.
3.  **Subida a Firestore:** El servicio subirá los cambios a la sub-colección correspondiente en Firestore.
4.  **Actualizar Estado:** Una vez que el dato se haya subido correctamente, el `syncStatus` en Isar se actualizará a `synced`.

### Sincronización de la Nube a Local (Actualizaciones en Tiempo Real)

La aplicación escuchará los cambios en tiempo real en las sub-colecciones del usuario en Firestore utilizando `snapshots`.

- **Detección de Cambios:** Cuando se detecte un cambio en Firestore (por ejemplo, un dato agregado desde otro dispositivo), la aplicación recibirá el dato actualizado.
- **Actualización Local:** La aplicación actualizará la base de datos local de Isar con el nuevo dato. Se debe tener cuidado de no volver a subir este cambio a la nube para evitar bucles de sincronización.

### Manejo de Conflictos

Para evitar la pérdida de datos cuando un mismo registro se modifica en varios dispositivos al mismo tiempo, se utilizará una estrategia de "el último gana".

- **Timestamps:** Cada modelo de datos tendrá un campo `updatedAt` (o `ultimaActualizacion`).
- **Resolución:** Cuando se detecte un conflicto, la aplicación comparará los timestamps y conservará la versión más reciente.

## Modelos de Datos

Los modelos de datos locales en Isar deberán incluir los siguientes campos para gestionar la sincronización:

- `serverId`: Un `String` que almacenará el ID del documento en Firestore.
- `syncStatus`: Un `enum` (`pending`, `synced`, `error`) para rastrear el estado de sincronización.
- `updatedAt`: Un `DateTime` para el manejo de conflictos.

## Flujo de Trabajo

1.  **Login/Registro:** El usuario se autentica con Firebase Authentication.
2.  **Sincronización Inicial:** La aplicación descarga los datos del usuario desde Firestore a Isar.
3.  **Operación Offline:** El usuario puede crear, leer, actualizar y eliminar datos en la aplicación sin conexión a internet. Los cambios se marcan como `pending`.
4.  **Conexión a Internet:** Cuando el dispositivo se conecta a internet, el servicio de sincronización sube los cambios pendientes a Firestore.
5.  **Actualizaciones en Tiempo Real:** La aplicación recibe actualizaciones de otros dispositivos en tiempo real y actualiza la base de datos local.
