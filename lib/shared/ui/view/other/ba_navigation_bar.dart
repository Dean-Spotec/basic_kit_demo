// Author: Dean.Liu
// DateTime: 2023/03/04 18:55

import 'package:basic_kit_demo/basic_kit/views/sp_bar_back_button.dart';
import 'package:basic_kit_demo/shared/ui/style/tmd_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../button/ba_bar_back_button.dart';

export 'package:basic_kit_demo/basic_kit/views/sp_bar_back_button.dart';

class BaNavigationBar extends CupertinoNavigationBar {
  BaNavigationBar({
    super.key,
    required WidgetRef ref,
    super.automaticallyImplyLeading,
    super.automaticallyImplyMiddle,
    super.trailing,
    super.border,
    super.brightness,
    super.transitionBetweenRoutes,
    super.heroTag,
    BarBackButtonType backType = BarBackButtonType.back,
    Widget? leading,
    Widget? middle,
    String? middleTitle,
    EdgeInsetsDirectional? padding,
  }) : super(
          leading: leading ?? BaBarBackButton(ref: ref, popType: backType),
          padding:
              padding ?? const EdgeInsetsDirectional.symmetric(horizontal: 8),
          middle: middle ??
              Text(
                middleTitle ?? '',
                style: const TextStyle(fontSize: 22),
              ),
          backgroundColor: TmdTheme.of(ref.context).appBarColor,
        );
}
