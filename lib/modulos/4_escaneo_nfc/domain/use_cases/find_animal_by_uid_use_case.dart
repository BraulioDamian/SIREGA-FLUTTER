import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/animal_database_service.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';

class FindAnimalByUidUseCase {
  final AnimalDatabaseService _dbService;

  FindAnimalByUidUseCase(this._dbService);

  Future<Animal?> execute(String uid) {
    return _dbService.findAnimalByNfcId(uid);
  }
}
