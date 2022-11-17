// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "auth_screen_already_a_member":
            MessageLookupByLibrary.simpleMessage("Already a Member?"),
        "auth_screen_dont_have_account":
            MessageLookupByLibrary.simpleMessage("Don\'t have an Account?"),
        "auth_screen_form_email_hint":
            MessageLookupByLibrary.simpleMessage("Enter your email"),
        "auth_screen_form_password_hint":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "auth_screen_form_repeat_password_hint":
            MessageLookupByLibrary.simpleMessage("Repeat your password"),
        "auth_screen_sign_in": MessageLookupByLibrary.simpleMessage("Sign In"),
        "auth_screen_sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "auth_screen_title_1": MessageLookupByLibrary.simpleMessage("Welcome,"),
        "auth_screen_title_2":
            MessageLookupByLibrary.simpleMessage("Login to continue"),
        "error_email_exists": MessageLookupByLibrary.simpleMessage(
            "The email address is already in use by another account."),
        "error_email_not_found": MessageLookupByLibrary.simpleMessage(
            "There is no user record corresponding to this identifier. The user may have been deleted."),
        "error_invalid_password": MessageLookupByLibrary.simpleMessage(
            "The password is invalid or the user does not have a password"),
        "error_operation_not_allowed": MessageLookupByLibrary.simpleMessage(
            "Password sign-in is disabled for this project."),
        "error_something_went_wrong": MessageLookupByLibrary.simpleMessage(
            "Something went wrong, please try again"),
        "error_too_many_attempts": MessageLookupByLibrary.simpleMessage(
            "We have blocked all requests from this device due to unusual activity. Try again later."),
        "error_user_disabled": MessageLookupByLibrary.simpleMessage(
            "The user account has been disabled by an administrator."),
        "main_screen_title": MessageLookupByLibrary.simpleMessage(
            "Check out the most popular products")
      };
}
