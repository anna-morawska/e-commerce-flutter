import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/typography.dart';
import 'package:ecommerce_app/screens/orders/orders_screen.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({Key? key}) : super(key: key);

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  late ConfettiController _controllerTopCenter;

  @override
  void initState() {
    super.initState();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerTopCenter.play();
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  void _navigateToOrders() {
    Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          transform: Matrix4.translationValues(0.0, -100.0, 0.0),
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _controllerTopCenter,
            blastDirectionality: BlastDirectionality.explosive,
            maxBlastForce: 2,
            minBlastForce: 1,
            numberOfParticles: 8,
            gravity: 0.2,
          ),
        ),
        const Spacer(),
        const H2(
          "Thank you for shopping!",
          options: TypographyOptions(
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Body(
          "Your order has been placed successfully. For more details check My Orders screen.",
          options: TypographyOptions(
            textAlign: TextAlign.center,
            color: ThemeColors.textSecondary,
          ),
        ),
        const Spacer(),
        Button(
          'My Orders',
          icon: Icons.receipt_long_outlined,
          onPress: _navigateToOrders,
        )
      ],
    );
  }
}
