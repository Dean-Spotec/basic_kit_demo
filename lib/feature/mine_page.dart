// Author: Dean.Liu
// DateTime: 2023/03/09 11:01

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/ui/view/other/ba_navigation_bar.dart';

@RoutePage()
class MinePage extends ConsumerStatefulWidget {
  const MinePage({super.key});

  @override
  ConsumerState<MinePage> createState() => _MinePageState();
}

class _MinePageState extends ConsumerState<MinePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: BaNavigationBar(
        ref: ref,
        backType: BarBackButtonType.none,
        middleTitle: 'Mine',
        // 关闭hero动画，否则要和PluginPage的导航栏冲突
        transitionBetweenRoutes: false,
      ),
      child: const Placeholder(),
    );
  }
}
