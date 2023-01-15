import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/routes/router.gr.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRouter(children: [FeedRouter()]),
        HomeRouter(children: [ProfileRoute()]),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          backgroundColor: AppColors.white,
          currentIndex: _currentChanged(tabsRouter.activeIndex),
          onTap: (index) => _onTapItem(context, index, tabsRouter),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.feedIcon),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.photoIcon),
              label: 'Add photo',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.profileIcon),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }

  void _onTapItem(BuildContext context, int index, TabsRouter tabsRouter) {
    if (index == 1) {
      context.navigateTo(const PhotoRoute());
    } else if (index == 2) {
      tabsRouter.setActiveIndex(1);
    } else {
      tabsRouter.setActiveIndex(index);
    }
  }

  int _currentChanged(int index) => index == 1 ? 2 : 0;
}
