// Author: Dean.Liu
// DateTime: 2024/10/12 17:07

import 'package:flutter/cupertino.dart';

class KeepAliveView extends StatefulWidget {
  const KeepAliveView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<KeepAliveView> createState() => _KeepAliveViewState();
}

class _KeepAliveViewState extends State<KeepAliveView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
