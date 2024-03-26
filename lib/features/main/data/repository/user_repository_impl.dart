import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oracle_tz/features/main/data/model/user_model.dart';
import 'package:oracle_tz/features/main/domain/repository/user_repository.dart';
import 'package:oracle_tz/internal/helpers/api_requester.dart';
import 'package:oracle_tz/internal/helpers/catch_exception.dart';

class UserRepositoryImpl implements UserRepository {
  List<UserModel> userModelList = [];
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      Response response = await apiRequester.toGet('users');

      debugPrint('response.statusCode == ${response.statusCode}');

      if (response.statusCode == 200) {
        var dataList = response.data as List<dynamic>;
        userModelList =
            dataList.map((json) => UserModel.fromJson(json)).toList();

        return userModelList;
      }

      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
