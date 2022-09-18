import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/screen_wrapper.dart';
import '../../providers/cart_provider.dart';
import '../../providers/orders_provider.dart';
import '../../screens/cart/cart_screen_view.dart';
import '../../widgets/empty_screen_placeholder.dart';
import '../../screens/loading/loading_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({
    Key? key,
  }) : super(key: key);

  void _navigateToLoadingScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(LoadingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final cartTotal = cartProvider.cartTotal;
    final cartItems = cartProvider.cartItems;
    final removeCartItem = cartProvider.removeItem;
    final addOrder = context.read<OrdersProvider>().addOrder;

    return ScreenWrapper(
      title: "Cart",
      child: cartItems.isNotEmpty
          ? CartScreenView(
              onConfirmPress: () {
                addOrder(priceTotal: cartTotal);
                _navigateToLoadingScreen(context);
              },
              cartItems: cartItems,
              cartTotal: cartTotal,
              removeCartItem: removeCartItem,
            )
          : const EmptyScreenPlaceholder(),
    );
  }
}
