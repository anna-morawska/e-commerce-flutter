import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products_provider.dart';
import '../../models/product.dart';
import '../../screens/user_products/product_item/user_product_item.dart';
import '../../styles/theme.dart';

class UserProductsList extends StatelessWidget {
  const UserProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadProducts = context.read<ProductsProvider>().loadProducts;

    return RefreshIndicator(
      onRefresh: loadProducts,
      color: ThemeColors.secondaryMain,
      child: Selector<ProductsProvider, List<Product>>(
        selector: (buildContext, provider) => provider.products,
        builder: (context, products, child) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return UserProductItem(
              id: product.id,
              imageUrl: product.imageUrl,
              title: product.title,
              price: product.price,
            );
          },
        ),
      ),
    );
  }
}
