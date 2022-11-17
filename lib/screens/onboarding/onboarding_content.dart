import 'package:flutter/material.dart';

import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/typography.dart';
import 'package:ecommerce_app/widgets/screen_padding.dart';

class OnboardingContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingContent({
    required this.description,
    required this.imagePath,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: Column(children: [
        SizedBox(
          width: 150,
          height: 200,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              const Spacer(),
              H2(
                title,
                options: const TypographyOptions(
                  color: ThemeColors.white,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Body(
                description,
                options: const TypographyOptions(
                  textAlign: TextAlign.center,
                  color: ThemeColors.white,
                ),
              ),
              const Spacer(),
            ],
          ),
        )
      ]),
    );
  }
}
