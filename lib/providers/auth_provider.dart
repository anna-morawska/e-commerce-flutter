import 'package:ecommerce_app/models/create_account_payload.dart';
import 'package:ecommerce_app/models/firebase_auth_exception.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/config/secrets.dart' as secrets;
import 'package:ecommerce_app/services/networking_service.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  String? _email;

  final _api = NetworkingService(
    secrets.FIREBASE_AUTH_REST_API,
  );

  bool get isAuthenticated {
    return _isTokenValid;
  }

  String? get token {
    if (_isTokenValid) {
      return _token;
    }
    return null;
  }

  bool get _isTokenValid {
    if (_token == null) {
      return false;
    }

    if (_expiryDate == null) {
      return false;
    }

    if (_expiryDate!.isBefore(DateTime.now())) {
      return false;
    }

    return true;
  }

  Future<void> signUp(
    FirebaseAuthPayload payload,
  ) async {
    final response = await _api.makePostRequest(
      unencodedPath: Endpoints.createAccount.getUrl(),
      queryParameters: {'key': secrets.FIREBASE_API_KEY},
      payload: payload,
    );

    if (response != null && response['error'] != null) {
      throw FirebaseAuthException(
        response['error']['message'],
      );
    } else {
      _onSuccess(response);
    }
  }

  void _onSuccess(dynamic response) {
    _token = response['idToken'];
    _userId = response['localId'];
    _email = response['email'];
    _expiryDate = _parseExpiryDate(response);

    notifyListeners();
  }

  DateTime _parseExpiryDate(dynamic response) {
    final expiresInString = response['expiresIn'];
    final expiresIn = int.parse(expiresInString);
    return DateTime.now().add(Duration(seconds: expiresIn));
  }

  Future<void> signIn(
    FirebaseAuthPayload payload,
  ) async {
    final response = await _api.makePostRequest(
      unencodedPath: Endpoints.signIn.getUrl(),
      queryParameters: {'key': secrets.FIREBASE_API_KEY},
      payload: payload,
    );

    if (response != null && response['error'] != null) {
      throw FirebaseAuthException(
        response['error']['message'],
      );
    } else {
      _onSuccess(response);
    }
  }
}
