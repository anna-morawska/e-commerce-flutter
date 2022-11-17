import 'package:flutter/material.dart';

import 'package:ecommerce_app/widgets/typography.dart';
import 'package:ecommerce_app/models/order.dart';

class OrderStatus extends StatelessWidget {
  final OrderStatusType statusType;

  const OrderStatus({
    Key? key,
    required this.statusType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: statusType.color,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Body(
            statusType.name,
            options: TypographyOptions(
              color: statusType.color,
            ),
          ),
        ],
      ),
    );
  }
}
