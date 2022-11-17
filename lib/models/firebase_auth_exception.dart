import 'package:ecommerce_app/i18n/generated/l10n.dart';
import 'package:flutter/material.dart';

class FirebaseAuthException implements Exception {
  final String message;

  FirebaseAuthException(
    this.message,
  );

  String getTranslatableErrorMessage(BuildContext context) {
    switch (message) {
      case "EMAIL_EXISTS":
        return T.of(context).error_email_exists;

      case "EMAIL_NOT_FOUND":
        return T.of(context).error_email_not_found;

      case "INVALID_PASSWORD":
        return T.of(context).error_invalid_password;

      case "OPERATION_NOT_ALLOWED":
        return T.of(context).error_operation_not_allowed;

      case "USER_DISABLED":
        return T.of(context).error_user_disabled;

      case "TOO_MANY_ATTEMPTS_TRY_LATER":
        return T.of(context).error_too_many_attempts;

      default:
        return T.of(context).error_something_went_wrong;
    }
  }
}
