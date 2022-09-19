import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../widgets/button.dart';
import '../../../widgets/snack_bar.dart';
import '../../../providers/products_provider.dart';
import '../../../screens/add_edit_product/add_edit_product_screen.dart';

class ActionButtons extends StatelessWidget {
  final String productId;

  const ActionButtons({
    required this.productId,
    Key? key,
  }) : super(key: key);

  void _removeProduct(BuildContext context) async {
    try {
      await context.read<ProductsProvider>().removeProduct(
            id: productId,
          );
    } catch (error) {
      CustomSnackBar.showErrorSnackBar(
        context,
        error.toString(),
      );
    }
  }

  void _editProduct(BuildContext context) {
    Navigator.of(context).pushNamed(
      AddEditProductScreen.routeName,
      arguments: AddEditProductScreenArguments(
        id: productId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Button(
            'Edit',
            buttonType: ButtonType.outlined,
            buttonSize: ButtonSize.small,
            onPress: () => _editProduct(context),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Button(
            'Remove',
            buttonSize: ButtonSize.small,
            onPress: () => _removeProduct(context),
          ),
        ),
      ],
    );
  }
}
