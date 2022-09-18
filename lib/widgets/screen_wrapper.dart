import 'package:flutter/material.dart';

import '../styles/theme.dart';
import '../widgets/app_drawer/app_drawer.dart';
import '../widgets/app_bar.dart';
import '../widgets/screen_padding.dart';

class ScreenWrapper extends StatelessWidget {
  final String title;
  final Widget child;
  final bool hideAppBar;
  final bool showDrawer;
  final bool addScreenPadding;
  final List<Widget>? actions;

  const ScreenWrapper({
    required this.title,
    required this.child,
    this.hideAppBar = false,
    this.addScreenPadding = true,
    this.showDrawer = false,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeColors.white,
      drawer: showDrawer ? const AppDrawer() : null,
      appBar: hideAppBar
          ? null
          : CustomAppBar(
              actions: actions,
              showDrawer: showDrawer,
              title: title,
            ),
      body: addScreenPadding ? ScreenPadding(child: child) : child,
    );
  }
}
