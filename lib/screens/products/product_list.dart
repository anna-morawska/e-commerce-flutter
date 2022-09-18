import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../providers/products_provider.dart';
import '../../models/product.dart';
import '../../screens/products/product_item.dart';
import '../../screens/product_details/product_details_screen.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  void _navigateToProductDetails(BuildContext context, String id) {
    final arguments = ProductDetailsScreenArguments(id: id);
    Navigator.pushNamed(
      context,
      ProductDetailsScreen.routeName,
      arguments: arguments,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ProductsProvider, List<Product>>(
      selector: (buildContext, provider) => provider.products,
      builder: (context, products, child) => Expanded(
        child: MasonryGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return GestureDetector(
              onTap: () => _navigateToProductDetails(
                context,
                product.id,
              ),
              child: ProductItem(
                id: product.id,
                imageUrl: product.imageUrl,
                title: product.title,
                price: product.price,
              ),
            );
          },
        ),
      ),
    );
  }
}
