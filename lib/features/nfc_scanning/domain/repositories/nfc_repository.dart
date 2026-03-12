import 'package:sirega_app/core/models/animal_model.dart';

abstract class NfcRepository {
  Future<Animal?> scanNfc();
  Future<void> finishScan();
}
