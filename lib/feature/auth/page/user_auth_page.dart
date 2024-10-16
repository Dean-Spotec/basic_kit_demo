// Author: Dean.Liu
// DateTime: 2024/09/30 18:18

import 'package:auto_route/auto_route.dart';
import 'package:basic_kit_demo/shared/riverpod/provider/user_notifier_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../route/app_router.gr.dart';

/// 登录模块的路由
@RoutePage()
class UserAuthPage extends AutoRouter {
  const UserAuthPage({super.key});

  /// 是否需要推出登录模块，返回false表示不需要；返回true则需要
  /// 如果已登录，直接执行回调；如果未登录，跳转登录页面登录成功后再执行回调
  static bool pushIfNeeded(
    WidgetRef ref, {
    BuildContext? context,
    VoidCallback? ifLoggedIn,
  }) {
    if (ref.read(userNotifierProvider).isLoggedIn) {
      ifLoggedIn?.call();
      return false;
    }
    final loginRoute = LoginRoute(
      onLoginSuccess: ifLoggedIn,
    );
    (context ?? ref.context).pushRoute(UserAuthRoute(children: [loginRoute]));
    return true;
  }
}
