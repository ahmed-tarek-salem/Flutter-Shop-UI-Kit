import 'dart:developer';

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

enum ErrorType {
  network,
  server,
  validation,
  unknown,
}

class ErrorHandler {
  static AppError handleError(Object? error) {
    log(error.toString());
    if (error.runtimeType == DioException) {
      switch ((error as DioException).type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return AppError('Connection Timeout', ErrorType.network);
        case DioExceptionType.badResponse:
          return AppError.serverErrorParse(error);
        case DioExceptionType.cancel:
          return AppError('Request Cancelled', ErrorType.network);
        case DioExceptionType.unknown:
        default:
          return AppError('Unexpected Error', ErrorType.unknown);
      }
    } else {
      return AppError(error.toString(), ErrorType.unknown);
    }
  }
}
