import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  const AppTheme._();

  static ThemeData theme = ThemeData(
    primaryColor: AppColors.white,
    backgroundColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      titleTextStyle: TextStyle(color: AppColors.black),
      iconTheme: IconThemeData(color: AppColors.title),
      backgroundColor: AppColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: AppColors.subtitle,
      ),
      floatingLabelStyle: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: AppColors.accent,
      ),
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
