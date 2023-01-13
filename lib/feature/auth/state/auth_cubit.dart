import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallery/app/domain/entity/error_entity.dart';
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
        await authRepository.logIn(username: username, password: password);
        emit(AuthState.authorized());
      } catch (error, stackTrace) {
        addError(error, stackTrace);
      }
    } catch (_) {
      rethrow;
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
              authorized: () => AuthState.authorized(),
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
