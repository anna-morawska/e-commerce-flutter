import 'package:flutter/material.dart';

import '../../../styles/theme.dart';
import '../../../screens/user_products/product_item/action_buttons.dart';
import '../../../screens/user_products/product_item/product_item_details.dart';
import '../../../screens/user_products/product_item/stats.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final double price;

  const UserProductItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserProductItemDetails(
            imageUrl: imageUrl,
            title: title,
            price: price,
          ),
          const SizedBox(
            height: 16,
          ),
          const Stats(),
          const SizedBox(
            height: 16,
          ),
          ActionButtons(
            productId: id,
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          width: 2,
          color: ThemeColors.backgroundPaper,
        ),
      ),
    );
  }
}
