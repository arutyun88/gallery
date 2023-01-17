import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gallery/app/data/api/auth_interceptor.dart';
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
    _addInterceptor(AuthInterceptor());
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
  Future<Response> fetch(RequestOptions requestOptions) {
    try {
      return dio.fetch(requestOptions);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> createAccount(Map<String, dynamic> data) {
    try {
      return dio.post(AppApi.accountPath, data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getAccountWhenLogIn(String token) {
    try {
      dio.options.headers.addEntries(
        {'Authorization': 'Bearer $token'}.entries,
      );
      Future<Response> response = dio.get(AppApi.getAccountPath);
      dio.options.headers.removeWhere((key, value) => key == 'Authorization');
      return response;
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

  @override
  Future<Response> deleteAccount(int userId) {
    try {
      return dio.delete('${AppApi.accountPath}/$userId');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> updatePassword(int userId, Map<String, dynamic> data) {
    try {
      return dio.put('${AppApi.updatePasswordPath}/$userId', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> updateProfile(int userId, Map<String, dynamic> data) {
    try {
      return dio.put('${AppApi.accountPath}/$userId', data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> getPhotos(Map<String, dynamic> data) {
    try {
      return dio.get(AppApi.photosPath, queryParameters: data);
    } catch (_) {
      rethrow;
    }
  }
}
