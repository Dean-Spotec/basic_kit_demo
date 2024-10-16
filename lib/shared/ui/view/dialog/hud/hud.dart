// Author: Dean.Liu
// DateTime: 2024/10/11 18:51

import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../generated/r.dart';
import 'hud_loading_view.dart';
import 'hud_status_view.dart';

class Hud {
  factory Hud() => _instance;

  Hud._internal();

  static final Hud _instance = Hud._internal();

  /// 显示加载中hud
  Future<void> show({
    String? status,
    WidgetBuilder? loadingBuilder,
  }) async {
    await dismiss();
    return SmartDialog.showLoading(
      maskColor: CupertinoColors.transparent,
      builder: (context) {
        return loadingBuilder?.call(context) ?? HudLoadingView(msg: status);
      },
    );
  }

  /// 显示操作成功，事件默认可以穿透
  Future<void> showSuccess(
    String status, {
    bool usePenetrate = true,
    Duration displayTime = const Duration(seconds: 2),
    WidgetBuilder? successBuilder,
  }) async {
    await dismiss();
    return SmartDialog.showLoading(
      maskColor: CupertinoColors.transparent,
      usePenetrate: usePenetrate,
      displayTime: displayTime,
      builder: (context) {
        return successBuilder?.call(context) ??
            HudStatusView(
              image: R.hudSuccess,
              msg: status,
              color: CupertinoColors.systemGreen,
            );
      },
    );
  }

  /// 显示操作失败，事件默认可以穿透，显示时间较长
  Future<void> showError(
    String status, {
    bool usePenetrate = true,
    Duration displayTime = const Duration(seconds: 2),
    WidgetBuilder? errorBuilder,
  }) async {
    await dismiss();
    return SmartDialog.showLoading(
      maskColor: CupertinoColors.transparent,
      usePenetrate: usePenetrate,
      displayTime: displayTime,
      builder: (context) {
        return errorBuilder?.call(context) ??
            HudStatusView(
              image: R.hudError,
              msg: status,
            );
      },
    );
  }

  /// 显示提示信息，事件默认可以穿透
  Future<void> showInfo(
    String status, {
    bool usePenetrate = true,
    Duration displayTime = const Duration(seconds: 2),
    WidgetBuilder? infoBuilder,
  }) async {
    await dismiss();
    return SmartDialog.showLoading(
      maskColor: CupertinoColors.transparent,
      usePenetrate: usePenetrate,
      displayTime: displayTime,
      builder: (context) {
        return infoBuilder?.call(context) ??
            HudStatusView(
              image: R.hudInfo,
              msg: status,
            );
      },
    );
  }

  /// 显示居中提示信息，点击mask可以隐藏
  Future<void> showCenterHint(
    String status, {
    WidgetBuilder? hintBuilder,
  }) async {
    await dismiss();
    return SmartDialog.showLoading(
      maskColor: CupertinoColors.transparent,
      clickMaskDismiss: true,
      displayTime: const Duration(seconds: 4),
      builder: (context) {
        return hintBuilder?.call(context) ??
            HudStatusView(
              image: R.hudInfo,
              msg: status,
            );
      },
    );
  }

  /// 隐藏当前hud
  Future<void> dismiss() {
    return SmartDialog.dismiss(status: SmartStatus.loading);
  }
}
