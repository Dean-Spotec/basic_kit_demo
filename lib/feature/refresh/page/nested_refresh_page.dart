// Author: Dean.Liu
// DateTime: 2024/10/12 14:06

import 'package:auto_route/annotations.dart';
import 'package:basic_kit_demo/feature/refresh/view/tab_grid_view.dart';
import 'package:basic_kit_demo/feature/refresh/view/tab_list_view.dart';
import 'package:basic_kit_demo/shared/ui/view/other/ba_navigation_bar.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class NestedRefreshPage extends ConsumerStatefulWidget {
  const NestedRefreshPage({super.key});

  @override
  ConsumerState<NestedRefreshPage> createState() => _TabRefreshPageState();
}

class _TabRefreshPageState extends ConsumerState<NestedRefreshPage>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  int _listCount = 20;
  int _gridCount = 20;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: BaNavigationBar(
        ref: ref,
        middleTitle: 'TabRefreshPage',
      ),
      child: SafeArea(
        bottom: false,
        child: EasyRefresh(
          header: const ClassicHeader(
            position: IndicatorPosition.locator,
            clamping: true,
          ),
          footer: const ClassicFooter(position: IndicatorPosition.locator),
          onRefresh: _onRefresh,
          onLoad: _onLoadMore,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                const HeaderLocator.sliver(clearExtent: false),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.red,
                    height: 1400,
                  ),
                ),
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: _buildPersistentTabBar(),
                )
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                TabListView(itemCount: _listCount),
                TabGridView(itemCount: _gridCount),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// pin在头部的tabBar
  Widget _buildPersistentTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverPersistentHeaderDelegate(
        child: ColoredBox(
          color: Colors.green,
          child: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(text: 'List'),
              Tab(text: 'Grid'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          if (_tabController.index == 0) {
            _listCount = 20;
          } else {
            _gridCount = 20;
          }
        });
      }
    });
  }

  Future<void> _onLoadMore() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (mounted) {
          setState(() {
            if (_tabController.index == 0) {
              _listCount += 10;
            } else {
              _gridCount += 10;
            }
          });
        }
      },
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverPersistentHeaderDelegate({required this.child});

  final Widget child;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => 45;

  @override
  double get minExtent => 45;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
