import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/ui/component/custom_app_scaffold.dart';
import 'package:gallery/app/ui/component/custom_button.dart';
import 'package:gallery/app/ui/component/custom_text_field.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';
import 'package:gallery/feature/auth/state/log_in_fields_validate_bloc.dart';
import 'package:gallery/feature/auth/ui/register_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInFieldsValidateBloc(),
      child: const _LogInScreen(),
    );
  }
}

class _LogInScreen extends StatefulWidget {
  const _LogInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<_LogInScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) => state.whenOrNull(
        authorized: (entity) => Navigator.of(context).pop(),
      ),
      child: CustomAppScaffold(
        withAppBar: true,
        title: AppTexts.logInTitle,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    BlocBuilder<LogInFieldsValidateBloc,
                        LogInFieldsValidateState>(
                      builder: (context, state) {
                        if (state is LogInFieldsValidateErrorState) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16.0).copyWith(bottom: 0.0),
                            child: Text(
                              state.message,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.main.apply(
                                    color: AppColors.accent,
                                  ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextField(
                            onChanged: _fieldOnChanged,
                            labelText: AppTexts.usernameLabel,
                            controller: _usernameController,
                            type: TextInputType.emailAddress,
                          ),
                          CustomTextField(
                            onChanged: _fieldOnChanged,
                            labelText: AppTexts.passwordLabel,
                            controller: _passwordController,
                            obscure: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<LogInFieldsValidateBloc, LogInFieldsValidateState>(
                builder: (context, state) {
                  final enabled = state is LogInFieldsValidState &&
                      state is! LogInFieldsConfirmedState;
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 26.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: CustomButton(
                      title: AppTexts.logInButtonTitle,
                      onPressed: enabled ? _logInOnPressed : null,
                      enabled: enabled,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 40.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: CustomButton(
                  onPressed: _createAccountOnPressed,
                  title: AppTexts.createAccountButtonTitle,
                  type: ButtonType.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logInOnPressed() {
    BlocProvider.of<LogInFieldsValidateBloc>(context)
        .add(LogInFieldConfirmedEvent());

    locator.get<AuthCubit>().logIn(
          username: _usernameController.text,
          password: _passwordController.text,
        );
  }

  void _createAccountOnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }

  void _fieldOnChanged(String value) {
    BlocProvider.of<LogInFieldsValidateBloc>(context).add(
      LogInFieldChangeEvent(
        username: _usernameController.text,
        password: _passwordController.text,
      ),
    );
  }
}
