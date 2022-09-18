import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products_provider.dart';
import '../../models/product.dart';
import '../../styles/theme.dart';
import '../../widgets/image.dart';
import '../../widgets/screen_wrapper.dart';
import '../../screens/product_details/product_details.dart';
import '../../screens/product_details/product_details_card.dart';

class ProductDetailsScreenArguments {
  final String id;

  ProductDetailsScreenArguments({
    required this.id,
  });
}

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details';

  const ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as ProductDetailsScreenArguments;

    final toggleIsFavorite = context.read<ProductsProvider>().toggleIsFavorite;

    return ScreenWrapper(
      addScreenPadding: false,
      actions: [
        Selector<ProductsProvider, bool>(
          builder: (context, isFavorite, child) => GestureDetector(
            onTap: () => toggleIsFavorite(arguments.id),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 24,
                color: ThemeColors.secondaryMain,
              ),
            ),
          ),
          selector: (buildContext, provider) =>
              provider.isFavorite(arguments.id),
        )
      ],
      title: "Product details",
      child: Selector<ProductsProvider, Product>(
        selector: (buildContext, provider) =>
            provider.getProductById(arguments.id),
        builder: (context, product, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: CustomImage(
              withRoundedCorners: false,
              imageUrl: product.imageUrl,
              width: double.infinity,
            )),
            ProductDetailsCard(
              child: ProductDetails(
                product: product,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
