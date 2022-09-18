import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../widgets/typography.dart';
import '../../styles/theme.dart';

class ColorsPicker extends StatelessWidget {
  final List<Color> colors;
  final int selectedIndex;
  final Function onSelectionChange;

  const ColorsPicker({
    required this.colors,
    required this.onSelectionChange,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TypographyH5Bold('Colors'),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: colors.mapIndexed(
            (index, color) {
              return GestureDetector(
                onTap: () => onSelectionChange(index),
                child: ColorSample(
                  color,
                  isSelected: index == selectedIndex,
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}

class ColorSample extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorSample(
    this.color, {
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  static double border = 2;
  static double outer = 32;
  static double innerDimension = outer - border;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 4),
          width: outer,
          height: outer,
          decoration: BoxDecoration(
            color: isSelected ? ThemeColors.accent : ThemeColors.white,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 4),
          width: innerDimension,
          height: innerDimension,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              width: border,
              color: ThemeColors.white,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ],
    );
  }
}
