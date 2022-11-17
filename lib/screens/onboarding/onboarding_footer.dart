import 'package:flutter/material.dart';

import 'package:ecommerce_app/screens/onboarding/page_indicator.dart';
import 'package:ecommerce_app/widgets/screen_padding.dart';
import 'package:ecommerce_app/widgets/typography.dart';
import 'package:ecommerce_app/styles/theme.dart';

class OnboardingFooter extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onNextPress;
  final VoidCallback onSkipPress;

  const OnboardingFooter({
    required this.currentIndex,
    required this.onNextPress,
    required this.onSkipPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onSkipPress,
            child: const BodyBold(
              'Skip',
              options: TypographyOptions(
                color: ThemeColors.textSecondary,
              ),
            ),
          ),
          PageIndicator(
            numberOfPages: 3,
            currentIndex: currentIndex,
          ),
          GestureDetector(
            onTap: onNextPress,
            child: const BodyBold(
              'Next',
              options: TypographyOptions(
                color: ThemeColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
