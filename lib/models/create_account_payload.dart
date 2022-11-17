import 'package:ecommerce_app/models/codable.dart';

class FirebaseAuthPayload implements Codable {
  final String email;
  final String password;

  @override
  final String? id = null;

  const FirebaseAuthPayload({
    required this.email,
    required this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
  }
}
