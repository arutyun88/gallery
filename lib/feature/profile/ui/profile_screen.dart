import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery/app/data/repository/auth_repository_impl.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/app_api.dart';
import 'package:gallery/app/routes/router.gr.dart';
import 'package:gallery/app/ui/component/home_scaffold.dart';
import 'package:gallery/app/ui/const/app_icons.dart';
import 'package:gallery/app/ui/const/app_text_style.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

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
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                final refreshToken = locator.get<AuthCubit>().state.whenOrNull(
                      authorized: (entity) => entity.refreshToken,
                    );
                AuthRepositoryImpl(locator.get<AppApi>())
                    .refreshToken(refreshToken ?? '');
              },
              child: const Text('refresh'),
            ),
            const SizedBox(height: 24.0),
            GestureDetector(
              onTap: () {
                locator.get<AuthCubit>().logOut();
              },
              child: const Text('log out'),
            )
          ],
        ),
      ),
    );
  }
}
