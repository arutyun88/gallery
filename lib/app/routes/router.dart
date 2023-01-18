import 'package:auto_route/auto_route.dart';
import 'package:gallery/app/ui/root.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:gallery/feature/auth/ui/log_in_screen.dart';
import 'package:gallery/feature/auth/ui/register_screen.dart';
import 'package:gallery/feature/auth/ui/welcome_screen.dart';
import 'package:gallery/feature/feed/ui/feed_screen.dart';
import 'package:gallery/feature/feed/ui/feed_item_screen.dart';
import 'package:gallery/feature/photo/ui/photo_screen.dart';
import 'package:gallery/feature/profile/ui/profile_screen.dart';
import 'package:gallery/feature/profile/ui/profile_settings_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: Root,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: 'feed',
              name: 'FeedRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(path: '', page: FeedScreen),
                AutoRoute(path: ':feedId', page: FeedItemScreen),
              ],
            ),
            AutoRoute(
              path: 'profile',
              name: 'ProfileRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(path: '', page: ProfileScreen),
                AutoRoute(path: 'settings', page: ProfileSettingsScreen),
              ],
            ),
          ],
        ),
      ],
    ),
    AutoRoute(path: 'photo', page: PhotoScreen),
    AutoRoute(path: 'welcome', page: WelcomeScreen),
    AutoRoute(path: 'logIn', page: LogInScreen),
    AutoRoute(path: 'register', page: RegisterScreen),
  ],
)
class $AppRouter {}
