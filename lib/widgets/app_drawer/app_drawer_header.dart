import 'package:flutter/material.dart';

import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/typography.dart';

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
          child: Body(
            "AM",
            options: TypographyOptions(
              color: ThemeColors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BodyBold(
              "Anna Morawska",
              options: TypographyOptions(
                color: ThemeColors.white,
              ),
            ),
            Body(
              "annak@mooncascade.com",
              options: TypographyOptions(
                color: ThemeColors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}
