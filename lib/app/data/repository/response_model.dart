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
  String? timeStamp;
  int? status;
  String? error;

  ErrorModel({this.timeStamp, this.status, this.error});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    timeStamp = json['timestamp'];
    status = json['status'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timeStamp;
    data['status'] = this.status;

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
