import 'package:flutter/material.dart';

import '../../styles/theme.dart';
import '../../widgets/typography.dart';

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
            TypographyH4Light(
              title,
              height: 1,
              color: ThemeColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
