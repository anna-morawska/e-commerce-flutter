import 'package:flutter/material.dart';

import '../../screens/add_edit_product/add_edit_product_screen.dart';
import '../../screens/user_products/user_product_list.dart';
import '../../widgets/app_bar_action_button.dart';
import '../../widgets/screen_wrapper.dart';

class UserProducts extends StatelessWidget {
  static const routeName = '/user-products';

  const UserProducts({Key? key}) : super(key: key);

  void _navigateToEditProductScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      AddEditProductScreen.routeName,
      arguments: AddEditProductScreenArguments(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      title: "Your Products",
      showDrawer: true,
      actions: [
        AppBarActionButton(
          icon: Icons.add,
          onPress: () => _navigateToEditProductScreen(context),
        )
      ],
      child: const UserProductsList(),
    );
  }
}
