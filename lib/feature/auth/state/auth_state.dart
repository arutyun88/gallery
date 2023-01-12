part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.notAuthorized() = _AuthStateNotAuthorized;

  factory AuthState.authorized() = _AuthStateAuthorized;

  factory AuthState.waiting() = _AuthStateWaiting;

  factory AuthState.error() = _AuthStateError;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
