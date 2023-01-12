import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/app/domain/entity/account_create_entity.dart';

part 'account_create_dto.g.dart';

@JsonSerializable()
class AccountCreateDto {
  final dynamic id;
  final dynamic username;
  final dynamic birthday;
  final dynamic email;
  final dynamic password;

  AccountCreateDto({
    this.id,
    this.username,
    this.birthday,
    this.email,
    this.password,
  });

  factory AccountCreateDto.fromJson(Map<String, dynamic> json) =>
      _$AccountCreateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountCreateDtoToJson(this);

  factory AccountCreateDto.toDto(AccountCreateEntity entity) =>
      AccountCreateDto(
        email: entity.email.toString(),
        username: entity.username.toString(),
        password: entity.password.toString(),
        birthday: entity.birthday.toUtc().toIso8601String(),
      );

  AccountCreateEntity toEntity() => AccountCreateEntity(
        id: id,
        username: username.toString(),
        email: email.toString(),
        password: password.toString(),
        birthday: DateTime.parse(birthday.toString()).toLocal(),
      );
}
