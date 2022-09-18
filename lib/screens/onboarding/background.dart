import 'package:flutter/material.dart';

import '../../styles/theme.dart';

class Background extends StatelessWidget {
  final Widget child;
  final Widget footer;

  const Background({
    required this.footer,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            flex: 2,
            child: Container(
              color: ThemeColors.accent,
              child: Container(
                decoration: const BoxDecoration(
                  color: ThemeColors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: ThemeColors.accent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
            ),
          ),
        ]),
        child,
        Positioned(bottom: 0, right: 0, left: 0, child: footer),
      ],
    );
  }
}
