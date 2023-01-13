// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenEntity _$$_TokenEntityFromJson(Map<String, dynamic> json) =>
    _$_TokenEntity(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: json['expiresIn'] as int,
      tokenType: json['tokenType'] as String,
      scope: json['scope'] as String?,
    );

Map<String, dynamic> _$$_TokenEntityToJson(_$_TokenEntity instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'tokenType': instance.tokenType,
      'scope': instance.scope,
    };
