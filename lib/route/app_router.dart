// Author: Dean.Liu
// DateTime: 2024/09/11 18:27

import 'package:auto_route/auto_route.dart';
import 'package:basic_kit_demo/route/user_auth_guard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey, required this.ref});

  final WidgetRef ref;

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        CupertinoRoute(
          page: TabRoute.page,
          initial: true,
          children: [
            CupertinoRoute(page: CoreRoute.page),
            CupertinoRoute(page: PluginRoute.page),
            CupertinoRoute(page: MineRoute.page),
          ],
        ),
        CupertinoRoute(
          page: UserAuthRoute.page,
          fullscreenDialog: true,
          children: [
            CupertinoRoute(page: LoginRoute.page, initial: true),
            CupertinoRoute(page: RegisterRoute.page),
          ],
        ),
        CupertinoRoute(page: UserDrawerRoute.page),
        CupertinoRoute(
          page: UserInfoRoute.page,
          guards: [UserAuthGuard(ref: ref)],
        ),
        CupertinoRoute(
          path: '/pagination/:countryId',
          page: PaginationRoute.page,
        ),
        CupertinoRoute(page: TabRefreshRoute.page),
        CupertinoRoute(page: NestedRefreshRoute.page),
      ];
}
