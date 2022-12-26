import 'package:temp_good_food/app/data/repository/repositorybase.dart';
import 'package:temp_good_food/app/data/repository/response_model.dart';
import 'package:temp_good_food/app/data/repository/url_api.dart';

class AddCustomerRepo extends Repository {
  AddCustomerRepo._();

  static final instance = AddCustomerRepo._();

  Future<ResponseModel<Map<String, dynamic>>> addCustomerRequest({
    required Map<String, dynamic> data,
  }) async {
    final response = await postMethod(
      url: urlGetUser,
      params: data,
      responseHeader: true,
    );
    if (response is ErrorModel) {
      return ResponseModel(errorModel: response);
    } else {
      return ResponseModelSuccess(data: response as Map<String, dynamic>);
    }
  }
}
