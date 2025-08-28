/// Servicio de Bluetooth (stub)
/// Define métodos básicos para escaneo y conexión.
class BluetoothService {
  Future<bool> isBluetoothAvailable() async {
    // TODO: Implementar verificación real
    return true;
  }

  Future<void> startScan() async {
    // TODO: Implementar escaneo real
  }

  Future<void> stopScan() async {
    // TODO: Implementar detener escaneo
  }

  Future<void> connect(String deviceId) async {
    // TODO: Implementar conexión real
  }

  Future<void> disconnect() async {
    // TODO: Implementar desconexión
  }
}
