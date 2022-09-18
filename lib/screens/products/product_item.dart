import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../styles/theme.dart';
import '../../widgets/typography.dart';
import '../../providers/products_provider.dart';
import '../../widgets/image.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final double price;

  const ProductItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CustomImage(imageUrl: imageUrl),
            ToggleFavoriteButton(id: id),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TypographyH5Bold(
          title,
        ),
        const SizedBox(
          height: 4,
        ),
        TypographyH5(
          '\$$price',
        ),
      ],
    );
  }
}

class ToggleFavoriteButton extends StatelessWidget {
  final String id;

  const ToggleFavoriteButton({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toggleIsFavorite = context.read<ProductsProvider>().toggleIsFavorite;

    return Selector<ProductsProvider, bool>(
      builder: (context, isFavorite, child) => Positioned(
        right: 8,
        bottom: 8,
        child: GestureDetector(
          onTap: () => toggleIsFavorite(id),
          child: Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ThemeColors.white,
            ),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 16,
              color: ThemeColors.secondaryMain,
            ),
          ),
        ),
      ),
      selector: (buildContext, provider) => provider.isFavorite(id),
    );
  }
}
