// lib/nucleo/modelos/enums_completo.dart
// Enums mejorados y completos para el proyecto SIREGA

enum Sexo { 
  macho, 
  hembra, 
  castrado 
}

enum EstadoAnimal { 
  activo, 
  vendido, 
  muerto, 
  perdido,
  enfermo,
  cuarentena,
  prestado,
  enTransito 
}

enum EstadoSalud {
  sano,
  enfermo,
  convaleciente,
  critico,
  enTratamiento,
  enObservacion
}

enum EstadoReproductivo {
  virgen,
  servida,
  gestante,
  lactante,
  seca,
  descarte,
  reproductorActivo,
  reproductorInactivo
}

enum TipoEvento { 
  vacuna, 
  desparasitante, 
  tratamiento, 
  parto, 
  pesaje,
  inseminacion,
  diagnosticoGestacion,
  castracion,
  descorne,
  herraje,
  revisionVeterinaria,
  muestraLaboratorio,
  cambioAlimentacion,
  movimiento,
  venta,
  compra,
  muerte,
  otro
}

enum Prioridad { 
  baja, 
  media, 
  alta,
  critica,
  urgente 
}

enum TipoOperacion {
  crear,
  actualizar,
  eliminar,
  sincronizar
}

enum TipoEntidad {
  animal,
  evento,
  produccion,
  herd,
  alerta,
  configuracion,
  usuario
}

enum EstadoSync {
  pendiente,
  enProceso,
  completado,
  error,
  conflicto,
  cancelado
}

enum TipoAlerta {
  vacunacion,
  desparasitacion,
  parto,
  tratamiento,
  pesaje,
  revision,
  stockBajo,
  documentoVencido,
  sincronizacion,
  sistema,
  personalizada
}

enum EstadoAlerta {
  activa,
  leida,
  procesada,
  pospuesta,
  cancelada,
  expirada
}

enum RolUsuario {
  propietario,
  administrador,
  veterinario,
  trabajador,
  invitado,
  supervisor
}
