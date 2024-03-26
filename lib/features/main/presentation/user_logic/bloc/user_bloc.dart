import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oracle_tz/features/main/data/model/user_model.dart';
import 'package:oracle_tz/features/main/domain/use_case/user_use_case.dart';
import 'package:oracle_tz/internal/helpers/catch_exception.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;

  UserBloc({required this.userUseCase}) : super(UserInitialState()) {
    on<GetAllUsersEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        List<UserModel> userModelList = await userUseCase.getAllUsers();

        emit(UserLoadedState(userModelList: userModelList));
      } catch (e) {
        emit(UserErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
