import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/screen_wrapper.dart';
import '../../widgets/empty_screen_placeholder.dart';
import '../../providers/orders_provider.dart';
import '../../screens/orders/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrdersScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = context.read<OrdersProvider>().orders;

    return ScreenWrapper(
      title: "My Orders",
      showDrawer: true,
      child: orders.isEmpty
          ? const EmptyScreenPlaceholder()
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) => OrderItem(
                order: orders[index],
              ),
            ),
    );
  }
}
