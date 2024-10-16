// Author: Dean.Liu
// DateTime: 2021/11/16 14:02

import 'package:flutter/material.dart';

/// app四个角上添加banner
class CornerBanner extends StatelessWidget {
  const CornerBanner({
    super.key,
    required this.message,
    required this.show,
    required this.location,
    required this.child,
    this.textStyle,
    this.color,
  });

  final String message;
  final bool show;
  final BannerLocation location;
  final Color? color;
  final TextStyle? textStyle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final realChild = show
        ? Banner(
            location: location,
            message: message,
            color: color ?? Colors.green.withOpacity(0.6),
            textStyle: textStyle ?? const TextStyle(fontSize: 8),
            child: child,
          )
        : child;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: realChild,
    );
  }
}
