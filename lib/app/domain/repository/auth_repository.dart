import 'package:gallery/app/domain/entity/account_create_entity.dart';

abstract class AuthRepository {
  Future<AccountCreateEntity> createAccount(AccountCreateEntity entity);
}