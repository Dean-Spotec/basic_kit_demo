// Author: Dean.Liu
// DateTime: 2024/10/12 20:49

import 'package:auto_route/auto_route.dart';
import 'package:basic_kit_demo/basic_kit/views/sp_button.dart';
import 'package:basic_kit_demo/feature/refresh/view/names_paging_view.dart';
import 'package:basic_kit_demo/route/app_router.gr.dart';
import 'package:basic_kit_demo/shared/ui/view/other/keep_alive_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/ui/view/other/ba_navigation_bar.dart';

@RoutePage()
class TabRefreshPage extends ConsumerStatefulWidget {
  const TabRefreshPage({super.key});

  @override
  ConsumerState<TabRefreshPage> createState() => _TabRefreshPageState();
}

class _TabRefreshPageState extends ConsumerState<TabRefreshPage>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: BaNavigationBar(
          ref: ref,
          middleTitle: 'TabRefreshPage',
          trailing: SpButton(
            onPressed: () {
              context.pushRoute(PaginationRoute(countryId: 0));
            },
            child: const Text('Push'),
          ),
        ),
        child: Column(
          children: [
            ColoredBox(
              color: Colors.green,
              child: TabBar(
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(text: '美国'),
                  Tab(text: '美国'),
                  Tab(text: '中国'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  KeepAliveView(
                    child: NamesPagingView(
                      pageType: TabRefreshPage,
                      countryId: 0,
                      useList: true,
                    ),
                  ),
                  KeepAliveView(
                    child: NamesPagingView(
                      pageType: TabRefreshPage,
                      countryId: 0,
                      useList: true,
                    ),
                  ),
                  KeepAliveView(
                    child: NamesPagingView(
                      pageType: TabRefreshPage,
                      countryId: 1,
                      useList: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
