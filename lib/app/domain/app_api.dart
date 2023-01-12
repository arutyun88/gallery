import 'package:dio/dio.dart';

abstract class AppApi {
  static const String baseUrl = 'https://gallery.prod1.webant.ru';
  static const String createAccountPath = '/api/users';
}
