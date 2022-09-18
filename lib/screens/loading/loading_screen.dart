import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/screen_wrapper.dart';
import '../../screens/loading/success_view.dart';
import '../../screens/loading/loading_view.dart';
import '../../providers/cart_provider.dart';

enum LoadingScreenState {
  loading,
  success,
}

class LoadingScreen extends StatefulWidget {
  static const routeName = '/loading_success';

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LoadingScreenState _state;

  @override
  void initState() {
    super.initState();

    _state = LoadingScreenState.loading;

    Timer(
      const Duration(milliseconds: 4900),
      () {
        context.read<CartProvider>().clearCart();
        setState(() {
          _state = LoadingScreenState.success;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      hideAppBar: _state == LoadingScreenState.loading,
      showDrawer: true,
      title: "",
      child: _state == LoadingScreenState.success
          ? const SuccessView()
          : const LoadingView(),
    );
  }
}
