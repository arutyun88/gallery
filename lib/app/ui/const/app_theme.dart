import 'package:flutter/material.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';

import 'app_colors.dart';

abstract class AppTheme {
  const AppTheme._();

  static ThemeData theme = ThemeData(
    primaryColor: AppColors.white,
    backgroundColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      titleTextStyle: const TextTheme().main,
      iconTheme: const IconThemeData(color: AppColors.title),
      backgroundColor: AppColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextTheme().main.apply(color: AppColors.subtitle),
      floatingLabelStyle: const TextTheme().min.apply(color: AppColors.accent),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(width: 1.0, color: AppColors.accent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(width: 1.0, color: AppColors.grayLight),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(width: 1.0, color: AppColors.grayLight),
      ),
    ),
  );
}
