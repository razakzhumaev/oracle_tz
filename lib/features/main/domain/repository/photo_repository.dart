import 'package:oracle_tz/features/main/data/model/photo_model.dart';

abstract class PhotoRepository {
  Future<List<PhotoModel>> getAllPhotos();
}
