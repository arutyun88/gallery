import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_entity.freezed.dart';

@freezed
class TokenEntity with _$TokenEntity {
  const factory TokenEntity({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
    required String tokenType,
    required String? scope,
  }) = _TokenEntity;
}
