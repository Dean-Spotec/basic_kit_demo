// Author: Dean.Liu
// DateTime: 2024/09/14 17:52

import 'package:auto_route/auto_route.dart';
import 'package:basic_kit_demo/route/app_router.gr.dart';
import 'package:basic_kit_demo/shared/riverpod/provider/locale_notifier_provider.dart';
import 'package:basic_kit_demo/shared/ui/view/other/ba_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../basic_kit/views/sp_button.dart';
import '../generated/l10n.dart';
import '../shared/ui/style/tmd_theme.dart';

@RoutePage()
class CorePage extends ConsumerStatefulWidget {
  const CorePage({super.key, required this.onOpenDrawer});

  final VoidCallback onOpenDrawer;

  @override
  ConsumerState<CorePage> createState() => _CorePageState();
}

class _CorePageState extends ConsumerState<CorePage> {
  @override
  Widget build(BuildContext context) {
    debugPrint('build CorePage');
    ref.listen(localeNotifierProvider, (preState, newState) {
      debugPrint('老语言：${preState?.currentCode}, 新语言：${newState.currentCode}');
    });
    final brightness = TmdTheme.manager(context).brightness;
    return CupertinoPageScaffold(
      navigationBar: BaNavigationBar(
        ref: ref,
        backType: BarBackButtonType.none,
        middleTitle: 'Core',
        // 关闭hero动画，否则要和PluginPage的导航栏冲突
        transitionBetweenRoutes: false,
        leading: SpButton(
          onPressed: widget.onOpenDrawer,
          child: const Icon(CupertinoIcons.settings),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '当前主题：$brightness',
              style: TextStyle(color: TmdTheme.of(context).customBgColor),
            ),
            const SizedBox(height: 10),
            SpButton.filled(
              child: const Text('点击切换主题'),
              onPressed: () {
                if (brightness == Brightness.dark) {
                  TmdTheme.manager(context).setLight();
                } else {
                  TmdTheme.manager(context).setDark();
                }
              },
            ),
            const SizedBox(height: 10),
            SpButton.filled(
              child: Builder(
                builder: (context) {
                  return Text(S.of(context).localization);
                },
              ),
              onPressed: () {
                var code = ref.read(localeNotifierProvider).currentCode == 'en'
                    ? 'zh_CN'
                    : 'en';
                ref.read(localeNotifierProvider.notifier).switchLocale(code);
              },
            ),
            const SizedBox(height: 10),
            SpButton.filled(
              child: const Text('分页加载'),
              onPressed: () {
                context.router.pushNamed('/pagination/0');
                // context.pushRoute(PaginationRoute(countryId: 0));
              },
            ),
            const SizedBox(height: 10),
            SpButton.filled(
              child: const Text('Tab下多个分页加载'),
              onPressed: () {
                context.pushRoute(const TabRefreshRoute());
              },
            ),
            const SizedBox(height: 10),
            SpButton.filled(
              child: const Text('嵌套滚动视图下多个分页加载'),
              onPressed: () {
                context.pushRoute(const NestedRefreshRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
