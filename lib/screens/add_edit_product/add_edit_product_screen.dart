import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/add_edit_product/add_edit_product_form.dart';
import '../../widgets/screen_wrapper.dart';
import '../../providers/products_provider.dart';

class AddEditProductScreenArguments {
  final String? id;

  AddEditProductScreenArguments({
    this.id,
  });
}

class AddEditProductScreen extends StatelessWidget {
  static const routeName = '/add-edit-product';

  const AddEditProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as AddEditProductScreenArguments;

    final isEditMode = arguments.id != null;

    final editedProduct =
        context.read<ProductsProvider>().getEditableProduct(arguments.id);

    return ScreenWrapper(
      title: isEditMode ? "Edit Product" : "Add new product",
      child: AddEditProductForm(
        editedProduct,
      ),
    );
  }
}
