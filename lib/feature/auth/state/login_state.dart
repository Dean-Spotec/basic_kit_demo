// Author: Dean.Liu
// DateTime: 2024/10/06 10:44

import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({
    this.haveAgreed = false,
  });

  const LoginState.initial() : haveAgreed = false;

  final bool haveAgreed;

  LoginState copyWith({
    bool? haveAgreed,
  }) {
    return LoginState(
      haveAgreed: haveAgreed ?? this.haveAgreed,
    );
  }

  @override
  List<Object?> get props => [haveAgreed];
}