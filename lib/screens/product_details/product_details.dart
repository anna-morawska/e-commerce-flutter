import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../styles/theme.dart';
import '../../widgets/button.dart';
import '../../screens/product_details/colors_picker.dart';
import '../../screens/product_details/size_picker.dart';
import '../../widgets/typography.dart';
import '../../models/cart_item.dart';
import '../../models/product.dart';
import '../../widgets/snack_bar.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  static const sampleColors = [
    Color.fromRGBO(122, 108, 93, 1),
    Color.fromRGBO(42, 61, 69, 1),
    Color.fromRGBO(221, 201, 180, 1),
    Color.fromRGBO(193, 124, 116, 1),
  ];

  var _selectedSize = Size.small;
  var _selectedColorIndex = sampleColors.length - 1;

  void _onColorSelection(int index) {
    setState(() {
      _selectedColorIndex = index;
    });
  }

  void _onSizeSelection(Size size) {
    setState(() {
      _selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    final addItem = context.read<CartProvider>().addItem;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TypographyH1(
              widget.product.title,
            ),
            TypographyH1(
              "\$${widget.product.price}",
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        TypographyBody(
          widget.product.description,
          color: ThemeColors.textSecondary,
        ),
        const SizedBox(
          height: 24,
        ),
        ColorsPicker(
          colors: sampleColors,
          onSelectionChange: _onColorSelection,
          selectedIndex: _selectedColorIndex,
        ),
        const SizedBox(
          height: 24,
        ),
        SizePicker(
          selectedSize: _selectedSize,
          onSelectionChange: _onSizeSelection,
        ),
        const SizedBox(
          height: 32,
        ),
        Button(
          "Add to cart",
          icon: Icons.shopping_basket_outlined,
          onPress: () {
            addItem(
              color: sampleColors[_selectedColorIndex],
              price: widget.product.price,
              productId: widget.product.id,
              size: _selectedSize,
            );

            Navigator.of(context).pop();

            CustomSnackBar.showSnackBar(
                context, "Item successfully added to the cart");
          },
        ),
      ],
    );
  }
}
