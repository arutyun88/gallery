import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/app/domain/entity/token_entity.dart';

part 'token_dto.g.dart';

@JsonSerializable()
class TokenDto {
  @JsonKey(name: 'access_token')
  final dynamic accessToken;
  @JsonKey(name: 'refresh_token')
  final dynamic refreshToken;
  @JsonKey(name: 'expires_in')
  final dynamic expiresIn;
  @JsonKey(name: 'token_type')
  final dynamic tokenType;
  final dynamic scope;

  TokenDto({
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.tokenType,
    this.scope,
  });

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);

  TokenEntity toEntity() => TokenEntity(
    accessToken: accessToken.toString(),
    refreshToken: refreshToken.toString(),
    expiresIn: expiresIn,
    tokenType: tokenType.toString(),
    scope: scope,
  );
}
