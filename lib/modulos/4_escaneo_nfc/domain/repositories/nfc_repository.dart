import 'package:sirega_app/nucleo/modelos/animal_model.dart';

abstract class NfcRepository {
  Future<Animal?> scanNfc();
  Future<void> finishScan();
}
