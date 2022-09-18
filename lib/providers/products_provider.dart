import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../services/networking_service.dart';

import '../models/product.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> _products = [];
  final Set<String> _favorites = {};
  final _api = NetworkingService();

  ProductsProvider() {
    loadProducts();
  }

  List<Product> get products {
    return [..._products];
  }

  bool isFavorite(String productId) {
    return _favorites.contains(productId);
  }

  Future<void> loadProducts() async {
    final products = await _api.makeGetRequest(
        unencodedPath: Endpoints.getProducts.getUrl(),
        decoder: (map) {
          final List<Product> productList = [];

          map.forEach((key, value) {
            productList.add(Product(
              id: key,
              title: value['title'],
              imageUrl: value['imageUrl'],
              description: value['description'],
              price: value['price'] + .0,
            ));
          });

          return productList;
        });

    _products = products ?? [];
    notifyListeners();
  }

  void toggleIsFavorite(String productId) {
    if (_favorites.contains(productId)) {
      _favorites.remove(productId);
    } else {
      _favorites.add(productId);
    }
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    final serverSideId = await _api.makePostRequest(
        unencodedPath: Endpoints.addProduct.getUrl(), payload: product);

    if (serverSideId != null) {
      _products.add(Product(
        id: serverSideId,
        title: product.title,
        imageUrl: product.imageUrl,
        description: product.description,
        price: product.price,
      ));
      notifyListeners();
    }
  }

  Future<void> updateProduct(String id, Product updatedProduct) async {
    await _api.makePatchRequest(
        unencodedPath: Endpoints.updateProduct.getUrl(id: id),
        payload: updatedProduct);

    final index = _products.indexWhere((product) => product.id == id);
    _products[index] = updatedProduct;

    notifyListeners();
  }

  Future<void> saveProduct({
    required String id,
    required String description,
    required String imageUrl,
    required double price,
    required String title,
  }) {
    final newProduct = Product(
      id: id,
      title: title,
      imageUrl: imageUrl,
      description: description,
      price: price,
    );

    final originalProduct =
        _products.firstWhereOrNull((product) => product.id == id);

    if (originalProduct == null) {
      return addProduct(newProduct);
    } else {
      return updateProduct(originalProduct.id, newProduct);
    }
  }

  Future<void> removeProduct({
    required String id,
  }) async {
    // optimistically update UI
    final index = _products.indexWhere(
      (product) => product.id == id,
    );
    Product? cachedProduct = _products[index];
    _products.removeAt(index);

    try {
      await _api.makeDeleteRequest(
          unencodedPath: Endpoints.deleteProduct.getUrl(id: id));
    } catch (error) {
      _products.insert(index, cachedProduct);
      // deal with the error in the UI
      rethrow;
    } finally {
      cachedProduct = null;
    }

    notifyListeners();
  }

  EditableProduct getEditableProduct(String? id) {
    if (id == null) {
      return EditableProduct();
    }

    final product = _products.firstWhere((element) => element.id == id);

    return EditableProduct(
      id: product.id,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
      title: product.title,
    );
  }

  Product getProductById(String id) {
    return _products.firstWhere((element) => element.id == id);
  }
}
