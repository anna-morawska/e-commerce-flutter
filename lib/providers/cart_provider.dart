import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  int get numberOfItemsInTheCart {
    return _cartItems.length;
  }

  List<CartItem> get cartItems {
    return [..._cartItems];
  }

  double get cartTotal {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }

  void removeItem(String id) {
    _cartItems.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void addItem({
    required String productId,
    required Size size,
    required Color color,
    required double price,
  }) {
    _cartItems.add(CartItem(
      color: color,
      id: UniqueKey().toString(),
      productId: productId,
      quantity: 1,
      size: size,
      price: price,
    ));

    notifyListeners();
  }
}
