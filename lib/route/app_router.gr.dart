// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:basic_kit_demo/feature/auth/page/login_page.dart' as _i2;
import 'package:basic_kit_demo/feature/auth/page/register_page.dart' as _i7;
import 'package:basic_kit_demo/feature/auth/page/user_auth_page.dart' as _i10;
import 'package:basic_kit_demo/feature/core_page.dart' as _i1;
import 'package:basic_kit_demo/feature/drawer/page/user_drawer_page.dart'
    as _i11;
import 'package:basic_kit_demo/feature/drawer/page/user_info_page.dart' as _i12;
import 'package:basic_kit_demo/feature/mine_page.dart' as _i3;
import 'package:basic_kit_demo/feature/plugin_page.dart' as _i6;
import 'package:basic_kit_demo/feature/refresh/page/nested_refresh_page.dart'
    as _i4;
import 'package:basic_kit_demo/feature/refresh/page/pagination_page.dart'
    as _i5;
import 'package:basic_kit_demo/feature/refresh/page/tab_refresh_page.dart'
    as _i9;
import 'package:basic_kit_demo/feature/tab_page.dart' as _i8;
import 'package:flutter/cupertino.dart' as _i14;

/// generated route for
/// [_i1.CorePage]
class CoreRoute extends _i13.PageRouteInfo<CoreRouteArgs> {
  CoreRoute({
    _i14.Key? key,
    required _i14.VoidCallback onOpenDrawer,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          CoreRoute.name,
          args: CoreRouteArgs(
            key: key,
            onOpenDrawer: onOpenDrawer,
          ),
          initialChildren: children,
        );

  static const String name = 'CoreRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CoreRouteArgs>();
      return _i1.CorePage(
        key: args.key,
        onOpenDrawer: args.onOpenDrawer,
      );
    },
  );
}

class CoreRouteArgs {
  const CoreRouteArgs({
    this.key,
    required this.onOpenDrawer,
  });

  final _i14.Key? key;

  final _i14.VoidCallback onOpenDrawer;

  @override
  String toString() {
    return 'CoreRouteArgs{key: $key, onOpenDrawer: $onOpenDrawer}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i14.Key? key,
    _i14.VoidCallback? onLoginSuccess,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onLoginSuccess: onLoginSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<LoginRouteArgs>(orElse: () => const LoginRouteArgs());
      return _i2.LoginPage(
        key: args.key,
        onLoginSuccess: args.onLoginSuccess,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onLoginSuccess,
  });

  final _i14.Key? key;

  final _i14.VoidCallback? onLoginSuccess;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginSuccess: $onLoginSuccess}';
  }
}

/// generated route for
/// [_i3.MinePage]
class MineRoute extends _i13.PageRouteInfo<void> {
  const MineRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MineRoute.name,
          initialChildren: children,
        );

  static const String name = 'MineRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.MinePage();
    },
  );
}

/// generated route for
/// [_i4.NestedRefreshPage]
class NestedRefreshRoute extends _i13.PageRouteInfo<void> {
  const NestedRefreshRoute({List<_i13.PageRouteInfo>? children})
      : super(
          NestedRefreshRoute.name,
          initialChildren: children,
        );

  static const String name = 'NestedRefreshRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.NestedRefreshPage();
    },
  );
}

/// generated route for
/// [_i5.PaginationPage]
class PaginationRoute extends _i13.PageRouteInfo<PaginationRouteArgs> {
  PaginationRoute({
    _i14.Key? key,
    required int countryId,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          PaginationRoute.name,
          args: PaginationRouteArgs(
            key: key,
            countryId: countryId,
          ),
          rawPathParams: {'countryId': countryId},
          initialChildren: children,
        );

  static const String name = 'PaginationRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PaginationRouteArgs>(
          orElse: () =>
              PaginationRouteArgs(countryId: pathParams.getInt('countryId')));
      return _i5.PaginationPage(
        key: args.key,
        countryId: args.countryId,
      );
    },
  );
}

class PaginationRouteArgs {
  const PaginationRouteArgs({
    this.key,
    required this.countryId,
  });

  final _i14.Key? key;

  final int countryId;

  @override
  String toString() {
    return 'PaginationRouteArgs{key: $key, countryId: $countryId}';
  }
}

/// generated route for
/// [_i6.PluginPage]
class PluginRoute extends _i13.PageRouteInfo<void> {
  const PluginRoute({List<_i13.PageRouteInfo>? children})
      : super(
          PluginRoute.name,
          initialChildren: children,
        );

  static const String name = 'PluginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.PluginPage();
    },
  );
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i13.PageRouteInfo<void> {
  const RegisterRoute({List<_i13.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.RegisterPage();
    },
  );
}

/// generated route for
/// [_i8.TabPage]
class TabRoute extends _i13.PageRouteInfo<void> {
  const TabRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.TabPage();
    },
  );
}

/// generated route for
/// [_i9.TabRefreshPage]
class TabRefreshRoute extends _i13.PageRouteInfo<void> {
  const TabRefreshRoute({List<_i13.PageRouteInfo>? children})
      : super(
          TabRefreshRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabRefreshRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.TabRefreshPage();
    },
  );
}

/// generated route for
/// [_i10.UserAuthPage]
class UserAuthRoute extends _i13.PageRouteInfo<void> {
  const UserAuthRoute({List<_i13.PageRouteInfo>? children})
      : super(
          UserAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserAuthRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.UserAuthPage();
    },
  );
}

/// generated route for
/// [_i11.UserDrawerPage]
class UserDrawerRoute extends _i13.PageRouteInfo<void> {
  const UserDrawerRoute({List<_i13.PageRouteInfo>? children})
      : super(
          UserDrawerRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserDrawerRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.UserDrawerPage();
    },
  );
}

/// generated route for
/// [_i12.UserInfoPage]
class UserInfoRoute extends _i13.PageRouteInfo<void> {
  const UserInfoRoute({List<_i13.PageRouteInfo>? children})
      : super(
          UserInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.UserInfoPage();
    },
  );
}
