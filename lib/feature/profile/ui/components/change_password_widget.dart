import 'package:flutter/material.dart';
import 'package:gallery/app/ui/component/custom_text_field.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({
    Key? key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmNewPasswordController,
    required this.oldPasswordChanged,
    required this.newPasswordChanged,
    required this.confirmNewPasswordChanged,
  }) : super(key: key);

  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmNewPasswordController;

  final Function(String) oldPasswordChanged;
  final Function(String) newPasswordChanged;
  final Function(String) confirmNewPasswordChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              AppTexts.changePassword,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextField(
              labelText: AppTexts.oldPassword,
              controller: oldPasswordController,
              obscure: true,
              onChanged: oldPasswordChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextField(
              labelText: AppTexts.newPassword,
              controller: newPasswordController,
              obscure: true,
              onChanged: newPasswordChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextField(
              labelText: AppTexts.confirmNewPassword,
              controller: confirmNewPasswordController,
              obscure: true,
              onChanged: confirmNewPasswordChanged,
            ),
          ),
        ],
      ),
    );
  }
}
