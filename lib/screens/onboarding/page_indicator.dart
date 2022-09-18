import 'package:flutter/material.dart';
import '../../widgets/screen_padding.dart';
import '../../styles/theme.dart';

class PageIndicator extends StatelessWidget {
  final int numberOfPages;
  final int currentIndex;

  const PageIndicator({
    required this.numberOfPages,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(numberOfPages, (index) {
          final isActive = currentIndex == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isActive
                  ? ThemeColors.white
                  : ThemeColors.white.withOpacity(0.6),
            ),
          );
        }),
      ),
    );
  }
}
