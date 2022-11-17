import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/typography.dart';
import 'package:ecommerce_app/widgets/image.dart';

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
            BodyXXS(
              DateFormat.yMMMMEEEEd().format(DateTime.now()),
              options: const TypographyOptions(
                color: ThemeColors.textSecondary,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Body(title),
            const SizedBox(
              height: 4,
            ),
            BodyXS('\$${price.toStringAsFixed(2)}'),
          ],
        )
      ],
    );
  }
}
