import 'package:flutter/material.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';

class FeedTabBar extends StatelessWidget {
  const FeedTabBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.accent,
      indicatorWeight: 2.0,
      labelStyle: Theme.of(context).textTheme.title,
      unselectedLabelStyle: Theme.of(context).textTheme.title,
      labelColor: AppColors.accent,
      unselectedLabelColor: AppColors.subtitle,
      tabs: tabs,
    );
  }
}
