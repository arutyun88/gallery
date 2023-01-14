part of 'log_in_fields_validate_bloc.dart';

abstract class LogInFieldsValidateEvent {}

class LogInFieldChangeEvent extends LogInFieldsValidateEvent {
  final String username;
  final String password;

  LogInFieldChangeEvent({
    required this.password,
    required this.username,
  });
}

class LogInFieldConfirmedEvent extends LogInFieldsValidateEvent {}
