import 'package:oracle_tz/features/main/data/model/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getAllUsers();
}
