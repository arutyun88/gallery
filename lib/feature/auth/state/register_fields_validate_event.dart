part of 'register_fields_validate_bloc.dart';

abstract class RegisterFieldsValidateEvent {}

class RegisterFieldChangeEvent extends RegisterFieldsValidateEvent {
  final String username;
  final String birthday;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterFieldChangeEvent({
    required this.email,
    required this.password,
    required this.username,
    required this.birthday,
    required this.confirmPassword,
  });
}

class RegisterFieldConfirmedEvent extends RegisterFieldsValidateEvent {}
