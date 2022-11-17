import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/widgets/typography.dart';
import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/models/cart_item.dart';

class SizePicker extends StatelessWidget {
  final Size selectedSize;
  final Function onSelectionChange;

  const SizePicker({
    required this.onSelectionChange,
    required this.selectedSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BodyBold('Size'),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: Size.values.mapIndexed(
            (index, size) {
              return GestureDetector(
                onTap: () => onSelectionChange(size),
                child: SizeSample(
                  size.name,
                  isSelected: selectedSize == size,
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}

class SizeSample extends StatelessWidget {
  final String size;
  final bool isSelected;

  const SizeSample(
    this.size, {
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  static double dimensions = 34;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: dimensions,
          height: dimensions,
          alignment: Alignment.center,
          child: BodyBold(
            size,
            options: TypographyOptions(
              color: isSelected ? ThemeColors.white : ThemeColors.accent,
            ),
          ),
          decoration: BoxDecoration(
            color:
                isSelected ? ThemeColors.accent : ThemeColors.backgroundPaper,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
