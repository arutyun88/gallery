// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_create_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountCreateDto _$AccountCreateDtoFromJson(Map<String, dynamic> json) =>
    AccountCreateDto(
      id: json['id'],
      username: json['username'],
      birthday: json['birthday'],
      email: json['email'],
      password: json['password'],
    );

Map<String, dynamic> _$AccountCreateDtoToJson(AccountCreateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'birthday': instance.birthday,
      'email': instance.email,
      'password': instance.password,
    };
