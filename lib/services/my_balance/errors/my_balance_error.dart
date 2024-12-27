import 'package:dio/dio.dart';

class MyBalanceError {
  bool success;
  int code;
  String errorMessage;
  dynamic data;

  String get message {
    if (code == 422) {
      var validationError = data![0];

      if (validationError != null) {
        return validationError['message'];
      }
    }

    if (code == 500) {
      return "Falha de comunicação com a api";
    }

    if (code == 401) {
      return "Faça o login novamente!";
    }

    return errorMessage;
  }

  MyBalanceError({
    this.success = false,
    this.code = 500,
    this.errorMessage = "Serviço indisponível",
    this.data,
  });

  factory MyBalanceError.fromJson(Map<String, dynamic> json) {
    return MyBalanceError(
      success: json['success'],
      code: json['code'],
      errorMessage: json['message_error'],
      data: json['data'].cast<String, dynamic>(),
    );
  }

  factory MyBalanceError.fromException(DioError error) {
    Response? errorResponse = error.response;

    bool success = false;
    String? message = error.message;
    int code = 500;
    dynamic data;

    if (errorResponse != null && error.response!.statusCode != 503) {
      code = errorResponse.statusCode!;
      message = errorResponse.data['message_error'];
      data = errorResponse.data['data'];
      data = data is List ? data.toList() : data;
    }

    return MyBalanceError(
      success: success,
      code: code,
      errorMessage: message!,
      data: data,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> errorJson = <String, dynamic>{
      "success": success,
      "code": code,
      "message_error": errorMessage,
      "data": data
    };
    return errorJson;
  }
}
