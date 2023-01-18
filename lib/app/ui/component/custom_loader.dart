import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_icons.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SvgPicture.asset(
          AppIcons.loaderIcon,
          color: color ?? AppColors.accent,
        ),
      ),
    );
  }
}
