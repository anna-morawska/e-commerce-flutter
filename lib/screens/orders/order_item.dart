import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/screens/orders/oder_status.dart';
import 'package:ecommerce_app/screens/orders/order_details_row.dart';
import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/typography.dart';

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
              BodyBold(
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
