import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../styles/theme.dart';
import '../../../widgets/typography.dart';
import '../../../widgets/image.dart';

class UserProductItemDetails extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;

  const UserProductItemDetails({
    required this.imageUrl,
    required this.title,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImage(
          imageUrl: imageUrl,
          width: 100,
          height: 80,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TypographyH6(
              DateFormat.yMMMMEEEEd().format(DateTime.now()),
              color: ThemeColors.textSecondary,
            ),
            const SizedBox(
              height: 4,
            ),
            TypographyBody(title),
            const SizedBox(
              height: 4,
            ),
            TypographyH5('\$${price.toStringAsFixed(2)}'),
          ],
        )
      ],
    );
  }
}
