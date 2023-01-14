import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_entity.freezed.dart';

part 'error_entity.g.dart';

@freezed
class ErrorEntity with _$ErrorEntity {
  const factory ErrorEntity({
    required String message,
  }) = _ErrorEntity;

  factory ErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorEntityFromJson(json);

  factory ErrorEntity.fromException(dynamic error) {
    if (error is ErrorEntity) return error;

    if (error is DioError) {
      try {
        return ErrorEntity(message: error.response?.data['error_description']);
      } catch (_) {
        try {
          return ErrorEntity(
            message: error.response?.data['detail'],
          );
        } catch (_) {}
        return const ErrorEntity(message: 'Unknown error');
      }
    }
    return const ErrorEntity(message: 'Unknown error');
  }
}
