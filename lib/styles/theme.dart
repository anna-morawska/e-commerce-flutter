import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  canvasColor: ThemeColors.white,
  primaryColor: ThemeColors.accent,
  fontFamily: 'Lato',
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: ThemeColors.secondaryMain),
);

class ThemeColors {
  static const Color background = const Color.fromRGBO(245, 245, 245, 1);

  static const Color white = Color(0xFFFFFFFF);

  static const Color textSecondary = const Color.fromRGBO(110, 110, 110, 1);
  static const Color textPrimary = const Color.fromRGBO(0, 0, 0, 0.8);

  static const Color secondaryMain = const Color.fromRGBO(182, 141, 64, 1);
  // static Color sth = const Color.fromRGBO(244, 235, 208, 1);
  static const Color accent = const Color.fromRGBO(18, 38, 32, 1);

  static const Color errorMain = const Color.fromRGBO(255, 79, 79, 1);
  static const Color successMain = const Color.fromRGBO(45, 169, 102, 1);
  static const Color warningMain = const Color.fromRGBO(255, 152, 0, 1);

  static const Color backgroundPaper = const Color.fromRGBO(247, 247, 247, 1);
}
