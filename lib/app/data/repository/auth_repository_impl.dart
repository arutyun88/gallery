import 'package:gallery/app/data/dto/account_create_dto.dart';
import 'package:gallery/app/domain/app_api.dart';
import 'package:gallery/app/domain/entity/account_create_entity.dart';
import 'package:gallery/app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppApi _api;

  AuthRepositoryImpl(this._api);

  @override
  Future<AccountCreateEntity> createAccount(AccountCreateEntity entity) async {
    try {
      final result = await _api.createAccount(
        AccountCreateDto.toDto(entity).toJson(),
      );
      return AccountCreateDto.fromJson(result.data).toEntity();
    } catch (_) {
      rethrow;
    }
  }
}
