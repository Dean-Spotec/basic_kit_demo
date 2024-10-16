// Author: Dean.Liu
// DateTime: 2024/10/15 20:40

import 'package:flutter/cupertino.dart';

class LocaleTool {
  factory LocaleTool() => _instance;

  LocaleTool._internal();

  static final LocaleTool _instance = LocaleTool._internal();

  /// 根据完整的locale字符串获取Locale对象，不包含CountryCode
  Locale? codeToLocale(String? code) {
    if (code == null) {
      return null;
    } else {
      final codeList = code.split('_');
      // 规定l10n文件夹里只通过languageCode和scriptCode来定义语言
      return Locale.fromSubtags(
        languageCode: codeList.first,
        scriptCode: codeList.length >= 2 ? codeList.last : null,
      );
    }
  }

  /// 设备的locale的countryCode
  String? deviceCountryCode(BuildContext context) {
    return View.of(context).platformDispatcher.locale.countryCode;
  }
}
