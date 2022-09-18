import 'package:flutter/material.dart';

import '../widgets/typography.dart';
import '../styles/theme.dart';

class CustomSnackBar {
  static showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Expanded(
          child: TypographyBody(
            text,
            textAlign: TextAlign.center,
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
        content: TypographyBody(
          text,
          textAlign: TextAlign.center,
        ),
        backgroundColor: ThemeColors.errorMain,
      ),
    );
  }
}
