import 'package:flutter/material.dart';

import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/typography.dart';

class AppBarCartButton extends StatelessWidget {
  final int numberOfItems;
  final VoidCallback onPress;

  const AppBarCartButton({
    Key? key,
    required this.onPress,
    required this.numberOfItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(
              Icons.shopping_basket_outlined,
              size: 26,
            ),
            if (numberOfItems > 0)
              Positioned(
                left: 0,
                bottom: 10,
                child: Container(
                  width: 15,
                  height: 15,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ThemeColors.errorMain,
                  ),
                  child: BodyS(
                    '$numberOfItems',
                    options: const TypographyOptions(
                      color: ThemeColors.white,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
