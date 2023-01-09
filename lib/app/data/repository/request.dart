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

enum MethodType { GET, POST, PUT, DELETE }

Map<MethodType, String> methods = {
  MethodType.GET: "GET",
  MethodType.POST: "POST",
  MethodType.PUT: "PUT",
  MethodType.DELETE: "DELETE",
};

class Request {
  Dio _dio = Dio();

  Request({String? base}) {
    if (base == null) base = environment.apiUrl;
    // print(environment.apiUrl);
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
    bool responseHeader = false,
  }) async {
    // Logger.info("URL: " + url + "\n" + "body: " + data.toString());
    log('URL: $url');
    log('Data');
    logger.d(data);
    log('Param');
    logger.d(params);
    logger.d(AppToken.instance.header());
    try {
      var response = await _dio.request(
        url,
        data: data,
        queryParameters: params,
        options: Options(
          method: methods[method],
          headers: header ?? AppToken.instance.header(),
        ),
      );
      return responseHeader ? response.headers.map : response.data;
    } catch (e) {
      inspect(e);
      return handleError(e);
    }
  }

  Future<ErrorModel> handleError(dynamic error) async {
    ErrorModel errorModel = ErrorModel();
    if (error is DioError) {
      logger.e(error.response?.data);
      try {
        // errorModel.type = ErrorType.UNKNOWN;
        // errorModel.description = error.response!.data ?? errorModel.description;
        errorModel = ErrorModel.fromJson(error as Map<String, dynamic>);
      } catch (e, trace) {
        // Logger.error(trace.toString());
      }
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
