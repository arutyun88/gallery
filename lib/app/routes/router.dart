import 'package:auto_route/auto_route.dart';
import 'package:gallery/app/ui/root.dart';
import 'package:gallery/feature/auth/ui/log_in_screen.dart';
import 'package:gallery/feature/auth/ui/register_screen.dart';
import 'package:gallery/feature/auth/ui/welcome_screen.dart';
import 'package:gallery/feature/main/main_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: Root,
    ),
    AutoRoute(
      path: '/home',
      page: MainScreen,
    ),
    AutoRoute(
      path: '/auth',
      page: WelcomeScreen,
    ),
    AutoRoute(
      path: '/logIn',
      page: LogInScreen,
    ),
    AutoRoute(
      path: '/register',
      page: RegisterScreen,
    ),
  ],
)
class $AppRouter {}
