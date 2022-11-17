import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/typography.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          transform: Matrix4.translationValues(0.0, 40.0, 0.0),
          width: 200,
          height: 200,
          child: Lottie.asset('lib/assets/animations/shopping-loader.json'),
        ),
        const H2(
          "Please wait!",
          options: TypographyOptions(
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Body(
          "We are processing your order, almost done!",
          options: TypographyOptions(
            textAlign: TextAlign.center,
            color: ThemeColors.textSecondary,
          ),
        ),
        const SizedBox(
          width: 200,
          height: 210,
        )
      ],
    );
  }
}
