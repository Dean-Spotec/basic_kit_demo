// Author: Dean.Liu
// DateTime: 2024/10/16 14:30

import 'package:flutter/cupertino.dart';

extension TmdThemeData on CupertinoThemeData {
  TextStyle? get textStyle => textTheme.textStyle;

  TextStyle? get actionTextStyle => textTheme.actionTextStyle;

  TextStyle? get tabLabelTextStyle => textTheme.tabLabelTextStyle;

  TextStyle? get navTitleTextStyle => textTheme.navTitleTextStyle;

  TextStyle? get navLargeTitleTextStyle => textTheme.navLargeTitleTextStyle;

  TextStyle? get navActionTextStyle => textTheme.navActionTextStyle;

  TextStyle? get pickerTextStyle => textTheme.pickerTextStyle;

  TextStyle? get dateTimePickerTextStyle => textTheme.dateTimePickerTextStyle;

  Color get appBarColor => brightness == Brightness.light
      ? CupertinoColors.lightBackgroundGray
      : CupertinoColors.darkBackgroundGray;

  Color get customBgColor => brightness == Brightness.light
      ? CupertinoColors.systemYellow
      : CupertinoColors.systemRed;
}
