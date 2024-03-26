import 'package:oracle_tz/features/main/data/model/user_model.dart';
import 'package:oracle_tz/features/main/domain/repository/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<List<UserModel>> getAllUsers() async =>
      await userRepository.getAllUsers();
}
