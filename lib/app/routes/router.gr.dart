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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:auto_route/empty_router_widgets.dart' as _i6;
import 'package:flutter/material.dart' as _i11;

import '../../feature/auth/ui/log_in_screen.dart' as _i4;
import '../../feature/auth/ui/register_screen.dart' as _i5;
import '../../feature/auth/ui/welcome_screen.dart' as _i3;
import '../../feature/feed/ui/feed_screen.dart' as _i7;
import '../../feature/photo/ui/photo_screen.dart' as _i2;
import '../../feature/profile/ui/profile_screen.dart' as _i8;
import '../../feature/profile/ui/profile_settings_screen.dart' as _i9;
import '../ui/root.dart' as _i1;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    Root.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Root(),
      );
    },
    PhotoRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.PhotoScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeScreen(),
      );
    },
    LogInRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LogInScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    FeedRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    FeedRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.FeedScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileScreen(),
      );
    },
    ProfileSettingsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileSettingsScreen(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          Root.name,
          path: '/',
          children: [
            _i10.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: Root.name,
              children: [
                _i10.RouteConfig(
                  FeedRouter.name,
                  path: 'feed',
                  parent: HomeRouter.name,
                  children: [
                    _i10.RouteConfig(
                      FeedRoute.name,
                      path: '',
                      parent: FeedRouter.name,
                    )
                  ],
                ),
                _i10.RouteConfig(
                  ProfileRouter.name,
                  path: 'profile',
                  parent: HomeRouter.name,
                  children: [
                    _i10.RouteConfig(
                      ProfileRoute.name,
                      path: '',
                      parent: ProfileRouter.name,
                    ),
                    _i10.RouteConfig(
                      ProfileSettingsRoute.name,
                      path: 'settings',
                      parent: ProfileRouter.name,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        _i10.RouteConfig(
          PhotoRoute.name,
          path: 'photo',
        ),
        _i10.RouteConfig(
          WelcomeRoute.name,
          path: 'welcome',
        ),
        _i10.RouteConfig(
          LogInRoute.name,
          path: 'logIn',
        ),
        _i10.RouteConfig(
          RegisterRoute.name,
          path: 'register',
        ),
      ];
}

/// generated route for
/// [_i1.Root]
class Root extends _i10.PageRouteInfo<void> {
  const Root({List<_i10.PageRouteInfo>? children})
      : super(
          Root.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'Root';
}

/// generated route for
/// [_i2.PhotoScreen]
class PhotoRoute extends _i10.PageRouteInfo<void> {
  const PhotoRoute()
      : super(
          PhotoRoute.name,
          path: 'photo',
        );

  static const String name = 'PhotoRoute';
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeRoute extends _i10.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: 'welcome',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i4.LogInScreen]
class LogInRoute extends _i10.PageRouteInfo<void> {
  const LogInRoute()
      : super(
          LogInRoute.name,
          path: 'logIn',
        );

  static const String name = 'LogInRoute';
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class HomeRouter extends _i10.PageRouteInfo<void> {
  const HomeRouter({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class FeedRouter extends _i10.PageRouteInfo<void> {
  const FeedRouter({List<_i10.PageRouteInfo>? children})
      : super(
          FeedRouter.name,
          path: 'feed',
          initialChildren: children,
        );

  static const String name = 'FeedRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ProfileRouter extends _i10.PageRouteInfo<void> {
  const ProfileRouter({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i7.FeedScreen]
class FeedRoute extends _i10.PageRouteInfo<void> {
  const FeedRoute()
      : super(
          FeedRoute.name,
          path: '',
        );

  static const String name = 'FeedRoute';
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.ProfileSettingsScreen]
class ProfileSettingsRoute extends _i10.PageRouteInfo<void> {
  const ProfileSettingsRoute()
      : super(
          ProfileSettingsRoute.name,
          path: 'settings',
        );

  static const String name = 'ProfileSettingsRoute';
}
