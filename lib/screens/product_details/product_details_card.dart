import 'package:flutter/material.dart';

import '../../styles/theme.dart';

class ProductDetailsCard extends StatelessWidget {
  final Widget child;

  const ProductDetailsCard({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double offset = 16;

    return Transform.translate(
      offset: const Offset(0.0, -offset),
      child: Stack(
        children: [
          const ProductDetailsCardHeader(),
          Container(
            color: ThemeColors.white,
            width: double.infinity,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsCardHeader extends StatelessWidget {
  const ProductDetailsCardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double offset = 16;

    return Transform.translate(
      offset: const Offset(0.0, -offset),
      child: Container(
        width: double.infinity,
        height: 2 * offset,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 16,
              blurRadius: 16,
              offset: Offset(0, -offset),
            ),
          ],
          color: ThemeColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
