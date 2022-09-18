import 'package:flutter/material.dart';

import '../styles/theme.dart';

class BaseTypography extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final double? height;

  const BaseTypography(
    this.text, {
    Key? key,
    this.color = ThemeColors.textPrimary,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
    this.height = 1.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      style: TextStyle(
        wordSpacing: 3,
        fontFamily: 'Lato',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        height: height,
      ),
    );
  }
}

class TypographyBody extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double? height;

  const TypographyBody(
    this.text, {
    this.color,
    this.textAlign,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTypography(
      text,
      color: color,
      textAlign: textAlign,
      height: height,
    );
  }
}

class TypographyTitleBold extends StatelessWidget {
  final String text;

  const TypographyTitleBold(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTypography(
      text,
      fontWeight: FontWeight.w900,
      fontSize: 26,
    );
  }
}

class TypographyTitle extends StatelessWidget {
  final String text;

  const TypographyTitle(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTypography(
      text,
      fontWeight: FontWeight.w400,
      fontSize: 26,
      color: ThemeColors.textSecondary,
    );
  }
}

class TypographyH4Light extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double? height;

  const TypographyH4Light(
    this.text, {
    this.color,
    this.textAlign,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTypography(
      text,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: color,
      textAlign: textAlign,
      height: height,
    );
  }
}

class TypographyH4 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double? height;

  const TypographyH4(
    this.text, {
    this.color,
    this.textAlign,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTypography(
      text,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: color,
      textAlign: textAlign,
      height: height,
    );
  }
}

class TypographyH5 extends StatelessWidget {
  final String text;
  final Color? color;

  const TypographyH5(
    this.text, {
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTypography(
      text,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: color,
    );
  }
}

class TypographyH5Bold extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double? height;

  const TypographyH5Bold(
    this.text, {
    this.color,
    this.textAlign,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTypography(
      text,
      fontWeight: FontWeight.w900,
      fontSize: 14,
      color: color,
      textAlign: textAlign,
      height: height,
    );
  }
}

class TypographyH1 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const TypographyH1(
    this.text, {
    this.color,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTypography(
      text,
      fontWeight: FontWeight.w900,
      fontSize: 22,
      color: color,
      textAlign: textAlign,
    );
  }
}

class TypographyH2 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const TypographyH2(
    this.text, {
    this.color,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTypography(
      text,
      fontWeight: FontWeight.w900,
      fontSize: 18,
      color: color,
      textAlign: textAlign,
    );
  }
}

class TypographyCaption extends StatelessWidget {
  final String text;
  final Color? color;

  const TypographyCaption(
    this.text, {
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTypography(
      text,
      fontWeight: FontWeight.w900,
      fontSize: 8,
      color: color,
    );
  }
}

class TypographyH6 extends StatelessWidget {
  final String text;
  final Color? color;

  const TypographyH6(
    this.text, {
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTypography(
      text,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: color,
    );
  }
}
