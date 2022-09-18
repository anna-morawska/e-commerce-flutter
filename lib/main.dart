import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/orders_provider.dart';
import './screens/products/products_screen.dart';
import './screens/routes.dart';
import './styles/theme.dart';
import './providers/cart_provider.dart';
import './providers/products_provider.dart';
import './models/debug.dart';
import './screens/add_edit_product/add_edit_product_screen.dart';
import './screens/auth/auth_screen.dart';
import './screens/onboarding/onboarding_screen.dart';
import './screens/user_products/user_products_screen.dart';

void main() {
  // if (kDebugMode) {
  //   DebugMode.start();
  // }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrdersProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      initialRoute: ProductsScreen.routeName,
      routes: appRoutes,
    );
  }
}
