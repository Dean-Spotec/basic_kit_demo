// Author: Dean.Liu
// DateTime: 2023/01/09 16:45

import 'package:flutter/cupertino.dart';

/// 路由返回按钮的类型
enum BarBackButtonType {
  back,
  close,
  none;
}

/// CupertinoNavigationBar前面的返回按钮，仿写CupertinoNavigationBarBackButton类
///
/// 当前路由如果是堆栈里面的第一个，显示关闭按钮，否则显示返回按钮
class SpBarBackButton extends StatefulWidget {
  const SpBarBackButton({
    super.key,
    required this.popType,
    this.color,
    this.backIcon,
    this.closeIcon,
    this.padding = EdgeInsets.zero,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.popAction,
  });

  final BarBackButtonType popType;
  final Color? color;
  final Widget? backIcon;
  final Widget? closeIcon;
  final EdgeInsetsGeometry? padding;
  final double? minSize;
  final Function(BarBackButtonType)? popAction;

  @override
  State<SpBarBackButton> createState() => _SpBarBackButtonState();
}

class _SpBarBackButtonState extends State<SpBarBackButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.popType == BarBackButtonType.none) {
      return const SizedBox.shrink();
    }
    // 是否是关闭模块
    final popEntireModule = widget.popType == BarBackButtonType.close;
    final child = popEntireModule
        ? widget.closeIcon ?? const Icon(CupertinoIcons.clear)
        : widget.backIcon ?? const Icon(CupertinoIcons.back);
    return CupertinoButton(
      onPressed: () {
        if (widget.popAction != null) {
          widget.popAction!(widget.popType);
        } else {
          popEntireModule
              ? Navigator.of(context, rootNavigator: true).maybePop()
              : Navigator.of(context).maybePop();
        }
      },
      color: widget.color,
      padding: widget.padding,
      minSize: widget.minSize,
      child: child,
    );
  }
}
