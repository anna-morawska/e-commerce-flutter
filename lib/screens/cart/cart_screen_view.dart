import 'package:flutter/material.dart';

import '../../styles/theme.dart';
import '../../widgets/button.dart';
import '../../screens/cart/cart_product_item.dart';
import '../../widgets/typography.dart';
import '../../models/cart_item.dart';

class CartScreenView extends StatelessWidget {
  final double cartTotal;
  final List<CartItem> cartItems;
  final Function removeCartItem;
  final VoidCallback onConfirmPress;

  const CartScreenView({
    required this.cartItems,
    required this.cartTotal,
    required this.removeCartItem,
    required this.onConfirmPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (ctx, index) {
              final cartItem = cartItems[index];
              final itemId = cartItem.id;

              return Dismissible(
                onDismissed: (direction) {
                  removeCartItem(itemId);
                },
                direction: DismissDirection.endToStart,
                background: Container(
                  padding: const EdgeInsets.only(right: 16),
                  alignment: Alignment.centerRight,
                  color: ThemeColors.errorMain,
                  child: const Icon(
                    Icons.delete,
                    color: ThemeColors.white,
                  ),
                ),
                key: Key(itemId),
                child: CartProductItem(
                  cartItem: cartItem,
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TypographyH1("Total:"),
            TypographyH1("\$${cartTotal.toStringAsFixed(2)}"),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Button(
          "Confirm order",
          icon: Icons.credit_card_outlined,
          onPress: onConfirmPress,
        )
      ],
    );
  }
}
