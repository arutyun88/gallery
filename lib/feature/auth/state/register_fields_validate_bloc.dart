import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/ui/const/app_reg_exp.dart';
import 'package:gallery/app/ui/const/app_texts.dart';

part 'register_fields_validate_event.dart';

part 'register_fields_validate_state.dart';

class RegisterFieldsValidateBloc
    extends Bloc<RegisterFieldsValidateEvent, RegisterFieldsValidateState> {
  RegisterFieldsValidateBloc() : super(RegisterFieldsInitState()) {
    on<RegisterFieldChangeEvent>((event, emit) {
      final date = DateTime.tryParse(event.birthday);
      if (event.username.isNotEmpty && event.username.trim().isEmpty) {
        emit(RegisterFieldsValidateErrorState(AppTexts.notValidUsername));
      } else if (event.birthday.isNotEmpty && date == null) {
        emit(RegisterFieldsValidateErrorState(AppTexts.notValidBirthday));
      } else if (event.email.isNotEmpty && !event.email.validateEmail()) {
        emit(RegisterFieldsValidateErrorState(AppTexts.notValidEmail));
      } else if (event.password.isNotEmpty &&
          !event.password.validatePassword()) {
        emit(RegisterFieldsValidateErrorState(AppTexts.notValidPassword));
      } else if (event.password.isNotEmpty &&
          event.password != event.confirmPassword) {
        emit(
            RegisterFieldsValidateErrorState(AppTexts.notValidConfirmPassword));
      } else if (event.username.isEmpty ||
          event.birthday.isEmpty ||
          event.email.isEmpty ||
          event.password.isEmpty ||
          event.confirmPassword.isEmpty) {
        emit(RegisterFieldsInvalidState());
      } else {
        emit(RegisterFieldsValidState());
      }
    });
    on<RegisterFieldConfirmedEvent>(
      (event, emit) => emit(RegisterFieldsConfirmedState()),
    );
  }
}
