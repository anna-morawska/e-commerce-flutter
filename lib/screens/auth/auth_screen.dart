import 'package:flutter/material.dart';

import '../../screens/auth/background.dart';
import '../../widgets/screen_wrapper.dart';
import '../../widgets/screen_padding.dart';
import '../../widgets/typography.dart';
import '../../screens/auth/auth_form.dart';

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
            children: const [
              TypographyTitleBold(
                "Welcome,",
              ),
              TypographyTitle(
                "Login to continue",
              ),
              SizedBox(
                height: 80,
              ),
              AuthForm(),
            ],
          ),
        ),
      ),
    );
  }
}
