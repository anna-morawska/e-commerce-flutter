import 'package:flutter/material.dart';

import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/typography.dart';
import 'package:ecommerce_app/widgets/app_bar_action_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool? showDrawer;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const CustomAppBar({
    required this.title,
    this.showDrawer = false,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    final canGoBack = Navigator.canPop(context);

    Widget? leadingIcon() {
      if (showDrawer == true) {
        return AppBarActionButton(
          icon: Icons.menu,
          onPress: Scaffold.of(context).openDrawer,
        );
      }

      if (canGoBack) {
        return AppBarActionButton(
          icon: Icons.arrow_back,
          onPress: () {
            Navigator.pop(context);
          },
        );
      }
      return null;
    }

    return AppBar(
      backgroundColor: ThemeColors.white,
      foregroundColor: ThemeColors.textSecondary,
      elevation: 0,
      title: H3(
        title,
      ),
      actions: actions,
      leading: leadingIcon(),
    );
  }
}
