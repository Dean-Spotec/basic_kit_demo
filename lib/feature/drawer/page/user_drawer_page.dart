// Author: Dean.Liu
// DateTime: 2024/09/11 18:21

import 'package:auto_route/auto_route.dart';
import 'package:basic_kit_demo/route/app_router.gr.dart';
import 'package:basic_kit_demo/shared/riverpod/provider/user_notifier_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class UserDrawerPage extends ConsumerWidget {
  const UserDrawerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGreen,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildUserButton(ref),
          ],
        ),
      ),
    );
  }

  Widget _buildUserButton(WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final userState = ref.watch(userNotifierProvider);
        final isLoggedIn = userState.isLoggedIn;
        return Column(
          children: [
            Text(isLoggedIn ? '已登录' : '未登录'),
            const SizedBox(height: 10),
            CupertinoButton.filled(
              child: const Text('查看用户信息'),
              onPressed: () {
                context.pushRoute(const UserInfoRoute());
              },
            ),
          ],
        );
      },
    );
  }
}
