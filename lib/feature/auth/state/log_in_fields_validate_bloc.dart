import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/ui/const/app_reg_exp.dart';
import 'package:gallery/app/ui/const/app_texts.dart';

part 'log_in_fields_validate_event.dart';

part 'log_in_fields_validate_state.dart';

class LogInFieldsValidateBloc
    extends Bloc<LogInFieldsValidateEvent, LogInFieldsValidateState> {
  LogInFieldsValidateBloc() : super(LogInFieldsInitState()) {
    on<LogInFieldChangeEvent>((event, emit) {
      if (event.username.isNotEmpty && event.username.trim().isEmpty) {
        emit(LogInFieldsValidateErrorState(AppTexts.notValidUsername));
      } else if (event.password.isNotEmpty &&
          !event.password.validatePassword()) {
        emit(LogInFieldsValidateErrorState(AppTexts.notValidPassword));
      } else if (event.username.isEmpty ||
          event.username.isEmpty ||
          event.password.isEmpty) {
        emit(LogInFieldsInvalidState());
      } else {
        emit(LogInFieldsValidState());
      }
    });
    on<LogInFieldConfirmedEvent>(
      (event, emit) => emit(LogInFieldsConfirmedState()),
    );
  }
}
