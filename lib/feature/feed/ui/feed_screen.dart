import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/repository/photo_repository.dart';
import 'package:gallery/app/ui/component/custom_text_field.dart';
import 'package:gallery/app/ui/component/home_scaffold.dart';
import 'package:gallery/app/ui/const/app_colors.dart';
import 'package:gallery/app/ui/const/app_texts.dart';
import 'package:gallery/feature/feed/ui/components/feed_grid.dart';
import 'package:gallery/feature/feed/ui/components/feed_tab_bar.dart';
import 'package:gallery/feature/photo/state/photos_cubit.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosCubit(locator.get<PhotoRepository>()),
      child: const _FeedScreen(),
    );
  }
}

class _FeedScreen extends StatefulWidget {
  const _FeedScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<_FeedScreen> {
  late TextEditingController _searchController;
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    _tabs = [_getTab(AppTexts.newTitle), _getTab(AppTexts.popularTitle)];
  }

  Widget _getTab(String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(title),
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: HomeScaffold(
        appBar: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomTextField(
                    labelText: AppTexts.searchTitle,
                    controller: _searchController,
                    suffixIcon: const Icon(
                      Icons.search,
                      color: AppColors.accent,
                    ),
                    onChanged: (value) {},
                  ),
                ),
                FeedTabBar(tabs: _tabs)
              ],
            ),
          ),
        ),
        actions: const [],
        body: const TabBarView(
          children: [
            FeedGrid(
              key: PageStorageKey<String>(AppTexts.newTitle),
              isNew: true,
            ),
            FeedGrid(
              key: PageStorageKey<String>(AppTexts.popularTitle),
              isNew: false,
            ),
          ],
        ),
      ),
    );
  }
}
