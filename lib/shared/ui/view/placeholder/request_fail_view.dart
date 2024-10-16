// Author: Dean.Liu
// DateTime: 2024/10/11 21:20

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../basic_kit/views/sp_button.dart';

class RequestFailView extends ConsumerWidget {
  const RequestFailView({
    super.key,
    this.onRetry,
  });

  /// 重试回调
  final ValueSetter<WidgetRef>? onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SpButton.filled(
        onPressed: () => onRetry?.call(ref),
        child: const Text('刷新失败，点击重试'),
      ),
    );
  }


}
