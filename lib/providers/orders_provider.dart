import 'dart:math';

import 'package:flutter/material.dart';

import '../models/order.dart';

class OrdersProvider extends ChangeNotifier {
  final List<Order> _orders = [
    Order(
      date: DateTime(2022, 8, 14),
      id: getRandomString(15).toString(),
      status: Order.getRandomOrderStatus(),
      trackingNumber: getRandomString(10),
      totalPrice: 123.45,
    ),
    Order(
      date: DateTime(2022, 8, 14),
      id: getRandomString(15).toString(),
      status: Order.getRandomOrderStatus(),
      trackingNumber: getRandomString(10),
      totalPrice: 99.00,
    ),
  ];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder({
    required double priceTotal,
  }) {
    _orders.add(
      Order(
        date: DateTime.now(),
        id: getRandomString(15).toString(),
        status: Order.getRandomOrderStatus(),
        trackingNumber: getRandomString(10),
        totalPrice: priceTotal,
      ),
    );

    notifyListeners();
  }
}

String getRandomString(int length) {
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => _chars.codeUnitAt(
        _rnd.nextInt(_chars.length),
      ),
    ),
  );
}
