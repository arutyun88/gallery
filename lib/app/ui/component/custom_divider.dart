import 'package:flutter/material.dart';
import 'package:gallery/app/ui/const/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.width,
      color: AppColors.grayLight,
    );
  }
}
