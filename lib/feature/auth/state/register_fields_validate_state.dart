part of 'register_fields_validate_bloc.dart';

abstract class RegisterFieldsValidateState {}

class RegisterFieldsInitState extends RegisterFieldsValidateState {}

class RegisterFieldsValidState extends RegisterFieldsValidateState {}

class RegisterFieldsInvalidState extends RegisterFieldsValidateState {}

class RegisterFieldsValidateErrorState extends RegisterFieldsValidateState {
  final String message;

  RegisterFieldsValidateErrorState(this.message);
}

class RegisterFieldsConfirmedState extends RegisterFieldsValidateState {}
