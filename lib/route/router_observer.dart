// Author: Dean.Liu
// DateTime: 2023/01/10 16:30

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

/// 路由观察者
class RouterObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      debugPrint('推出:${route.settings.name}');
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      debugPrint('关闭:${route.settings.name}');
    }
  }
}
