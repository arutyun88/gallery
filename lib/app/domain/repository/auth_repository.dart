import 'package:gallery/app/domain/entity/account_create_entity.dart';
import 'package:gallery/app/domain/entity/token_entity.dart';
import 'package:gallery/app/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> createAccount(AccountCreateEntity entity);

  Future<void> deleteAccount(int id);

  Future<UserEntity> logIn({
    required String username,
    required String password,
  });

  Future<TokenEntity> refreshToken(String refreshToken);
}
