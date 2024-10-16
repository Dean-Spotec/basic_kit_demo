// Author: Dean.Liu
// DateTime: 2024/10/11 21:45

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestNoDataView extends ConsumerWidget {
  const RequestNoDataView({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(child: Text(message ?? '暂无数据'));
  }
}
