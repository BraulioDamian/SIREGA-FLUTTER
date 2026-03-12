import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

class AnimalDatabaseService {
  final IsarService _isarService;

  AnimalDatabaseService(this._isarService);

  Future<Animal?> findAnimalByNfcId(String nfcId) {
    return _isarService.getAnimalByNfc(nfcId);
  }
}
