import 'package:flutter/material.dart';
import 'package:gallery/app/ui/component/custom_text_field.dart';
import 'package:gallery/app/ui/const/app_texts.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    Key? key,
    required this.usernameController,
    required this.birthdayController,
    required this.emailController,
    required this.usernameChanged,
    required this.birthdayChanged,
    required this.emailChanged,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController birthdayController;
  final TextEditingController emailController;

  final Function(String) usernameChanged;
  final Function(String) birthdayChanged;
  final Function(String) emailChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextField(
              labelText: AppTexts.usernameFieldLabel,
              controller: usernameController,
              onChanged: usernameChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextField(
              labelText: AppTexts.birthdayFieldLabel,
              controller: birthdayController,
              onChanged: birthdayChanged,
              type: TextInputType.number,
              isDate: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextField(
              labelText: AppTexts.emailFieldLabel,
              controller: emailController,
              onChanged: emailChanged,
              type: TextInputType.emailAddress,
            ),
          ),
        ],
      ),
    );
  }
}
