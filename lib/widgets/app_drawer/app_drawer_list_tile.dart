import 'package:flutter/material.dart';

import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/typography.dart';

class AppDrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onPress;

  const AppDrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 48),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: ThemeColors.textSecondary,
              size: 18,
            ),
            const SizedBox(width: 16),
            BodyS(
              title,
              options: const TypographyOptions(
                color: ThemeColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
