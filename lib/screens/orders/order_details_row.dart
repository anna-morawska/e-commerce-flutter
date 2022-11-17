import 'package:flutter/material.dart';

import 'package:ecommerce_app/widgets/typography.dart';

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
          Body(title),
          if (data != null) BodyS(data!),
          if (child != null) child!,
        ],
      ),
    );
  }
}
