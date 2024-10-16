// Author: Dean.Liu
// DateTime: 2022/08/30 12:03

import 'package:flutter/cupertino.dart';

class HudLoadingView extends StatelessWidget {
  const HudLoadingView({super.key, this.msg});

  final String? msg;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    return Container(
      constraints: const BoxConstraints(minWidth: 110, minHeight: 110),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: CupertinoColors.darkBackgroundGray,
        borderRadius: borderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CupertinoActivityIndicator(radius: 20),
          if (msg != null)
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                msg!,
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
