// Ejemplo de códigos INEGI para demostrar la auto-selección
// 
// INSTRUCCIONES DE USO:
// 1. En el campo "Código Estado", ingresa cualquiera de estos números:
//    
//    01 - Aguascalientes
//    02 - Baja California  
//    03 - Baja California Sur
//    04 - Campeche
//    05 - Coahuila de Zaragoza
//    06 - Colima
//    07 - Chiapas
//    08 - Chihuahua
//    09 - Ciudad de México
//    10 - Durango
//    11 - Guanajuato
//    12 - Guerrero
//    13 - Hidalgo
//    14 - Jalisco
//    15 - México
//    16 - Michoacán de Ocampo
//    17 - Morelos
//    18 - Nayarit
//    19 - Nuevo León
//    20 - Oaxaca
//    21 - Puebla
//    22 - Querétaro
//    23 - Quintana Roo
//    24 - San Luis Potosí
//    25 - Sinaloa
//    26 - Sonora
//    27 - Tabasco
//    28 - Tamaulipas
//    29 - Tlaxcala
//    30 - Veracruz de Ignacio de la Llave
//    31 - Yucatán
//    32 - Zacatecas
//
// 2. Al escribir el código (ejemplo: "05"), automáticamente se seleccionará 
//    "Coahuila de Zaragoza" en el dropdown de abajo
//
// 3. Aparecerá una notificación verde confirmando la selección automática
//
// 4. El ID SINIGA se validará automáticamente cuando tengas:
//    - Especie: 00 (bovinos)
//    - Estado: código válido (ejemplo: 05)  
//    - Número: 8 dígitos (ejemplo: 12345678)
//    - Resultado: 00051234567

// TESTING:
// Prueba escribiendo "05" - debe seleccionar Coahuila
// Prueba escribiendo "20" - debe seleccionar Oaxaca
// Prueba escribiendo "99" - no debe seleccionar nada (código inválido)

export const CODIGOS_EJEMPLO = {
  "05": "Coahuila de Zaragoza",
  "20": "Oaxaca", 
  "19": "Nuevo León",
  "14": "Jalisco",
  "15": "México"
};
