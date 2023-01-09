import 'package:temp_good_food/app/data/repository/database_repository/database_response.dart';
import 'package:temp_good_food/app/data/repository/repositorybase.dart';
import 'package:temp_good_food/app/data/repository/request.dart';
import 'package:temp_good_food/app/data/repository/response_model.dart';
import 'package:temp_good_food/app/data/repository/url_api.dart';

class DatabaseRepository extends Repository {
  DatabaseRepository._();

  static final instance = DatabaseRepository._();

  Future<ResponseModel<ResponseListDatabases>> getListDatabase(
      {int? customerId, required int page, required int size}) async {
    final response = await getMethod(
      url: urlGetDatabase,
      params: {
        'customerId': customerId ?? '',
        'page': page,
        'size': size,
      },
    );
    logger.d(response);
    if (response is ErrorModel) {
      return ResponseModel(errorModel: response);
    } else {
      return ResponseModelSuccess(
        data: ResponseListDatabases.fromJson(response as Map<String, dynamic>),
      );
    }
  }

  Future<ResponseModel<dynamic>> updateStatusDB(int databaseId, bool status) async {
    final response = await putMethod(
      url: status == true ? '/v1/databases/$databaseId/deactivate' : '/v1/databases/$databaseId/activate',
      responseHeader: true,
      params: {
        'id': databaseId,
      },
    );
    if (response is ErrorModel) {
      return ResponseModel(errorModel: response);
    } else
      return ResponseModelSuccess(data: response);
  }

  Future<ResponseModel<dynamic>> deleteDatabase(int databaseId) async {
    final response = await deleteMethod(
      url: '/v1/databases/$databaseId',
      responseHeader: true,
      params: {
        'id': databaseId,
      },
    );
    if (response is ErrorModel) {
      return ResponseModel(errorModel: response);
    } else
      return ResponseModelSuccess(data: response);
  }

  Future<ResponseModel<dynamic>> addDatabase(
    Map<String, dynamic> data,
  ) async {
    final response = await postMethod(
      url: '/v1/databases',
      responseHeader: true,
      data: data,
    );
    if (response is ErrorModel) {
      return ResponseModel(errorModel: response);
    } else
      return ResponseModelSuccess(data: response);
  }
}
