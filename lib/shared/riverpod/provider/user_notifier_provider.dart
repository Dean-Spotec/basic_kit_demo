// Author: Dean.Liu
// DateTime: 2024/09/29 14:57

import 'package:basic_kit_demo/shared/riverpod/repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/user_state.dart';

part 'user_notifier_provider.g.dart';

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  UserState build() {
    return const UserState.initial();
  }

  Future<bool> login(String username, String password) async {
    final repo = ref.read(userRepositoryProvider);
    final user = await repo.login(username, password);
    state = state.copyWith(user: user);
    return user != null;
  }

  Future<void> logout() async {
    await ref.read(userRepositoryProvider).logout();
    state = const UserState.initial();
  }

  Future<void> updateUserName(String name) async {
    final user =
        await ref.read(userRepositoryProvider).updateUser(state.user, name);
    state = state.copyWith(user: user);
  }
}
