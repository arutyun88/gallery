import 'package:flutter/material.dart';
import 'package:gallery/app/ui/component/custom_app_scaffold.dart';
import 'package:gallery/app/ui/component/custom_button.dart';
import 'package:gallery/app/ui/component/custom_text_field.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:gallery/feature/auth/ui/register_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      withAppBar: true,
      title: AppTexts.logInTitle,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 30.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    labelText: AppTexts.emailLabel,
                    controller: _emailController,
                    type: TextInputType.emailAddress,
                  ),
                  CustomTextField(
                    labelText: AppTexts.passwordLabel,
                    controller: _passwordController,
                    obscure: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 26.0,
                left: 16.0,
                right: 16.0,
              ),
              child: CustomButton(
                onPressed: _logInOnPressed,
                title: AppTexts.logInButtonTitle,
              ),
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
    );
  }

  void _logInOnPressed() {}

  void _createAccountOnPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }
}
