import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_create_entity.freezed.dart';

@freezed
class AccountCreateEntity with _$AccountCreateEntity {
  const factory AccountCreateEntity({
    required int id,
    required String username,
    required DateTime birthday,
    required String email,
    required String password,
  }) = _AccountCreateEntity;
}
