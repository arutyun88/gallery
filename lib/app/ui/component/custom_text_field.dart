import 'package:flutter/material.dart';
import 'package:gallery/app/ui/component/date_text_formatter.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.type = TextInputType.text,
    this.obscure = false,
    required this.onChanged,
    this.isDate = false,
    this.suffixIcon,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final TextInputType type;
  final bool obscure;
  final Function(String) onChanged;
  final bool isDate;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        inputFormatters: isDate ? [DateTextFormatter()] : null,
        onChanged: onChanged,
        autocorrect: false,
        obscureText: obscure,
        keyboardType: type,
        controller: controller,
        cursorHeight: 15,
        cursorColor: AppColors.accent,
        style: Theme.of(context).textTheme.main,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14.0),
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
