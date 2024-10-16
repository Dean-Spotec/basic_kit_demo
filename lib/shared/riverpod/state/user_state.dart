// Author: Dean.Liu
// DateTime: 2024/09/29 18:55

import 'package:basic_kit_demo/shared/model/user_model.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  const UserState({
    this.user,
  });

  const UserState.initial() : user = null;

  final UserModel? user;

  String? get userName => user?.username;

  bool get isLoggedIn => user != null;

  UserState copyWith({
    UserModel? user,
  }) {
    return UserState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [user];
}
