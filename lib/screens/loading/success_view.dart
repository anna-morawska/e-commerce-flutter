import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

import '../../styles/theme.dart';
import '../../widgets/button.dart';
import '../../widgets/typography.dart';
import '../../screens/orders/orders_screen.dart';

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
        const TypographyH1("Thank you for shopping!"),
        const SizedBox(
          height: 8,
        ),
        const TypographyBody(
          "Your order has been placed successfully. For more details check My Orders screen.",
          textAlign: TextAlign.center,
          color: ThemeColors.textSecondary,
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
