// Author: Dean.Liu
// DateTime: 2023/01/10 18:36

import 'package:auto_route/auto_route.dart';
import 'package:basic_kit_demo/feature/auth/page/user_auth_page.dart';
import 'package:basic_kit_demo/shared/riverpod/provider/user_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 未登录时，推出需要登录的页面。先拦截后弹出登录模块，登录成功后重发路由
class UserAuthGuard extends AutoRouteGuard {
  const UserAuthGuard({required this.ref});

  final WidgetRef ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isLoggedIn = ref.read(userNotifierProvider).isLoggedIn;
    if (isLoggedIn) {
      resolver.next();
    } else {
      UserAuthPage.pushIfNeeded(
        ref,
        context: router.navigatorKey.currentContext,
        ifLoggedIn: resolver.next,
      );
    }
  }
}
