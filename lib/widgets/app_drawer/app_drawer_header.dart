import 'package:flutter/material.dart';

import '../../styles/theme.dart';
import '../../widgets/typography.dart';

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 16,
          backgroundColor: ThemeColors.textSecondary,
          child: TypographyBody(
            "AM",
            color: ThemeColors.white,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TypographyH5(
              "Anna Morawska",
              color: ThemeColors.white,
            ),
            TypographyBody(
              "annak@mooncascade.com",
              color: ThemeColors.white,
            )
          ],
        )
      ],
    );
  }
}
