import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/screens/auth/auth_screen.dart';
import 'package:ecommerce_app/screens/products/products_screen.dart';

class AuthGate extends StatelessWidget {
  static const routeName = '/auth-gate';

  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<AuthProvider, bool>(
      selector: (buildContext, provider) => provider.isAuthenticated,
      builder: (context, isAuthenticated, child) {
        if (isAuthenticated) {
          return const ProductsScreen();
        } else {
          return const AuthScreen();
        }
      },
    );
  }
}
