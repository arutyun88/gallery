import 'package:flutter/material.dart';
import 'package:gallery/app/ui/const/app_colors.dart';

extension AppTextStyle on TextTheme {
  TextStyle get title => const TextStyle(
        fontSize: 20.0,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      );

  TextStyle get main => const TextStyle(
        fontSize: 15.0,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      );

  TextStyle get min => const TextStyle(
        fontSize: 12.0,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      );
}
