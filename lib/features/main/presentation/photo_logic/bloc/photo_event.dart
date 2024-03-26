part of 'photo_bloc.dart';

@immutable
sealed class PhotoEvent {}

class GetAllPhotosEvent extends PhotoEvent {}
