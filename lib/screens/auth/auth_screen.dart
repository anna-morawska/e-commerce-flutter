import 'package:flutter/material.dart';

import 'package:ecommerce_app/screens/auth/background.dart';
import 'package:ecommerce_app/widgets/screen_wrapper.dart';
import 'package:ecommerce_app/widgets/screen_padding.dart';
import 'package:ecommerce_app/screens/auth/auth_form.dart';
import 'package:ecommerce_app/i18n/generated/l10n.dart';
import 'package:ecommerce_app/widgets/typography.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      addScreenPadding: false,
      hideAppBar: true,
      title: "",
      child: Background(
        child: ScreenPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              H1(
                T.of(context).auth_screen_title_1,
              ),
              H1(
                T.of(context).auth_screen_title_2,
              ),
              const SizedBox(
                height: 80,
              ),
              const AuthForm(),
            ],
          ),
        ),
      ),
    );
  }
}
