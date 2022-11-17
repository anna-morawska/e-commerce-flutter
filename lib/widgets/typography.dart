import 'package:flutter/material.dart';

import 'package:ecommerce_app/styles/theme.dart';

class TypographyOptions {
  final Color? color;
  final TextAlign? textAlign;

  const TypographyOptions({
    this.color,
    this.textAlign,
  });
}

class BaseTypography extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final double height;
  final TypographyOptions? options;

  const BaseTypography(
    this.text, {
    required this.fontWeight,
    required this.fontSize,
    required this.height,
    this.options,
    super.key,
  });

  Color get color => options?.color ?? ThemeColors.textPrimary;
  TextAlign get textAlign => options?.textAlign ?? TextAlign.left;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      style: TextStyle(
        fontFamily: 'SFPro',
        height: height,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class H1 extends BaseTypography {
  const H1(
    super.text, {
    super.options,
    super.key,
  }) : super(
          fontWeight: FontWeight.normal,
          fontSize: 40,
          height: 1.2,
        );
}

class H2 extends BaseTypography {
  const H2(
    super.text, {
    super.options,
    super.key,
  }) : super(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          height: 1,
        );
}

class H3 extends BaseTypography {
  const H3(
    super.text, {
    super.options,
    super.key,
  }) : super(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          height: 1.2,
        );
}

class BodyL extends BaseTypography {
  const BodyL(
    super.text, {
    super.options,
    super.key,
  }) : super(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          height: 1.34,
        );
}

class Body extends BaseTypography {
  const Body(
    super.text, {
    super.options,
    super.key,
  }) : super(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          height: 1.5,
        );
}

class BodyBold extends BaseTypography {
  const BodyBold(
    super.text, {
    super.options,
    super.key,
  }) : super(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.5,
        );
}

class BodyS extends BaseTypography {
  const BodyS(
    super.text, {
    super.options,
    super.key,
  }) : super(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          height: 1.3,
        );
}

class BodyBoldS extends BaseTypography {
  const BodyBoldS(
    super.text, {
    super.options,
    super.key,
  }) : super(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.3,
        );
}

class BodyXS extends BaseTypography {
  const BodyXS(
    super.text, {
    super.options,
    super.key,
  }) : super(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          height: 1.3,
        );
}

class BodyXXS extends BaseTypography {
  const BodyXXS(
    super.text, {
    super.options,
    super.key,
  }) : super(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          height: 1.4,
        );
}
