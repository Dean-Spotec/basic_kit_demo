// Author: Dean.Liu
// DateTime: 2024/10/11 21:42

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestLoadingView extends ConsumerWidget {
  const RequestLoadingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 20,
        color: CupertinoColors.systemRed,
      ),
    );
  }
}
