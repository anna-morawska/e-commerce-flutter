import 'package:flutter/material.dart';

import '../../widgets/typography.dart';

class OrderDetailsRow extends StatelessWidget {
  final String title;
  final String? data;
  final Widget? child;

  const OrderDetailsRow({
    Key? key,
    required this.title,
    this.child,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TypographyBody(title),
          if (data != null) TypographyH5(data!),
          if (child != null) child!,
        ],
      ),
    );
  }
}
