import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oracle_tz/features/main/data/model/photo_model.dart';
import 'package:oracle_tz/features/main/domain/repository/photo_repository.dart';
import 'package:oracle_tz/internal/helpers/api_requester.dart';
import 'package:oracle_tz/internal/helpers/catch_exception.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  ApiRequester apiRequester = ApiRequester();
  List<PhotoModel> photoModelList = [];

  @override
  Future<List<PhotoModel>> getAllPhotos() async {
    try {
      Response response = await apiRequester.toGet('photos');

      debugPrint('response.statusCode == ${response.statusCode}');

      log(response.data.toString());

      if (response.statusCode == 200) {
        var dataList = response.data as List<dynamic>;
        photoModelList =
            dataList.map((json) => PhotoModel.fromJson(json)).toList();
        return photoModelList;
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
