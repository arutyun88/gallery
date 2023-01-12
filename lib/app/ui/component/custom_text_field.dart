import 'package:flutter/material.dart';
import 'package:gallery/app/ui/const/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.type = TextInputType.text,
    this.obscure = false,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final TextInputType type;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        autocorrect: false,
        obscureText: obscure,
        keyboardType: type,
        controller: controller,
        cursorHeight: 15,
        cursorColor: AppColors.accent,
        style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14.0),
          labelText: labelText,
        ),
      ),
    );
  }
}
