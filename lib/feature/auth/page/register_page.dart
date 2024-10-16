// Author: Dean.Liu
// DateTime: 2023/06/02 11:44

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../basic_kit/views/sp_button.dart';
import '../../../shared/ui/view/other/ba_navigation_bar.dart';

@RoutePage()
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: BaNavigationBar(
        ref: ref,
        middleTitle: '注册',
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpButton.filled(
              onPressed: () {
                context.maybePop();
              },
              child: const Text('返回登录页面'),
            ),
            const SizedBox(height: 10),
            SpButton.filled(
              onPressed: () {
                // 关闭登录模块
                context.router.parent()?.maybePop();
              },
              child: const Text('退出登录模块'),
            )
          ],
        ),
      ),
    );
  }
}
