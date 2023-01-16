import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/ui/component/custom_button.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_icons.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';

class DeleteDialogWidget extends StatelessWidget {
  const DeleteDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(17.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${AppTexts.deleteAccount}?',
                    style: Theme.of(context).textTheme.title.apply(
                          color: AppColors.title,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      AppTexts.deleteAccountDescription,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.main.apply(
                            color: AppColors.subtitle,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 10.0,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CustomButton(
                            title: AppTexts.cancel,
                            type: ButtonType.transparent,
                            onPressed: Navigator.of(context).pop,
                          ),
                        ),
                        CustomButton(
                          title: AppTexts.deleteAccount,
                          onPressed: () => _onTapToDelete(context),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapToDelete(BuildContext context) {
    locator.get<AuthCubit>().deleteAccount().whenComplete(
      () {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding: const EdgeInsets.all(16.0),
            backgroundColor: AppColors.title,
            content: Row(
              children: [
                SvgPicture.asset(AppIcons.infoIcon),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    AppTexts.deletedAccount,
                    style: Theme.of(context).textTheme.main.apply(
                          color: AppColors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
