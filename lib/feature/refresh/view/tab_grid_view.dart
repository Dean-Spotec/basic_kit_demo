// Author: Dean.Liu
// DateTime: 2024/10/12 19:06

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/ui/view/other/keep_alive_view.dart';
import 'skeleton_item.dart';

class TabGridView extends ConsumerWidget {
  const TabGridView({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KeepAliveView(
      child: CustomScrollView(
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return const SkeletonItem(
                direction: Axis.horizontal,
              );
            }, childCount: itemCount),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 6 / 7,
            ),
          ),
          const FooterLocator.sliver(),
        ],
      ),
    );
  }
}
