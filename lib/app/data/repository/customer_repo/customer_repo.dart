import 'package:temp_good_food/app/data/repository/repositorybase.dart';
import 'package:temp_good_food/app/data/repository/url_api.dart';

import '../response_model.dart';

class CustomerRepo extends Repository {
  CustomerRepo._();

  static final instance = CustomerRepo._();

  Future<ResponseModel<Map<String, dynamic>>> userRequest({
    required Map<String, dynamic> data,
  }) async {
    final response = await getMethod(
      url: urlGetUser,
      params: data,
    );
    if (response is ErrorModel) {
      return ResponseModel(errorModel: response);
    } else {
      return ResponseModelSuccess(data: response as Map<String, dynamic>);
    }
  }
}
