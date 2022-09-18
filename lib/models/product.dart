import 'package:flutter/material.dart';
import '../../models/codable.dart';

class Product implements Codable {
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  @override
  final String id;

  const Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}

class EditableProduct {
  late final String id;
  String? title;
  String? description;
  String? imageUrl;
  double? price;

  EditableProduct({
    String? id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
  }) {
    this.id = id ?? UniqueKey().toString();
  }
}
