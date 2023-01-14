import 'package:gallery/app/data/dto/account_create_dto.dart';
import 'package:gallery/app/data/dto/token_dto.dart';
import 'package:gallery/app/data/field_key.dart';
import 'package:gallery/app/domain/app_api.dart';
import 'package:gallery/app/domain/entity/account_create_entity.dart';
import 'package:gallery/app/domain/entity/token_entity.dart';
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
  Future<AccountCreateEntity> createAccount(AccountCreateEntity entity) async {
    try {
      final createResult = await _api.createAccount(
        AccountCreateDto.toDto(entity).toJson(),
      );
      final account = AccountCreateDto.fromJson(createResult.data).toEntity();
      await logIn(username: entity.username, password: entity.password);
      return account;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenEntity> logIn({
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
      return TokenDto.fromJson(result.data).toEntity();
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
}
