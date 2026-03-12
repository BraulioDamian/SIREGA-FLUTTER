import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/services/isar_service.dart';

class AnimalDatabaseService {
  final IsarService _isarService;

  AnimalDatabaseService(this._isarService);

  Future<Animal?> findAnimalByNfcId(String nfcId) {
    return _isarService.getAnimalByNfc(nfcId);
  }
}
