import 'package:dio/dio.dart';

abstract class AppApi {
  static const String baseUrl = 'https://gallery.prod1.webant.ru';
  static const String accountPath = '/api/users';
  static const String getAccountPath = '/api/users/current';
  static const String tokenPath = '/oauth/v2/token';

  Future<Response> fetch(RequestOptions requestOptions);

  Future<Response> createAccount(Map<String, dynamic> data);

  Future<Response> deleteAccount(int userId);

  Future<Response> getAccountWhenLogIn(String token);

  Future<Response> token(Map<String, dynamic> data);
}
