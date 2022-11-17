// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class T {
  T();

  static T? _current;

  static T get current {
    assert(_current != null,
        'No instance of T was loaded. Try to initialize the T delegate before accessing T.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<T> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = T();
      T._current = instance;

      return instance;
    });
  }

  static T of(BuildContext context) {
    final instance = T.maybeOf(context);
    assert(instance != null,
        'No instance of T present in the widget tree. Did you add T.delegate in localizationsDelegates?');
    return instance!;
  }

  static T? maybeOf(BuildContext context) {
    return Localizations.of<T>(context, T);
  }

  /// `Check out the most popular products`
  String get main_screen_title {
    return Intl.message(
      'Check out the most popular products',
      name: 'main_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome,`
  String get auth_screen_title_1 {
    return Intl.message(
      'Welcome,',
      name: 'auth_screen_title_1',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue`
  String get auth_screen_title_2 {
    return Intl.message(
      'Login to continue',
      name: 'auth_screen_title_2',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get auth_screen_form_email_hint {
    return Intl.message(
      'Enter your email',
      name: 'auth_screen_form_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get auth_screen_form_password_hint {
    return Intl.message(
      'Enter your password',
      name: 'auth_screen_form_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Repeat your password`
  String get auth_screen_form_repeat_password_hint {
    return Intl.message(
      'Repeat your password',
      name: 'auth_screen_form_repeat_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get auth_screen_sign_in {
    return Intl.message(
      'Sign In',
      name: 'auth_screen_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get auth_screen_sign_up {
    return Intl.message(
      'Sign Up',
      name: 'auth_screen_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an Account?`
  String get auth_screen_dont_have_account {
    return Intl.message(
      'Don\'t have an Account?',
      name: 'auth_screen_dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Already a Member?`
  String get auth_screen_already_a_member {
    return Intl.message(
      'Already a Member?',
      name: 'auth_screen_already_a_member',
      desc: '',
      args: [],
    );
  }

  /// `The email address is already in use by another account.`
  String get error_email_exists {
    return Intl.message(
      'The email address is already in use by another account.',
      name: 'error_email_exists',
      desc: '',
      args: [],
    );
  }

  /// `There is no user record corresponding to this identifier. The user may have been deleted.`
  String get error_email_not_found {
    return Intl.message(
      'There is no user record corresponding to this identifier. The user may have been deleted.',
      name: 'error_email_not_found',
      desc: '',
      args: [],
    );
  }

  /// `The password is invalid or the user does not have a password`
  String get error_invalid_password {
    return Intl.message(
      'The password is invalid or the user does not have a password',
      name: 'error_invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `Password sign-in is disabled for this project.`
  String get error_operation_not_allowed {
    return Intl.message(
      'Password sign-in is disabled for this project.',
      name: 'error_operation_not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `The user account has been disabled by an administrator.`
  String get error_user_disabled {
    return Intl.message(
      'The user account has been disabled by an administrator.',
      name: 'error_user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `We have blocked all requests from this device due to unusual activity. Try again later.`
  String get error_too_many_attempts {
    return Intl.message(
      'We have blocked all requests from this device due to unusual activity. Try again later.',
      name: 'error_too_many_attempts',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again`
  String get error_something_went_wrong {
    return Intl.message(
      'Something went wrong, please try again',
      name: 'error_something_went_wrong',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<T> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<T> load(Locale locale) => T.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
