import 'dart:math';

import 'package:flutter/material.dart';

import '../styles/theme.dart';

enum OrderStatusType {
  completed,
  inProgress,
  rejected,
}

extension SizeExtension on OrderStatusType {
  String get name {
    switch (this) {
      case OrderStatusType.completed:
        return "Completed";

      case OrderStatusType.rejected:
        return "Rejected";

      case OrderStatusType.inProgress:
        return "In Progress";
    }
  }

  Color get color {
    switch (this) {
      case OrderStatusType.completed:
        return ThemeColors.successMain;

      case OrderStatusType.rejected:
        return ThemeColors.errorMain;

      case OrderStatusType.inProgress:
        return ThemeColors.warningMain;
    }
  }
}

class Order {
  final String id;
  final DateTime date;
  final OrderStatusType status;
  final double totalPrice;
  final String trackingNumber;

  static OrderStatusType getRandomOrderStatus() {
    final index = Random().nextInt(3);

    switch (index) {
      case 0:
        return OrderStatusType.completed;

      case 1:
        return OrderStatusType.inProgress;

      case 2:
        return OrderStatusType.rejected;

      default:
        return OrderStatusType.completed;
    }
  }

  Order({
    required this.date,
    required this.id,
    required this.status,
    required this.trackingNumber,
    required this.totalPrice,
  });
}
