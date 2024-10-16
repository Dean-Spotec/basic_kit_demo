// Author: Dean.Liu
// DateTime: 2024/10/15 19:19

import 'dart:ui';

import 'package:basic_kit_demo/shared/util/locale_tool.dart';
import 'package:equatable/equatable.dart';

class LocaleState extends Equatable {
  const LocaleState({required this.currentCode});

  /// 第一次启动时currentCode等于系统locale，可能包含countryCode。切换语言后currentCode不包含国家代码
  final String currentCode;

  Locale? get currentLocale => LocaleTool().codeToLocale(currentCode);

  LocaleState copyWith({
    String? currentCode,
  }) {
    return LocaleState(currentCode: currentCode ?? this.currentCode);
  }

  @override
  List<Object?> get props => [currentCode];
}
