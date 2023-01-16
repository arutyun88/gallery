import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/entity/user_entity.dart';
import 'package:gallery/app/routes/router.gr.dart';
import 'package:gallery/app/ui/component/home_scaffold.dart';
import 'package:gallery/app/ui/component/photo_tile.dart';
import 'package:gallery/app/ui/const/app_icons.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';
import 'package:gallery/feature/profile/ui/components/profile_statistics_widget.dart';
import 'package:gallery/feature/profile/ui/components/profile_title_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserEntity? entity;

  @override
  void initState() {
    super.initState();
    entity = locator
        .get<AuthCubit>()
        .state
        .whenOrNull(authorized: (entity) => entity);
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: Text('Profile', style: Theme.of(context).textTheme.main),
      actions: [
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          icon: SvgPicture.asset(AppIcons.settingsIcon),
          onPressed: () {
            context.navigateTo(const ProfileSettingsRoute());
          },
        ),
      ],
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                ProfileTitleWidget(entity: entity),
                const ProfileStatisticsWidget(),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            sliver: SliverGrid.count(
              childAspectRatio: 1.59,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: List.generate(
                20,
                (index) => PhotoTile(
                  photo: 'https://images.pexels.com/photos'
                      '/259915/pexels-photo-259915.jpeg',
                  onPressed: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
