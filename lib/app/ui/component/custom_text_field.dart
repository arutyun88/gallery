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
    this.isMultiline = false,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final TextInputType type;
  final bool obscure;
  final Function(String) onChanged;
  final bool isDate;
  final Widget? suffixIcon;
  final bool isMultiline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        maxLines: isMultiline ? 5 : 1,
        inputFormatters: isDate ? [DateTextFormatter()] : null,
        onChanged: onChanged,
        autocorrect: false,
        obscureText: obscure,
        keyboardType: isMultiline ? TextInputType.multiline : type,
        controller: controller,
        cursorHeight: 15,
        cursorColor: AppColors.accent,
        style: Theme.of(context).textTheme.main,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.all(14.0),
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
