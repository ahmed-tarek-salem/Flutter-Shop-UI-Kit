import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class AppError {
  final String message;
  final ErrorType type;
  final int? statusCode;

  AppError(this.message, this.type, {this.statusCode});

  @override
  String toString() =>
      'AppError(message: $message, type: $type, statusCode: $statusCode)';

  /// This consructor is used when the error comes from server (bad response).
  ///
  /// Here you can update it to handle server errors, according to the error model
  /// comes from back end.
  factory AppError.serverErrorParse(DioException error) {
    final serverMessage = error.response?.data['message'];
    return AppError("Server error: $serverMessage", ErrorType.server,
        statusCode: error.response?.statusCode);
  }
}

enum ErrorType { network, server, validation, unknown, format }

class ErrorHandler {
  static AppError handleError(Object? error) {
    log(error.toString());
    log(error.runtimeType.toString(), name: "Error type");
    switch (error) {
      case DioException dioError:
        switch (dioError.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            return AppError('Connection Timeout', ErrorType.network);
          case DioExceptionType.connectionError:
            return AppError(
                "Check internet connection and try again", ErrorType.network);
          case DioExceptionType.badResponse:
            return AppError.serverErrorParse(dioError);
          case DioExceptionType.cancel:
            return AppError('Request Cancelled', ErrorType.network);
          case DioExceptionType.unknown:
          default:
            return AppError('Unexpected Error', ErrorType.unknown);
        }

      case TypeError _:
        return AppError(
            "Couldn't parse the response, $error", ErrorType.format);

      case SocketException _:
        return AppError(
            "Check internet connection and try again", ErrorType.network);

      case TimeoutException _:
        return AppError("Connection Timeout", ErrorType.network);

      default:
        return AppError(error.toString(), ErrorType.unknown);
    }
  }
}
