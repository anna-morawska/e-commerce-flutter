import 'package:flutter/material.dart';

import '../../screens/onboarding/page_indicator.dart';
import '../../widgets/screen_padding.dart';
import '../../widgets/typography.dart';
import '../../styles/theme.dart';

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
            child: const TypographyH4Light(
              'Skip',
              color: ThemeColors.white,
            ),
          ),
          PageIndicator(numberOfPages: 3, currentIndex: currentIndex),
          GestureDetector(
            onTap: onNextPress,
            child: const TypographyH4Light(
              'Next',
              color: ThemeColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
