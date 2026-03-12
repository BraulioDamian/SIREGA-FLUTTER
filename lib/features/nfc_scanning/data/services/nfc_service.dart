import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:android_intent_plus/android_intent.dart';

class NfcService {
  Future<NFCAvailability> checkNfcAvailability() async {
    return await FlutterNfcKit.nfcAvailability;
  }

  void openNfcSettings() {
    const intent = AndroidIntent(action: 'android.settings.NFC_SETTINGS');
    intent.launch();
  }

  Future<String> readNfcTag() async {
    final tag = await FlutterNfcKit.poll(timeout: const Duration(seconds: 15));
    return tag.id;
  }

  Future<void> finishScan() async {
    await FlutterNfcKit.finish();
  }
}
