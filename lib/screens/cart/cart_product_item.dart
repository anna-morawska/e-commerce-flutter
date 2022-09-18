import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart_item.dart';
import '../../providers/products_provider.dart';
import '../../styles/theme.dart';
import '../../widgets/typography.dart';

class CartProductItem extends StatelessWidget {
  final CartItem cartItem;

  const CartProductItem({
    required this.cartItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product =
        context.read<ProductsProvider>().getProductById(cartItem.productId);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: ThemeColors.accent.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 80,
              height: 100,
              child: Image.asset(
                product.imageUrl,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TypographyH4(product.title),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const TypographyH5("Color:"),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cartItem.color,
                    ),
                  ),
                  const TypographyH5("Size: "),
                  TypographyH5(cartItem.size.name),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TypographyH5Bold(
                "\$${cartItem.price}",
              ),
            ],
          )
        ],
      ),
    );
  }
}
