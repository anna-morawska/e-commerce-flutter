import 'package:flutter/material.dart';

import '../../screens/orders/orders_screen.dart';
import '../../styles/theme.dart';
import '../../widgets/screen_padding.dart';
import '../../widgets/app_drawer/app_drawer_list_tile.dart';
import '../../widgets/app_drawer/app_drawer_header.dart';
import '../../screens/products/products_screen.dart';
import '../../screens/user_products/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ThemeColors.accent,
      width: 260,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ScreenPadding(
              child: Column(
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  const AppDrawerHeader(),
                  const SizedBox(
                    height: 48,
                  ),
                  const Divider(
                    color: ThemeColors.textSecondary,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  AppDrawerListTile(
                    icon: Icons.home,
                    title: 'Home',
                    onPress: () =>
                        _navigateTo(context, ProductsScreen.routeName),
                  ),
                  AppDrawerListTile(
                    icon: Icons.edit,
                    title: 'Manage Your Products',
                    onPress: () => _navigateTo(context, UserProducts.routeName),
                  ),
                  AppDrawerListTile(
                    icon: Icons.receipt_long_outlined,
                    title: 'Your Orders',
                    onPress: () => _navigateTo(context, OrdersScreen.routeName),
                  ),
                  const AppDrawerListTile(
                    icon: Icons.favorite,
                    title: 'Your favorites',
                  ),
                  const AppDrawerListTile(
                    icon: Icons.settings,
                    title: 'Settings',
                  ),
                  const Spacer(),
                  const AppDrawerListTile(
                    icon: Icons.logout,
                    title: 'Logout',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
