import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:temp_good_food/app/data/repository/repositorybase.dart';
import 'package:temp_good_food/app/data/repository/response_model.dart';
import 'package:temp_good_food/app/data/repository/url_api.dart';

class LoginRepository extends Repository {
  LoginRepository._();

  static final instance = LoginRepository._();

  Future<ResponseModel<Map<String, dynamic>>> loginRequest({
    required Map<String, dynamic> data,
  }) async {
    final response = await postMethod(
      url: urlLogin,
      data: data,
      responseHeader: true,
    );
    if (response is ErrorModel) {
      return ResponseModel(errorModel: response);
    } else {
      return ResponseModelSuccess(data: response as Map<String, dynamic>);
    }
  }
}
