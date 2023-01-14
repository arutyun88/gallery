import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/entity/account_create_entity.dart';
import 'package:gallery/app/ui/component/custom_app_scaffold.dart';
import 'package:gallery/app/ui/component/custom_button.dart';
import 'package:gallery/app/ui/component/custom_text_field.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';
import 'package:gallery/feature/auth/state/register_fields_validate_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterFieldsValidateBloc(),
      child: const _RegisterScreen(),
    );
  }
}

class _RegisterScreen extends StatefulWidget {
  const _RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<_RegisterScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _birthdayController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _birthdayController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _birthdayController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) => state.whenOrNull(
        authorized: (entity) => Navigator.of(context).popUntil(
          (route) => route.isFirst,
        ),
      ),
      child: CustomAppScaffold(
        withAppBar: true,
        title: AppTexts.createAccountTitle,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                BlocBuilder<RegisterFieldsValidateBloc,
                    RegisterFieldsValidateState>(
                  builder: (context, state) {
                    if (state is RegisterFieldsValidateErrorState) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            const EdgeInsets.all(16.0).copyWith(bottom: 0.0),
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
                        labelText: AppTexts.usernameFieldLabel,
                        controller: _usernameController,
                      ),
                      CustomTextField(
                        onChanged: _fieldOnChanged,
                        labelText: AppTexts.birthdayFieldLabel,
                        controller: _birthdayController,
                        type: TextInputType.number,
                        isDate: true,
                      ),
                      CustomTextField(
                        onChanged: _fieldOnChanged,
                        labelText: AppTexts.emailFieldLabel,
                        controller: _emailController,
                        type: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        onChanged: _fieldOnChanged,
                        labelText: AppTexts.passwordFieldLabel,
                        controller: _passwordController,
                        obscure: true,
                      ),
                      CustomTextField(
                        onChanged: _fieldOnChanged,
                        labelText: AppTexts.passwordConfirmFieldLabel,
                        controller: _confirmPasswordController,
                        obscure: true,
                      ),
                    ],
                  ),
                ),
                BlocBuilder<RegisterFieldsValidateBloc,
                    RegisterFieldsValidateState>(
                  builder: (context, state) {
                    final enabled = state is RegisterFieldsValidState &&
                        state is! RegisterFieldsConfirmedState;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: CustomButton(
                        title: AppTexts.createAccountButtonTitle,
                        onPressed: enabled ? _onTapToCreate : null,
                        enabled: enabled,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapToCreate() {
    BlocProvider.of<RegisterFieldsValidateBloc>(context)
        .add(RegisterFieldConfirmedEvent());

    locator.get<AuthCubit>().createAccount(
          AccountCreateEntity(
            username: _usernameController.text,
            birthday: DateTime.parse(_birthdayController.text),
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
  }

  void _fieldOnChanged(String value) {
    BlocProvider.of<RegisterFieldsValidateBloc>(context).add(
      RegisterFieldChangeEvent(
        username: _usernameController.text,
        birthday: _birthdayController.text,
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      ),
    );
  }
}
