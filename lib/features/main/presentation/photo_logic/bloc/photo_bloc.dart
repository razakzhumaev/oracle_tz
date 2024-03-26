import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oracle_tz/features/main/data/model/photo_model.dart';
import 'package:oracle_tz/features/main/domain/use_case/photo_use_case.dart';
import 'package:oracle_tz/internal/helpers/catch_exception.dart';
part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoUseCase photoUseCase;
  PhotoBloc({required this.photoUseCase}) : super(PhotoInitialState()) {
    on<GetAllPhotosEvent>((event, emit) async {
      emit(PhotoLoadingState());

      try {
        List<PhotoModel> photoModelList = await photoUseCase.getAllPhotos();

        emit(PhotoLoadedState(photoModelList: photoModelList));
      } catch (e) {
        emit(PhotoErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
