// Author: Dean.Liu
// DateTime: 2024/10/06 10:38

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/login_state.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  LoginState build() {
    return const LoginState.initial();
  }

  void toggleAgree() {
    state = state.copyWith(haveAgreed: !state.haveAgreed);
  }
}