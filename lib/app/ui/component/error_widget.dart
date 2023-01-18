import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_icons.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(flex: 3),
          SvgPicture.asset(AppIcons.errorIcon),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppTexts.errorTitle,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .apply(color: AppColors.title),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    AppTexts.errorText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .min
                        .apply(color: AppColors.subtitle),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 7),
        ],
      ),
    );
  }
}
