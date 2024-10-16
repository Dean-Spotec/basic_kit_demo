// Author: Dean.Liu
// DateTime: 2024/10/12 19:05

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/ui/view/other/keep_alive_view.dart';
import 'skeleton_item.dart';

class TabListView extends ConsumerWidget {
  const TabListView({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KeepAliveView(
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const SkeletonItem();
              },
              childCount: itemCount,
            ),
          ),
          // const FooterLocator.sliver(),
        ],
      ),
    );
  }
}
