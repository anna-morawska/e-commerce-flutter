import 'package:flutter/material.dart';

import '../styles/theme.dart';

class TextFormFieldInput extends StatelessWidget {
  final String hint;
  final String? initialValue;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final String? Function(String?)? validator;

  final int maxLines;

  const TextFormFieldInput({
    Key? key,
    required this.hint,
    this.suffixIcon,
    this.initialValue,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.focusNode,
    this.onEditingComplete,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        maxLines: maxLines,
        initialValue: initialValue,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        controller: controller,
        enableInteractiveSelection: true,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: ThemeColors.accent,
            ),
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: ThemeColors.textSecondary,
          ),
          hintText: hint,
        ),
      ),
    );
  }
}
