// Author: Dean.Liu
// DateTime: 2024/09/29 10:32

import 'package:basic_kit_demo/shared/ui/view/dialog/hud/hud.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/user_model.dart';

part 'user_repository.g.dart';

class UserRepository {
  Future<UserModel?> login(String username, String password) async {
    Hud().show();
    // 模拟网络请求
    await Future.delayed(const Duration(seconds: 1));
    // 替换为实际的登录逻辑
    if (username == 'Dean' && password == 'abc123') {
      Hud().showSuccess('登录成功');
      return UserModel((b) => b
        ..username = username
        ..email = 'dean@gmail.com');
    }
    Hud().showError('登录失败');
    return null;
  }

  Future<void> logout() async {
    Hud().show();
    // 模拟网络请求
    await Future.delayed(const Duration(seconds: 1));
    Hud().dismiss();
  }

  Future<UserModel?> updateUser(UserModel? user, String name) async {
    // 模拟网络请求
    await Future.delayed(const Duration(seconds: 1));
    // 返回更新后的用户信息
    return user?.rebuild((b) => b..username = name);
  }
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository();
}
