import 'package:flutter/material.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';

class ProfileStatisticsWidget extends StatelessWidget {
  const ProfileStatisticsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppTexts.loadedTitle,
                style: Theme.of(context).textTheme.min,
              ),
              Text(
                '999+',
                style: Theme.of(context).textTheme.min.apply(
                      color: AppColors.subtitle,
                    ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppTexts.viewsTitle,
                  style: Theme.of(context).textTheme.min,
                ),
                Text(
                  '999+',
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
