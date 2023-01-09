import 'package:temp_good_food/app/data/repository/header.dart';

import 'request.dart';

abstract class Repository {
  Request request = Request();

  Future<Object> postMethod({bool responseHeader = false, required String url, data, params}) async {
    return await request.requestApi(
      method: MethodType.POST,
      url: url,
      data: data,
      params: params,
      responseHeader: responseHeader,
    );
  }

  Future<Object> getMethod({required String url, data, params}) async {
    return await request.requestApi(
      method: MethodType.GET,
      url: url,
      data: data,
      params: params,
    );
  }

  Future<Object> putMethod({bool responseHeader = false, required String url, data, params}) async {
    return await request.requestApi(
      method: MethodType.PUT,
      url: url,
      data: data,
      params: params,
      responseHeader: responseHeader,
    );
  }

  Future<Object> deleteMethod({bool responseHeader = false, required String url, data, params}) async {
    return await request.requestApi(
      method: MethodType.DELETE,
      url: url,
      data: data,
      params: params,
      responseHeader: responseHeader,
    );
  }

  Map<String, dynamic> responseToMap(Object response) {
    return response as Map<String, dynamic>;
  }

  Map<String, dynamic> getJsonData(Map<String, dynamic> json) {
    return json['data'];
  }
}
