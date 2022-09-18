import 'package:flutter/material.dart';

import '../../styles/theme.dart';
import '../../widgets/typography.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final bool isSelected;

  const CategoryItem({
    required this.categoryName,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        // height: 100,
        margin: const EdgeInsets.only(right: 8, bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: isSelected ? ThemeColors.accent : ThemeColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: ThemeColors.textSecondary,
              width: 1,
              style: BorderStyle.solid,
            )),
        child: TypographyBody(
          categoryName,
          color: isSelected ? ThemeColors.white : ThemeColors.textPrimary,
        ),
      ),
    );
  }
}
