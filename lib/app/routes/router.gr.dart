// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../feature/auth/ui/log_in_screen.dart' as _i4;
import '../../feature/auth/ui/register_screen.dart' as _i5;
import '../../feature/auth/ui/welcome_screen.dart' as _i3;
import '../../feature/main/main_screen.dart' as _i2;
import '../ui/root.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    Root.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Root(),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeScreen(),
      );
    },
    LogInRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LogInScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          Root.name,
          path: '/',
        ),
        _i6.RouteConfig(
          MainRoute.name,
          path: '/home',
        ),
        _i6.RouteConfig(
          WelcomeRoute.name,
          path: '/auth',
        ),
        _i6.RouteConfig(
          LogInRoute.name,
          path: '/logIn',
        ),
        _i6.RouteConfig(
          RegisterRoute.name,
          path: '/register',
        ),
      ];
}

/// generated route for
/// [_i1.Root]
class Root extends _i6.PageRouteInfo<void> {
  const Root()
      : super(
          Root.name,
          path: '/',
        );

  static const String name = 'Root';
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/home',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeRoute extends _i6.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/auth',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i4.LogInScreen]
class LogInRoute extends _i6.PageRouteInfo<void> {
  const LogInRoute()
      : super(
          LogInRoute.name,
          path: '/logIn',
        );

  static const String name = 'LogInRoute';
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i6.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register',
        );

  static const String name = 'RegisterRoute';
}
