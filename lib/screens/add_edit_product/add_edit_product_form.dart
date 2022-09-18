import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/add_edit_product/product_image_preview.dart';
import '../../widgets/text_form_field_input.dart';
import '../../models/product.dart';
import '../../widgets/snack_bar.dart';
import '../../providers/products_provider.dart';
import '../../widgets/button.dart';

class AddEditProductForm extends StatefulWidget {
  late final EditableProduct editableProduct;
  late final TextEditingController imageUrlController;

  AddEditProductForm(EditableProduct editableProductParam, [Key? key])
      : super(key: key) {
    editableProduct = editableProductParam;
    imageUrlController = TextEditingController(text: editableProduct.imageUrl);
  }

  @override
  State<AddEditProductForm> createState() => _AddEditProductFormState();
}

class _AddEditProductFormState extends State<AddEditProductForm> {
  var _isLoading = false;

  final _titleFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  void _setFieldFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void _saveForm() async {
    try {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        await makeAPIcall();
        Navigator.of(context).pop();
      }
    } catch (e) {
      CustomSnackBar.showErrorSnackBar(context, "Something went wrong...");
    }
  }

  Future<void> makeAPIcall() async {
    try {
      setState(() {
        _isLoading = true;
      });

      _formKey.currentState!.save();

      final saveProduct = context.read<ProductsProvider>().saveProduct;
      await saveProduct(
        id: widget.editableProduct.id,
        description: widget.editableProduct.description!,
        imageUrl: widget.editableProduct.imageUrl!,
        price: widget.editableProduct.price!,
        title: widget.editableProduct.title!,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _forceRerender() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _titleFocusNode.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    widget.imageUrlController.dispose();
  }

  String? _isRequiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? _isValidPriceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (double.tryParse(value) == null || double.parse(value) <= 0) {
      return 'Please enter a valid price';
    }

    return null;
  }

  String? _isValidUrlValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    var urlPattern =
        r"(https?|ftp)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
    if (!RegExp(urlPattern, caseSensitive: false).hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ProductImagePreview(imageUrl: widget.imageUrlController.text),
          TextFormFieldInput(
            hint: "Image URL",
            controller: widget.imageUrlController,
            keyboardType: TextInputType.url,
            textInputAction: TextInputAction.next,
            onEditingComplete: _forceRerender,
            validator: _isValidUrlValidator,
            onFieldSubmitted: (_) => _setFieldFocus(_titleFocusNode),
            onSaved: (newValue) {
              widget.editableProduct.imageUrl = newValue;
            },
          ),
          TextFormFieldInput(
            hint: "Title",
            initialValue: widget.editableProduct.title,
            textInputAction: TextInputAction.next,
            focusNode: _titleFocusNode,
            onFieldSubmitted: (_) => _setFieldFocus(_priceFocusNode),
            validator: _isRequiredValidator,
            onSaved: (newValue) {
              widget.editableProduct.title = newValue;
            },
          ),
          TextFormFieldInput(
            hint: "Price",
            initialValue: widget.editableProduct.price != null
                ? widget.editableProduct.price.toString()
                : "",
            keyboardType: const TextInputType.numberWithOptions(signed: true),
            textInputAction: TextInputAction.next,
            focusNode: _priceFocusNode,
            onFieldSubmitted: (_) => _setFieldFocus(_descriptionFocusNode),
            validator: _isValidPriceValidator,
            onSaved: (newValue) {
              if (newValue != null && newValue != "") {
                widget.editableProduct.price = double.parse(newValue);
              }
            },
          ),
          TextFormFieldInput(
            hint: "Description",
            initialValue: widget.editableProduct.description,
            keyboardType: TextInputType.multiline,
            focusNode: _descriptionFocusNode,
            maxLines: 3,
            validator: _isRequiredValidator,
            onSaved: (newValue) {
              widget.editableProduct.description = newValue;
            },
          ),
          const Spacer(),
          Button(
            "Submit",
            isLoading: _isLoading,
            icon: Icons.save,
            onPress: _saveForm,
          )
        ],
      ),
    );
  }
}
