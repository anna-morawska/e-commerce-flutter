import 'package:flutter/material.dart';

import '../screens/products/products_screen.dart';
import '../styles/theme.dart';
import '../widgets/button.dart';
import '../widgets/typography.dart';

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
          child: TypographyH4(
            "Looks like you haven't made your choice yet...",
            color: ThemeColors.textSecondary,
            textAlign: TextAlign.center,
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
