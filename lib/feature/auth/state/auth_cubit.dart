import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/app/domain/entity/account_create_entity.dart';
import 'package:gallery/app/domain/entity/error_entity.dart';
import 'package:gallery/app/domain/entity/user_entity.dart';
import 'package:gallery/app/domain/repository/auth_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

part 'auth_cubit.g.dart';

@Singleton()
class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthState.notAuthorized());

  final AuthRepository authRepository;

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    try {
      emit(AuthState.waiting());
      try {
        final result = await authRepository.logIn(
          username: username,
          password: password,
        );
        emit(AuthState.authorized(result));
      } catch (error, stackTrace) {
        addError(error, stackTrace);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<void> createAccount(AccountCreateEntity entity) async {
    try {
      emit(AuthState.waiting());
      try {
        final result = await authRepository.createAccount(entity);
        emit(AuthState.authorized(result));
      } catch (error, stackTrace) {
        addError(error, stackTrace);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<void> refreshToken() async {
    try {
      final entity = state.whenOrNull(authorized: (entity) => entity);
      if (entity != null) {
        final tokens = await authRepository.refreshToken(entity.refreshToken);
        final newEntity = entity.copyWith(
          accessToken: tokens.accessToken,
          refreshToken: tokens.refreshToken,
        );
        emit(AuthState.authorized(newEntity));
      } else {
        logOut();
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> deleteAccount() async {
    try {
      final id = state.whenOrNull(authorized: (entity) => entity.id);
      if (id != null) {
        await authRepository.deleteAccount(id);
        emit(AuthState.notAuthorized());
      } else {
        logOut();
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  void logOut() => emit(AuthState.notAuthorized());

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state
            .whenOrNull(
              authorized: (entity) => AuthState.authorized(entity),
            )
            ?.toJson() ??
        AuthState.notAuthorized().toJson();
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(AuthState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
