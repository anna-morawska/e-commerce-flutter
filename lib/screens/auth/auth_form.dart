import 'dart:async';

import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../../widgets/typography.dart';
import '../../widgets/text_input.dart';
import '../../screens/onboarding/onboarding_screen.dart';

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

  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _repeatPasswordFieldController = TextEditingController();

  void _toggleAuthFormType() {
    setState(() {
      _authFormType = _authFormType == AuthFormType.signIn
          ? AuthFormType.signUp
          : AuthFormType.signIn;
    });
  }

  void _onConfirmPress() {
    setState(() {
      _isFormLoading = true;
    });
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _isFormLoading = false;
      });
      Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailFieldController.dispose();
    _passwordFieldController.dispose();
    _repeatPasswordFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoginForm = _authFormType == AuthFormType.signIn;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            constraints: BoxConstraints(
              minHeight: isLoginForm ? 115 : 180,
            ),
            height: isLoginForm ? 115 : 180,
            child: Column(children: [
              TextInput(
                controller: _emailFieldController,
                keyboardType: TextInputType.emailAddress,
                hint: 'Enter your email',
                suffixIcon: Icons.person,
              ),
              const SizedBox(
                height: 16,
              ),
              TextInput(
                controller: _passwordFieldController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                hint: 'Enter your password',
                suffixIcon: Icons.lock,
              ),
              if (isLoginForm == false) ...[
                const Expanded(
                  child: SizedBox(
                    height: 16,
                  ),
                ),
                Expanded(
                  child: TextInput(
                    controller: _repeatPasswordFieldController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    hint: 'Repeat your password',
                    suffixIcon: Icons.lock_outline,
                  ),
                ),
              ]
            ]),
          ),
          const Spacer(
            flex: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TypographyBody(
                isLoginForm ? "Don't have an Account?" : "Already a Member?",
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: _toggleAuthFormType,
                child: TypographyH5Bold(
                  isLoginForm ? "Sign Up" : "Sign In",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          Button(
            isLoginForm ? "Sign In" : "Sign Up",
            isLoading: _isFormLoading,
            onPress: _onConfirmPress,
          ),
        ],
      ),
    );
  }
}
