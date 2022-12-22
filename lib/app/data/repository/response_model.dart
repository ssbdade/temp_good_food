class ResponseModel<T> {
  final T? data;
  final ErrorModel? errorModel;

  bool get hasError => errorModel != null;

  ResponseModel({this.errorModel, this.data});
}

class ResponseModelSuccess<T> extends ResponseModel<T> {
  ResponseModelSuccess({super.data});
}

enum ErrorType { TIME_OUT, NO_INTERNET, CANCELLED, UNKNOWN }

class ErrorModel {
  bool? success;
  int? code;
  String? message;

  ErrorType? type;
  dynamic data;
  String? error;

  ErrorModel({this.success, this.code, this.message, this.data, this.error});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  String? url;

  Data({this.url});

  Data.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
