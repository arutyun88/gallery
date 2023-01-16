import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_icons.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';

class ProfileSettingsTitleWidget extends StatelessWidget {
  const ProfileSettingsTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CircleAvatar(
              backgroundColor: AppColors.grayLight,
              radius: 50,
              child: SvgPicture.asset(AppIcons.cameraIcon, height: 42),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              AppTexts.photoUploadTitle,
              style: Theme.of(context).textTheme.min.apply(
                    color: AppColors.subtitle,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
