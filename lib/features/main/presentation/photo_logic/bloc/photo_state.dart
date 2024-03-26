part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitialState extends PhotoState {}

final class PhotoLoadingState extends PhotoState {}

final class PhotoLoadedState extends PhotoState {
  final List<PhotoModel> photoModelList;

  PhotoLoadedState({required this.photoModelList});
}

final class PhotoErrorState extends PhotoState {
  final CatchException error;

  PhotoErrorState({required this.error});
}
