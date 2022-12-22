import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:temp_good_food/app/data/repository/header.dart';
import 'package:temp_good_food/app/data/repository/response_model.dart';

import 'url_api.dart';

abstract class Constants {
  static const contentType = "application/json";
}

Logger logger = Logger();

enum MethodType { GET, POST, PATCH, DELETE }

Map<MethodType, String> methods = {
  MethodType.GET: "GET",
  MethodType.POST: "POST",
  MethodType.PATCH: "PATCH",
  MethodType.DELETE: "DELETE",
};

class Request {
  Dio _dio = Dio();

  Request({String? base}) {
    if (base == null) base = environment.apiUrl;
    _dio = Dio(BaseOptions(
        baseUrl: base,
        receiveTimeout: environment.receiveTimeout,
        connectTimeout: environment.connectTimeout,
        contentType: Constants.contentType));
  }

  Future<Object> requestApi({
    required MethodType method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
  }) async {
    // Logger.info("URL: " + url + "\n" + "body: " + data.toString());
    log('Data');
    logger.d(data);
    log('Param');
    logger.d(params);
    try {
      var response = await _dio.request(
        url,
        data: data,
        queryParameters: params,
        options: Options(method: methods[method], headers: header ?? AppToken.instance.header()),
      );

      return response.data;
    } catch (e) {
      return handleError(e);
    }
  }

  Future<ErrorModel> handleError(dynamic error) async {
    ErrorModel errorModel = ErrorModel();
    errorModel.message = error.toString();
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          errorModel.type = ErrorType.TIME_OUT;
          errorModel.message = LocaleKeys.request_send_timeout;
          break;
        case DioErrorType.connectTimeout:
          errorModel.type = ErrorType.TIME_OUT;
          errorModel.message = LocaleKeys.request_connect_timeout;
          break;
        case DioErrorType.receiveTimeout:
          errorModel.type = ErrorType.TIME_OUT;
          errorModel.message = LocaleKeys.request_receive_timeout;
          break;
        case DioErrorType.cancel:
          errorModel.type = ErrorType.CANCELLED;
          errorModel.message = LocaleKeys.request_cancelled;
          break;
        case DioErrorType.other:
          errorModel.type = ErrorType.NO_INTERNET;
          errorModel.message = LocaleKeys.no_internet;
          break;
        case DioErrorType.response:
          logger.e(error.response?.data);
          try {
            errorModel.type = ErrorType.UNKNOWN;
            // errorModel.description = error.response!.data ?? errorModel.description;
            errorModel = ErrorModel.fromJson(error.response?.data ?? {});
          } catch (e, trace) {
            // Logger.error(trace.toString());
          }
          break;
      }
    }
    if (errorModel.code == 401) {
      // CommonUtil.showToast("Lỗi!");
    }
    return errorModel;
  }
}

abstract class LocaleKeys {
  static const not_found = "Not found.";
  static const error = "Error";
  static const unknown_error = "Unknown_error";
  //error description
  static const request_send_timeout = "request_send_timeout";
  static const request_cancelled = "request_cancelled";
  static const request_connect_timeout = "request_connect_timeout";
  static const no_internet = "no_internet";
  static const request_receive_timeout = "request_receive_timeout";
}
