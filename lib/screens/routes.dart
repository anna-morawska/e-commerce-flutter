import 'package:ecommerce_app/screens/auth_gate/auth_gate.dart';
import 'package:flutter/material.dart';

import '../screens/loading/loading_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/product_details/product_details_screen.dart';
import '../screens/products/products_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/orders/orders_screen.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/user_products/user_products_screen.dart';
import '../screens/add_edit_product/add_edit_product_screen.dart';
import '../screens/map/map_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  AuthGate.routeName: (ctx) => const AuthGate(),
  AuthScreen.routeName: (ctx) => const AuthScreen(),
  OrdersScreen.routeName: (ctx) => const OrdersScreen(),
  LoadingScreen.routeName: (ctx) => const LoadingScreen(),
  OnboardingScreen.routeName: (ctx) => const OnboardingScreen(),
  ProductsScreen.routeName: (ctx) => const ProductsScreen(),
  ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
  CartScreen.routeName: (ctx) => const CartScreen(),
  UserProducts.routeName: (ctx) => const UserProducts(),
  AddEditProductScreen.routeName: (ctx) => const AddEditProductScreen(),
  MapScreen.routeName: (ctx) => const MapScreen(),
};
