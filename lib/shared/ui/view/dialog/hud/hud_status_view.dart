// Author: Dean.Liu
// DateTime: 2022/08/30 12:03

import 'package:flutter/cupertino.dart';

class HudStatusView extends StatelessWidget {
  const HudStatusView({
    super.key,
    required this.image,
    required this.msg,
    this.color,
  });

  final String image;
  final String msg;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    final maxWidth = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(
        minWidth: 110,
        minHeight: 110,
        maxWidth: maxWidth - 50 * 2,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: CupertinoColors.darkBackgroundGray,
        borderRadius: borderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color ?? CupertinoColors.systemRed,
              borderRadius: const BorderRadius.all(Radius.circular(19)),
            ),
            child: Image.asset(
              image,
              width: 32,
              height: 32,
            ),
          ),
          if (msg.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                msg,
                textAlign: TextAlign.center,
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
