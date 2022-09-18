import 'package:flutter/material.dart';

import '../styles/theme.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final IconData suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  const TextInput({
    Key? key,
    required this.hint,
    required this.suffixIcon,
    required this.controller,
    required this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enableInteractiveSelection: true,
      obscureText: obscureText,
      keyboardType: keyboardType,
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
    );
  }
}
