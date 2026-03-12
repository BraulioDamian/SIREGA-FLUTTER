import 'package:sirega_app/features/nfc_scanning/data/services/animal_database_service.dart';
import 'package:sirega_app/core/models/animal_model.dart';

class FindAnimalByUidUseCase {
  final AnimalDatabaseService _dbService;

  FindAnimalByUidUseCase(this._dbService);

  Future<Animal?> execute(String uid) {
    return _dbService.findAnimalByNfcId(uid);
  }
}
