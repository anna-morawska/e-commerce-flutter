import 'package:flutter/material.dart';

import 'package:ecommerce_app/widgets/typography.dart';
import 'package:ecommerce_app/styles/theme.dart';

class CustomSnackBar {
  static showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Expanded(
          child: Body(
            text,
            options: const TypographyOptions(
              textAlign: TextAlign.center,
            ),
          ),
        ),
        backgroundColor: ThemeColors.secondaryMain,
      ),
    );
  }

  static showErrorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Body(
          text,
          options: const TypographyOptions(
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: ThemeColors.errorMain,
      ),
    );
  }
}
