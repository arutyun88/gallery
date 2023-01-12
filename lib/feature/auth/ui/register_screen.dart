import 'package:flutter/material.dart';
import 'package:gallery/app/ui/component/custom_app_scaffold.dart';
import 'package:gallery/app/ui/component/custom_button.dart';
import 'package:gallery/app/ui/component/custom_text_field.dart';
import 'package:gallery/app/ui/const/app_texts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    return CustomAppScaffold(
      withAppBar: true,
      title: AppTexts.createAccountTitle,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      labelText: AppTexts.usernameFieldLabel,
                      controller: _usernameController,
                    ),
                    CustomTextField(
                      labelText: AppTexts.birthdayFieldLabel,
                      controller: _birthdayController,
                      type: TextInputType.number,
                    ),
                    CustomTextField(
                      labelText: AppTexts.emailFieldLabel,
                      controller: _emailController,
                      type: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      labelText: AppTexts.passwordFieldLabel,
                      controller: _passwordController,
                      obscure: true,
                    ),
                    CustomTextField(
                      labelText: AppTexts.passwordConfirmFieldLabel,
                      controller: _confirmPasswordController,
                      obscure: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: CustomButton(
                  title: AppTexts.createAccountButtonTitle,
                  onPressed: _onTapToCreate,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapToCreate() {}
}
