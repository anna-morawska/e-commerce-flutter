import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/codable.dart';
import '../models/http_exception.dart';

enum Endpoints { getProducts, addProduct, updateProduct, deleteProduct }

extension EndpointsExtension on Endpoints {
  String getUrl({String? id}) {
    switch (this) {
      case Endpoints.addProduct:
        return "/products.json";

      case Endpoints.getProducts:
        return "/products.json";

      case Endpoints.updateProduct:
        return "/products/$id.json";

      case Endpoints.deleteProduct:
        return "/products/$id.json";
    }
  }
}

class NetworkingService {
  static const authority =
      'ecommerce-flutter-e57cf-default-rtdb.europe-west1.firebasedatabase.app';

  Future<T?> makeGetRequest<T>({
    String unencodedPath = '/',
    required T Function(Map<String, dynamic>) decoder,
  }) async {
    final url = Uri.https(authority, unencodedPath);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return decoder(jsonResponse);
    } else {
      return null;
    }
  }

  Future<String?> makePostRequest<T extends Codable>({
    String unencodedPath = '/',
    required T payload,
  }) async {
    final url = Uri.https(authority, unencodedPath);

    final body = jsonEncode(payload,
        toEncodable: (Object? value) => value is Codable
            ? value.toJson()
            : throw UnsupportedError('Cannot convert to JSON: $value'));
    ;

    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      return jsonResponse['name'];
    } else {
      return null;
    }
  }

  Future<void> makePatchRequest<T extends Codable>({
    String unencodedPath = '/',
    required T payload,
  }) async {
    final url = Uri.https(authority, unencodedPath);

    final body = jsonEncode(payload,
        toEncodable: (Object? value) => value is Codable
            ? value.toJson()
            : throw UnsupportedError('Cannot convert to JSON: $value'));
    ;

    await http.patch(url, body: body);
  }

  Future<void> makeDeleteRequest<T extends Codable>({
    String unencodedPath = '/',
  }) async {
    final url = Uri.https(authority, unencodedPath);

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      throw HttpException("Could not delete product");
    }
  }
}
