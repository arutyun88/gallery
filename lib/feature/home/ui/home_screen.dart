import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/routes/router.gr.dart';
import 'package:gallery/app/ui/component/custom_divider.dart';
import 'package:gallery/app/ui/component/custom_sheet_widget.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_icons.dart';
import 'package:gallery/app/ui/const/app_texts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRouter(children: [FeedRouter()]),
        HomeRouter(children: [ProfileRouter()]),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomDivider(),
            BottomNavigationBar(
              currentIndex: _currentChanged(tabsRouter.activeIndex),
              onTap: (index) => _onTapItem(context, index, tabsRouter),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.feedIcon,
                    color: tabsRouter.activeIndex == 0
                        ? AppColors.accent
                        : AppColors.subtitle,
                  ),
                  label: AppTexts.feedTitle,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.photoIcon),
                  label: AppTexts.photoTitle,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.profileIcon,
                    color: tabsRouter.activeIndex == 1
                        ? AppColors.accent
                        : AppColors.subtitle,
                  ),
                  label: AppTexts.profileTitle,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _onTapItem(BuildContext context, int index, TabsRouter tabsRouter) {
    if (index == 1) {
      showModalBottomSheet(
        backgroundColor: AppColors.transparent,
        context: context,
        builder: (context) => const CustomSheetWidget(),
      ).then(
        (value) {
          if (value != null) {
            context.navigateTo(AddPhotoRoute(fileName: value ?? ''));
          }
        },
      );
    } else if (index == 2) {
      tabsRouter.setActiveIndex(1);
    } else {
      tabsRouter.setActiveIndex(index);
    }
  }

  int _currentChanged(int index) => index == 1 ? 2 : 0;
}
