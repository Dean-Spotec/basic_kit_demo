// Author: Dean.Liu
// DateTime: 2024/09/18 16:25

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/ui/view/other/ba_navigation_bar.dart';

@RoutePage()
class PluginPage extends ConsumerStatefulWidget {
  const PluginPage({super.key});

  @override
  ConsumerState<PluginPage> createState() => _PluginPageState();
}

class _PluginPageState extends ConsumerState<PluginPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: BaNavigationBar(
        ref: ref,
        backType: BarBackButtonType.none,
        middleTitle: 'Plugin',
        // 关闭hero动画，否则要和PluginPage的导航栏冲突
        transitionBetweenRoutes: false,
      ),
      child: const Placeholder(),
    );
  }
}
