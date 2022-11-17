import 'package:flutter/material.dart';

import 'package:ecommerce_app/screens/products/products_screen.dart';
import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/typography.dart';

class EmptyScreenPlaceholder extends StatelessWidget {
  const EmptyScreenPlaceholder({
    Key? key,
  }) : super(key: key);

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, ProductsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Image.asset(
          'lib/assets/img/empty_cart.jpeg',
          fit: BoxFit.contain,
        ),
        const FractionallySizedBox(
          widthFactor: 0.7,
          child: H3(
            "Looks like you haven't made your choice yet...",
            options: TypographyOptions(
              color: ThemeColors.textSecondary,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Spacer(),
        Button(
          "Continue Shopping",
          onPress: () => _navigateToHomeScreen(context),
        ),
      ],
    );
  }
}
