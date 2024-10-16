// Author: Dean.Liu
// DateTime: 2024/09/18 17:50

import 'package:flutter/cupertino.dart';

class SpButton extends CupertinoButton {
  /// Creates an iOS-style button.
  const SpButton({
    super.key,
    required super.child,
    super.padding = const EdgeInsets.all(8),
    super.color,
    super.disabledColor = CupertinoColors.quaternarySystemFill,
    super.minSize = kMinInteractiveDimensionCupertino,
    super.pressedOpacity = 0.4,
    super.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    super.alignment = Alignment.center,
    super.focusColor,
    super.focusNode,
    super.onFocusChange,
    super.autofocus = false,
    required super.onPressed,
  });

  /// Creates an iOS-style button with a filled background.
  ///
  /// The background color is derived from the [CupertinoTheme]'s `primaryColor`.
  ///
  /// To specify a custom background color, use the [color] argument of the
  /// default constructor.
  const SpButton.filled({
    super.key,
    required super.child,
    super.padding = const EdgeInsets.all(8),
    super.disabledColor = CupertinoColors.quaternarySystemFill,
    super.minSize = kMinInteractiveDimensionCupertino,
    super.pressedOpacity = 0.4,
    super.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    super.alignment = Alignment.center,
    super.focusColor,
    super.focusNode,
    super.onFocusChange,
    super.autofocus = false,
    required super.onPressed,
  }): super.filled();
}
