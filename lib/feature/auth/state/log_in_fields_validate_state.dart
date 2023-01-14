part of 'log_in_fields_validate_bloc.dart';

abstract class LogInFieldsValidateState {}

class LogInFieldsInitState extends LogInFieldsValidateState {}

class LogInFieldsValidState extends LogInFieldsValidateState {}

class LogInFieldsInvalidState extends LogInFieldsValidateState {}

class LogInFieldsValidateErrorState extends LogInFieldsValidateState {
  final String message;

  LogInFieldsValidateErrorState(this.message);
}

class LogInFieldsConfirmedState extends LogInFieldsValidateState {}
