import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/core/constants/app_endpoints.dart';

part 'network_service.g.dart';

class NetworkService {
  late final Dio dio;

  NetworkService() {
    _init();
  }
  _init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppEndpoints.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      ),
    );
    final logger = LogInterceptor(
      responseHeader: false,
      responseBody: true,
      requestBody: true,
    );
    dio.interceptors.add(logger);
    HttpOverrides.global = MyHttpOverrides();
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      url,
      queryParameters: {
        ...?query,
      },
    );
  }

  Future<Response<T>> postData<T>({
    required String url,
    Map<String, dynamic>? query,
    Object? data,
  }) async {
    return await dio.post<T>(
      url,
      data: data,
      queryParameters: query,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

@riverpod
NetworkService networkService(Ref ref) {
  final NetworkService networkService = NetworkService();
  return networkService;
}
