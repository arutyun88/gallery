import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/domain/entity/user_entity.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_icons.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:intl/intl.dart';

class ProfileTitleWidget extends StatelessWidget {
  const ProfileTitleWidget({
    Key? key,
    required this.entity,
  }) : super(key: key);

  final UserEntity? entity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.grayLight,
            radius: 35,
            child: SvgPicture.asset(AppIcons.cameraIcon),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entity!.username,
                  style: Theme.of(context).textTheme.main,
                ),
                Text(
                  DateFormat(AppTexts.dateFormat).format(entity!.birthday),
                  style: Theme.of(context).textTheme.min.apply(
                        color: AppColors.subtitle,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
