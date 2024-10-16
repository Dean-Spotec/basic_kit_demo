// Author: Dean.Liu
// DateTime: 2023/06/02 11:44

import 'package:auto_route/auto_route.dart';
import 'package:basic_kit_demo/basic_kit/views/sp_button.dart';
import 'package:basic_kit_demo/shared/riverpod/provider/user_notifier_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../route/app_router.gr.dart';
import '../../../shared/ui/view/other/ba_navigation_bar.dart';
import '../provider/login_provider.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    super.key,
    this.onLoginSuccess,
  });

  final VoidCallback? onLoginSuccess;

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _nameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: BaNavigationBar(
        ref: ref,
        middleTitle: '登录',
        backType: BarBackButtonType.close,
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(
              controller: _nameTextController,
              placeholder: '用户名',
            ),
            const SizedBox(height: 10),
            CupertinoTextField(
              controller: _passwordTextController,
              placeholder: '密码',
            ),
            const SizedBox(height: 10),
            _buildAgreeView(),
            const SizedBox(height: 10),
            SpButton.filled(
              onPressed: () => _login(context),
              child: const Text('登录'),
            ),
            const SizedBox(height: 10),
            SpButton.filled(
              onPressed: () {
                context.pushRoute(const RegisterRoute());
              },
              child: const Text('Push注册页面'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgreeView() {
    return Row(
      children: [
        Consumer(
          builder: (context, ref, child) {
            return CupertinoCheckbox(
              value: ref.watch(
                loginProvider.select((state) => state.haveAgreed),
              ),
              onChanged: (value) {
                ref.read(loginProvider.notifier).toggleAgree();
              },
            );
          },
        ),
        const Text('同意《用户协议》'),
      ],
    );
  }

  void _login(BuildContext context) {
    if (!ref.read(loginProvider).haveAgreed) {
      _showAgreeDialog();
      return;
    }
    ref
        .read(userNotifierProvider.notifier)
        .login(_nameTextController.text, _passwordTextController.text)
        .then((success) {
      if (!context.mounted) return;
      if (success) {
        context.router.root.maybePop();
        widget.onLoginSuccess?.call();
      } else {
        debugPrint('登录失败');
      }
    });
  }

  void _showAgreeDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('用户协议'),
          content: const Text('这是一个用户协议'),
          actions: [
            CupertinoDialogAction(
              child: const Text('同意'),
              onPressed: () {
                ref.read(loginProvider.notifier).toggleAgree();
                context.maybePop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('不同意'),
              onPressed: () {
                context.maybePop();
              },
            ),
          ],
        );
      },
    );
  }
}
