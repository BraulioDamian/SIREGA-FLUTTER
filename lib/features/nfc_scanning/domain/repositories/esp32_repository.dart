enum Esp32ConnectionMode { wifi, ble }

abstract class Esp32Repository {
  Future<Stream<String>> connectToEsp32();
  Future<void> openWifiSettings();
  void disconnect();

  /// Modo de conexión actual
  Esp32ConnectionMode get connectionMode;

  /// Cambia el modo de conexión (desconecta el actual primero)
  set connectionMode(Esp32ConnectionMode mode);
}
