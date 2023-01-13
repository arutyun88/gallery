import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gallery/app/domain/app_api.dart';
import 'package:gallery/app/domain/app_config.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@Singleton(as: AppApi)
class AppApiDio extends AppApi {
  late final Dio dio;

  AppApiDio(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      connectTimeout: 15000,
    );
    dio = Dio(options);
    if (kDebugMode) _addInterceptor(PrettyDioLogger());
  }

  void _addInterceptor(Interceptor interceptor) {
    if (dio.interceptors.contains(interceptor)) {
      dio.interceptors.remove(interceptor);
    }
    _deleteInterceptor(interceptor.runtimeType);
    dio.interceptors.add(interceptor);
  }

  void _deleteInterceptor(Type type) {
    dio.interceptors.removeWhere((element) => element.runtimeType == type);
  }

  @override
  Future<Response> createAccount(Map<String, dynamic> data) {
    try {
      return dio.post(AppApi.createAccountPath, data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> token(Map<String, dynamic> data) {
    try {
      return dio.get(AppApi.tokenPath, queryParameters: data);
    } catch (_) {
      rethrow;
    }
  }
}
