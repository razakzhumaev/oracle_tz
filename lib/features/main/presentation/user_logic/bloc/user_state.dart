part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitialState extends UserState {}

final class UserLoadedState extends UserState {
  final List<UserModel> userModelList;

  UserLoadedState({required this.userModelList});
}

final class UserLoadingState extends UserState {}

final class UserErrorState extends UserState {
  final CatchException error;

  UserErrorState({required this.error});
}
