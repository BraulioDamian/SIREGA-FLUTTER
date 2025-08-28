import 'package:web_socket_channel/io.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
// TODO: Add logic to open wifi settings

class Esp32Service {
  Future<bool> isWifiEnabled() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult.contains(ConnectivityResult.wifi);
  }

  Future<Stream<String>> connectToEsp32(String url) async {
    final channel = IOWebSocketChannel.connect(url);
    return channel.stream.map((data) => data.toString());
  }
}
