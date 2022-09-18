import 'package:flutter/material.dart';

class ScreenPadding extends StatelessWidget {
  final Widget child;

  const ScreenPadding({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
