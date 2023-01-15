import 'package:flutter/material.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/ui/component/custom_button.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';

class ProfileSettingsOtherActionsWidget extends StatelessWidget {
  const ProfileSettingsOtherActionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CustomButton(
              padding: EdgeInsets.zero,
              type: ButtonType.text,
              onPressed: locator.get<AuthCubit>().logOut,
              title: AppTexts.signOutTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CustomButton(
              padding: EdgeInsets.zero,
              type: ButtonType.richText,
              onPressed: () {},
              richText: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.main.apply(
                        color: AppColors.accent,
                      ),
                  children: [
                    const TextSpan(text: AppTexts.canTitle),
                    TextSpan(
                      text: AppTexts.deleteTitle,
                      style: Theme.of(context).textTheme.main.apply(
                            color: AppColors.accent,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
