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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:auto_route/empty_router_widgets.dart' as _i6;
import 'package:flutter/material.dart' as _i12;

import '../../feature/auth/ui/log_in_screen.dart' as _i4;
import '../../feature/auth/ui/register_screen.dart' as _i5;
import '../../feature/auth/ui/welcome_screen.dart' as _i3;
import '../../feature/feed/ui/feed_item_screen.dart' as _i8;
import '../../feature/feed/ui/feed_screen.dart' as _i7;
import '../../feature/photo/ui/photo_screen.dart' as _i2;
import '../../feature/profile/ui/profile_screen.dart' as _i9;
import '../../feature/profile/ui/profile_settings_screen.dart' as _i10;
import '../domain/entity/photo_entity.dart' as _i13;
import '../ui/root.dart' as _i1;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    Root.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Root(),
      );
    },
    PhotoRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.PhotoScreen(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.WelcomeScreen(),
      );
    },
    LogInRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LogInScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    FeedRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    FeedRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.FeedScreen(),
      );
    },
    FeedItemRoute.name: (routeData) {
      final args = routeData.argsAs<FeedItemRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.FeedItemScreen(
          key: args.key,
          feedId: args.feedId,
          photo: args.photo,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileScreen(),
      );
    },
    ProfileSettingsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.ProfileSettingsScreen(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          Root.name,
          path: '/',
          children: [
            _i11.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: Root.name,
              children: [
                _i11.RouteConfig(
                  FeedRouter.name,
                  path: 'feed',
                  parent: HomeRouter.name,
                  children: [
                    _i11.RouteConfig(
                      FeedRoute.name,
                      path: '',
                      parent: FeedRouter.name,
                    ),
                    _i11.RouteConfig(
                      FeedItemRoute.name,
                      path: ':feedId',
                      parent: FeedRouter.name,
                    ),
                  ],
                ),
                _i11.RouteConfig(
                  ProfileRouter.name,
                  path: 'profile',
                  parent: HomeRouter.name,
                  children: [
                    _i11.RouteConfig(
                      ProfileRoute.name,
                      path: '',
                      parent: ProfileRouter.name,
                    ),
                    _i11.RouteConfig(
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
        _i11.RouteConfig(
          PhotoRoute.name,
          path: 'photo',
        ),
        _i11.RouteConfig(
          WelcomeRoute.name,
          path: 'welcome',
        ),
        _i11.RouteConfig(
          LogInRoute.name,
          path: 'logIn',
        ),
        _i11.RouteConfig(
          RegisterRoute.name,
          path: 'register',
        ),
      ];
}

/// generated route for
/// [_i1.Root]
class Root extends _i11.PageRouteInfo<void> {
  const Root({List<_i11.PageRouteInfo>? children})
      : super(
          Root.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'Root';
}

/// generated route for
/// [_i2.PhotoScreen]
class PhotoRoute extends _i11.PageRouteInfo<void> {
  const PhotoRoute()
      : super(
          PhotoRoute.name,
          path: 'photo',
        );

  static const String name = 'PhotoRoute';
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeRoute extends _i11.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: 'welcome',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i4.LogInScreen]
class LogInRoute extends _i11.PageRouteInfo<void> {
  const LogInRoute()
      : super(
          LogInRoute.name,
          path: 'logIn',
        );

  static const String name = 'LogInRoute';
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class HomeRouter extends _i11.PageRouteInfo<void> {
  const HomeRouter({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class FeedRouter extends _i11.PageRouteInfo<void> {
  const FeedRouter({List<_i11.PageRouteInfo>? children})
      : super(
          FeedRouter.name,
          path: 'feed',
          initialChildren: children,
        );

  static const String name = 'FeedRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ProfileRouter extends _i11.PageRouteInfo<void> {
  const ProfileRouter({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i7.FeedScreen]
class FeedRoute extends _i11.PageRouteInfo<void> {
  const FeedRoute()
      : super(
          FeedRoute.name,
          path: '',
        );

  static const String name = 'FeedRoute';
}

/// generated route for
/// [_i8.FeedItemScreen]
class FeedItemRoute extends _i11.PageRouteInfo<FeedItemRouteArgs> {
  FeedItemRoute({
    _i12.Key? key,
    required int feedId,
    required _i13.PhotoEntity photo,
  }) : super(
          FeedItemRoute.name,
          path: ':feedId',
          args: FeedItemRouteArgs(
            key: key,
            feedId: feedId,
            photo: photo,
          ),
          rawPathParams: {'feedId': feedId},
        );

  static const String name = 'FeedItemRoute';
}

class FeedItemRouteArgs {
  const FeedItemRouteArgs({
    this.key,
    required this.feedId,
    required this.photo,
  });

  final _i12.Key? key;

  final int feedId;

  final _i13.PhotoEntity photo;

  @override
  String toString() {
    return 'FeedItemRouteArgs{key: $key, feedId: $feedId, photo: $photo}';
  }
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i10.ProfileSettingsScreen]
class ProfileSettingsRoute extends _i11.PageRouteInfo<void> {
  const ProfileSettingsRoute()
      : super(
          ProfileSettingsRoute.name,
          path: 'settings',
        );

  static const String name = 'ProfileSettingsRoute';
}
