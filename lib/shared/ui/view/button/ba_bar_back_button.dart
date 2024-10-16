// Author: Dean.Liu
// DateTime: 2023/03/08 21:36

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../basic_kit/views/sp_bar_back_button.dart';
import '../../../../generated/r.dart';
import '../../style/tmd_theme.dart';

class BaBarBackButton extends SpBarBackButton {
  BaBarBackButton({
    super.key,
    required WidgetRef ref,
    required super.popType,
    super.popAction,
  }) : super(
          backIcon: Image.asset(
            R.navBack,
            color: TmdTheme.of(ref.context).primaryColor,
            width: 24,
            height: 24,
            matchTextDirection: true,
          ),
          closeIcon: Image.asset(
            R.navClose,
            color: TmdTheme.of(ref.context).primaryColor,
            width: 24,
            height: 24,
            matchTextDirection: true,
          ),
        );
}
