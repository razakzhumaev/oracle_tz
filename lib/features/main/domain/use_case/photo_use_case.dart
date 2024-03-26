import 'package:oracle_tz/features/main/data/model/photo_model.dart';
import 'package:oracle_tz/features/main/domain/repository/photo_repository.dart';

class PhotoUseCase {
  final PhotoRepository photoRepository;

  PhotoUseCase({required this.photoRepository});

  Future<List<PhotoModel>> getAllPhotos() async =>
      await photoRepository.getAllPhotos();
}
