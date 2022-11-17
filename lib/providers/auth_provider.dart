import 'package:ecommerce_app/models/create_account_payload.dart';
import 'package:ecommerce_app/models/firebase_auth_exception.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/config/secrets.dart' as secrets;
import 'package:ecommerce_app/services/networking_service.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  final _api = NetworkingService(
    secrets.FIREBASE_AUTH_REST_API,
  );

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
    }
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
    }
  }
}
