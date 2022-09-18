import 'package:flutter/material.dart';

enum Size {
  small,
  medium,
  large,
}

extension SizeExtension on Size {
  String get name {
    switch (this) {
      case Size.large:
        return "L";

      case Size.medium:
        return "M";

      case Size.small:
        return "S";
    }
  }
}

class CartItem {
  final String id;
  final String productId;
  final int quantity;
  final Size size;
  final double price;
  final Color color;

  CartItem({
    required this.color,
    required this.id,
    required this.productId,
    required this.quantity,
    required this.size,
    required this.price,
  });
}
