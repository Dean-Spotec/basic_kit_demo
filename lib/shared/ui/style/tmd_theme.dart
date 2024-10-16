// Author: Dean.Liu
// DateTime: 2024/09/14 20:40

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';

export 'tmd_theme_data.dart';

class TmdTheme {
  /// 日间模式
  static const lightThemeData = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: CupertinoColors.systemBlue,
    scaffoldBackgroundColor: CupertinoColors.white,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.systemBlue,
    ),
  );

  /// 夜间模式
  static const darkThemeData = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.systemCyan,
    scaffoldBackgroundColor: CupertinoColors.black,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.systemCyan,
    ),
  );

  /// 根据context获取当前主题管理器
  static AdaptiveThemeManager<CupertinoThemeData> manager(
      BuildContext context) {
    return CupertinoAdaptiveTheme.of(context);
  }

  /// 根据context获取当前主题
  static CupertinoThemeData of(BuildContext context) {
    return TmdTheme.manager(context).theme;
  }
}
