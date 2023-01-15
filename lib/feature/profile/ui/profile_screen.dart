import 'package:flutter/material.dart';
import 'package:gallery/app/data/repository/auth_repository_impl.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/app_api.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('profile'),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    final refreshToken =
                        locator.get<AuthCubit>().state.whenOrNull(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
