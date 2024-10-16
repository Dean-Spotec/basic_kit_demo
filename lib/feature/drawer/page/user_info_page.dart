// Author: Dean.Liu
// DateTime: 2023/06/06 13:46

import 'package:auto_route/auto_route.dart';
import 'package:basic_kit_demo/basic_kit/views/sp_button.dart';
import 'package:basic_kit_demo/shared/riverpod/provider/user_notifier_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/event/close_user_drawer_event.dart';
import '../../../route/app_router.gr.dart';
import '../../../shared/event/event_bus.dart';
import '../../../shared/ui/view/other/ba_navigation_bar.dart';

@RoutePage()
class UserInfoPage extends ConsumerStatefulWidget {
  const UserInfoPage({super.key});

  @override
  ConsumerState<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends ConsumerState<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: BaNavigationBar(
        ref: ref,
        middleTitle: '用户信息',
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('用户名：${ref.watch(userNotifierProvider).userName ?? '-'}'),
            const SizedBox(height: 10),
            SpButton.filled(
              child: const Text('退出登录'),
              onPressed: () {
                _logout(context, ref);
              },
            ),
            const SizedBox(height: 10),
            SpButton.filled(
              child: const Text('跳转到"我的"页面'),
              onPressed: () {
                eventBus.fire(CloseUserDrawerEvent());
                context.navigateTo(const MineRoute());
              },
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context, WidgetRef ref) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('退出登录'),
          actions: [
            CupertinoDialogAction(
              child: const Text('取消'),
              onPressed: () => context.maybePop(),
            ),
            CupertinoDialogAction(
              onPressed: () {
                ref.read(userNotifierProvider.notifier).logout().then(
                  (_) {
                    if (!context.mounted) return;
                    context.navigateTo(const TabRoute());
                  },
                );
              },
              isDestructiveAction: true,
              child: const Text('确认'),
            ),
          ],
        );
      },
    );
  }
}
