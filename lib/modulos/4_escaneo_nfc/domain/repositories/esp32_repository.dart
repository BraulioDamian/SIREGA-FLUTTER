abstract class Esp32Repository {
  Future<Stream<String>> connectToEsp32();
  Future<void> openWifiSettings();
  void disconnect();
}
