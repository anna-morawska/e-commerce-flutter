import 'package:ecommerce_app/widgets/typography.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/i18n/generated/l10n.dart';
import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/screens/products/products_screen.dart';
import 'package:ecommerce_app/screens/onboarding/onboarding_screen.dart';
import 'package:ecommerce_app/widgets/text_form_field_input.dart';
import 'package:ecommerce_app/widgets/snack_bar.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/text_input.dart';
import 'package:ecommerce_app/models/create_account_payload.dart';
import 'package:ecommerce_app/models/firebase_auth_exception.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

enum AuthFormType {
  signIn,
  signUp,
}

class _AuthFormState extends State<AuthForm> {
  AuthFormType _authFormType = AuthFormType.signIn;
  bool _isFormLoading = false;

  final Map<String, String?> _formData = {
    "email": null,
    "password": null,
  };

  final _formKey = GlobalKey<FormState>();
  final _repeatPasswordFieldController = TextEditingController();

  void _toggleAuthFormType() {
    setState(() {
      _authFormType = _authFormType == AuthFormType.signIn
          ? AuthFormType.signUp
          : AuthFormType.signIn;
    });
  }

  void _onConfirmPress() async {
    try {
      final isFormValid = _formKey.currentState!.validate();

      if (!isFormValid) {
        return;
      }

      _formKey.currentState!.save();

      final email = _formData['email'] as String;
      final password = _formData['password'] as String;
      final requestPayload = FirebaseAuthPayload(
        email: email,
        password: password,
      );

      setState(() {
        _isFormLoading = true;
      });

      if (_authFormType == AuthFormType.signUp) {
        await context.read<AuthProvider>().signUp(
              requestPayload,
            );
      } else {
        await context.read<AuthProvider>().signIn(
              requestPayload,
            );
      }

      // final finishedOnboarding =
      //     await SharedPreferencesService().getFinishedOnboarding();

      // Navigator.pushReplacementNamed(
      //   context,
      //   finishedOnboarding
      //       ? ProductsScreen.routeName
      //       : OnboardingScreen.routeName,
      // );
    } on FirebaseAuthException catch (error) {
      CustomSnackBar.showErrorSnackBar(
        context,
        error.getTranslatableErrorMessage(context),
      );
    } catch (error) {
      CustomSnackBar.showErrorSnackBar(
        context,
        error.toString(),
      );
    } finally {
      setState(() {
        _isFormLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _repeatPasswordFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoginForm = _authFormType == AuthFormType.signIn;
    final double containerHeight = isLoginForm ? 180 : 250;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            constraints: BoxConstraints(
              minHeight: containerHeight,
            ),
            height: containerHeight,
            child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormFieldInput(
                  suffixIcon: Icons.person,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  hint: T.of(context).auth_screen_form_email_hint,
                  validator: ValidationBuilder().email().maxLength(50).build(),
                  onSaved: (value) {
                    _formData['email'] = value;
                  },
                ),
                TextFormFieldInput(
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  hint: T.of(context).auth_screen_form_password_hint,
                  suffixIcon: Icons.lock,
                  validator:
                      ValidationBuilder().minLength(5).maxLength(50).build(),
                  onSaved: (value) {
                    _formData['password'] = value;
                  },
                ),
                if (isLoginForm == false) ...[
                  Expanded(
                    child: TextInput(
                      controller: _repeatPasswordFieldController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      hint: T.of(context).auth_screen_form_repeat_password_hint,
                      suffixIcon: Icons.lock_outline,
                    ),
                  ),
                ]
              ]),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Body(
                isLoginForm
                    ? T.of(context).auth_screen_dont_have_account
                    : T.of(context).auth_screen_already_a_member,
                options: const TypographyOptions(
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: _toggleAuthFormType,
                child: BodyBold(
                  isLoginForm
                      ? T.of(context).auth_screen_sign_in
                      : T.of(context).auth_screen_sign_up,
                  options: const TypographyOptions(
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          Button(
            isLoginForm
                ? T.of(context).auth_screen_sign_in
                : T.of(context).auth_screen_sign_up,
            isLoading: _isFormLoading,
            onPress: _onConfirmPress,
          ),
        ],
      ),
    );
  }
}
