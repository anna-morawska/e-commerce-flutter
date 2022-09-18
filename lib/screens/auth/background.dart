import 'dart:math';

import 'package:flutter/material.dart';

import '../../styles/theme.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Transform.rotate(
              angle: -pi / 50,
              child: Transform.translate(
                offset: const Offset(-10, 0),
                child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    color: ThemeColors.secondaryMain,
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                width: double.infinity,
                height: 110,
                color: ThemeColors.accent,
              ),
            ),
          ],
        ),
        Expanded(child: child)
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
