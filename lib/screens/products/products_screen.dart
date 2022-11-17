import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/widgets/screen_wrapper.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/typography.dart';
import 'package:ecommerce_app/screens/products/app_bar_cart_button.dart';
import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/products/categories.dart';
import 'package:ecommerce_app/screens/products/product_list.dart';

import 'package:ecommerce_app/i18n/generated/l10n.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = '/products';

  const ProductsScreen({Key? key}) : super(key: key);

  void _navigateToCart(BuildContext context) {
    Navigator.pushNamed(context, CartScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      showDrawer: true,
      title: "",
      actions: [
        Selector<CartProvider, int>(
          selector: (buildContext, provider) => provider.numberOfItemsInTheCart,
          builder: (context, value, child) => AppBarCartButton(
            numberOfItems: value,
            onPress: () => _navigateToCart(context),
          ),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FractionallySizedBox(
            widthFactor: 0.7,
            child: H1(
              T.of(context).main_screen_title,
              options: const TypographyOptions(
                color: ThemeColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Categories(),
          const SizedBox(
            height: 24,
          ),
          const ProductsList()
        ],
      ),
    );
  }
}
