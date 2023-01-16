import 'package:gallery/app/data/dto/account_create_dto.dart';
import 'package:gallery/app/data/dto/token_dto.dart';
import 'package:gallery/app/data/field_key.dart';
import 'package:gallery/app/domain/app_api.dart';
import 'package:gallery/app/domain/entity/account_create_entity.dart';
import 'package:gallery/app/domain/entity/token_entity.dart';
import 'package:gallery/app/domain/entity/user_entity.dart';
import 'package:gallery/app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

const int userId = 17;
const String randomId = '2e4kftp98s2sgc88wskcsccwwo8kkkcssw4c0g00s0004kggwo';
const String secret = '2ef53x5qc7wgksc8cssso0kso884kccgcw0wsg8wc0w4scc4w8';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AppApi _api;

  AuthRepositoryImpl(this._api);

  @override
  Future<UserEntity> createAccount(AccountCreateEntity entity) async {
    try {
      final createResult = await _api.createAccount(
        AccountCreateDto.toDto(entity).toJson(),
      );
      final account = AccountCreateDto.fromJson(createResult.data).toEntity();
      final userToken = await logIn(
        username: entity.username,
        password: entity.password ?? '',
      );

      return UserEntity(
        id: account.id ?? -1,
        username: account.username,
        birthday: account.birthday,
        email: account.email,
        accessToken: userToken.accessToken,
        refreshToken: userToken.refreshToken,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> logIn({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _api.token(
        {
          FieldKey.username: username,
          FieldKey.password: password,
          FieldKey.clientId: '${userId}_$randomId',
          FieldKey.clientSecret: secret,
          FieldKey.grantType: FieldKey.password,
        },
      );
      final tokens = TokenDto.fromJson(result.data).toEntity();
      final accountResult = await _api.getAccountWhenLogIn(tokens.accessToken);
      final account = AccountCreateDto.fromJson(accountResult.data).toEntity();

      return UserEntity(
        id: account.id ?? -1,
        username: account.username,
        birthday: account.birthday,
        email: account.email,
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenEntity> refreshToken(String refreshToken) async {
    try {
      final result = await _api.token(
        {
          FieldKey.refreshToken: refreshToken,
          FieldKey.clientId: '${userId}_$randomId',
          FieldKey.clientSecret: secret,
          FieldKey.grantType: FieldKey.refreshToken,
        },
      );
      return TokenDto.fromJson(result.data).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAccount(int id) async {
    try {
      await _api.deleteAccount(id);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> updatePassword({
    required int id,
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await _api.updatePassword(
        id,
        {
          FieldKey.oldPassword: oldPassword,
          FieldKey.newPassword: newPassword,
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> updateProfile({
    required int id,
    String? username,
    DateTime? birthday,
    String? email,
  }) async {
    try {
      final Map<String, dynamic> data = {};
      if (username != null) {
        data.addEntries({FieldKey.username: username}.entries);
      }
      if (birthday != null) {
        data.addEntries(
            {FieldKey.birthday: birthday.toUtc().toIso8601String()}.entries);
      }
      if (email != null) {
        data.addEntries({FieldKey.email: email}.entries);
      }

      await _api.updateProfile(id, data);
    } catch (_) {
      rethrow;
    }
  }
}
