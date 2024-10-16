// Author: Dean.Liu
// DateTime: 2024/09/11 18:21

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:basic_kit_demo/feature/auth/page/user_auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/event/close_user_drawer_event.dart';
import '../shared/event/event_bus.dart';
import '../route/app_router.gr.dart';
import 'drawer/page/user_drawer_page.dart';

@RoutePage()
class TabPage extends ConsumerStatefulWidget {
  const TabPage({super.key});

  @override
  ConsumerState<TabPage> createState() => _TabPageState();
}

class _TabPageState extends ConsumerState<TabPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamSubscription? _closeUserDrawerSub;

  @override
  void initState() {
    super.initState();
    _registerEvents();
  }

  @override
  void dispose() {
    _closeUserDrawerSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        CoreRoute(onOpenDrawer: _onOpenUserDrawer),
        const PluginRoute(),
        const MineRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            shape: Border.all(color: Colors.transparent),
            child: const UserDrawerPage(),
          ),
          body: child,
          bottomNavigationBar: CupertinoTabBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _onSetActiveIndex(tabsRouter, index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.folder),
                label: 'Core',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bag),
                label: 'Plugin',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_circle),
                label: 'Mine',
              ),
            ],
          ),
        );
      },
    );
  }

  void _registerEvents() {
    _closeUserDrawerSub = eventBus
        .on<CloseUserDrawerEvent>()
        .listen((event) => _closeUserDrawer());
  }

  void _onSetActiveIndex(TabsRouter tabsRouter, int index) {
    if (index == 2) {
      // auto_route的AutoTabsRouter目前暂时不支持使用guard，需要手动判断
      // https://github.com/Milad-Akarie/auto_route_library/issues/1278#issuecomment-1364648755
      UserAuthPage.pushIfNeeded(
        ref,
        ifLoggedIn: () => tabsRouter.setActiveIndex(index),
      );
    } else {
      tabsRouter.setActiveIndex(index);
    }
  }

  void _onOpenUserDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeUserDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }
}
