import 'package:gallery/app/domain/entity/account_create_entity.dart';
import 'package:gallery/app/domain/entity/token_entity.dart';

abstract class AuthRepository {
  Future<AccountCreateEntity> createAccount(AccountCreateEntity entity);

  Future<TokenEntity> logIn({
    required String username,
    required String password,
  });

  Future<TokenEntity> refreshToken(String refreshToken);
}
