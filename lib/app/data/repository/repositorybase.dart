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

  Future<Object> putMethod({required String url, data, params}) async {
    return await request.requestApi(
      method: MethodType.PATCH,
      url: url,
      data: data,
      params: params,
    );
  }

  Map<String, dynamic> responseToMap(Object response) {
    return response as Map<String, dynamic>;
  }

  Map<String, dynamic> getJsonData(Map<String, dynamic> json) {
    return json['data'];
  }
}
