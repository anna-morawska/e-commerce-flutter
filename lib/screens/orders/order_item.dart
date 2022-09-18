import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/order.dart';
import '../../screens/orders/oder_status.dart';
import '../../screens/orders/order_details_row.dart';
import '../../styles/theme.dart';
import '../../widgets/typography.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              TypographyH5Bold(
                "Order #${order.id}",
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          OrderDetailsRow(
            title: "Date: ",
            data: DateFormat.yMMMEd().format(order.date),
          ),
          OrderDetailsRow(
            title: "Total: ",
            data: '\$${order.totalPrice}',
          ),
          OrderDetailsRow(
            title: "Tracking number: ",
            data: "#${order.trackingNumber}",
          ),
          OrderDetailsRow(
            title: "Status: ",
            child: OrderStatus(
              statusType: order.status,
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            width: 2,
            color: ThemeColors.backgroundPaper,
          )),
    );
  }
}
