import 'package:dio/dio.dart';
import 'package:revbank/core/exceptions/exceptions.dart';

abstract mixin class FailureV2 {
  String get message;

  String get title;

  bool get isInternetConnectionError =>
      runtimeType is NoInternetConnectionException;

  getMessagefromServer(Map error) {
    // checking the error format
    // so i can apporpriately get the error message
    // Note: input errors are different from normal error
    late String errorMessage;
    //input error test
    if (error.containsKey("errors")) {
      //get the first error model in the list then
      //the msg of the error
      errorMessage = error["errors"][0]["msg"];
    }
    // normal error test
    else if (error.containsKey("message")) {
      errorMessage = error["message"];
    } //default
    else {
      errorMessage = "Error";
    }
    return errorMessage;
  }
}

class ServerFailure with FailureV2 {
  @override
  final String message;

  @override
  final String title;

  final RequestOptions? requestOptions; // keep request details

  ServerFailure({
    required this.message,
    this.title = "Server Error",
    this.requestOptions,
  });
}
