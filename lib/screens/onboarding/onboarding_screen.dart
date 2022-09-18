import 'package:flutter/material.dart';

import '../../screens/products/products_screen.dart';
import '../../screens/onboarding/onboarding_footer.dart';
import '../../screens/onboarding/onboarding_content.dart';
import '../../screens/onboarding/background.dart';
import '../../widgets/screen_wrapper.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onNextPress() {
    final nextPageIndex = _currentIndex + 1;

    if (nextPageIndex < 3) {
      _controller.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      _onSkipPress();
    }
  }

  void _onSkipPress() {
    Navigator.pushReplacementNamed(context, ProductsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      addScreenPadding: false,
      showDrawer: false,
      title: "",
      child: Background(
        child: PageView(
          onPageChanged: _onPageChanged,
          controller: _controller,
          children: const [
            OnboardingContent(
              title: 'Select what you love',
              description:
                  'Phasellus varius, lorem nec porta scelerisque, enim velit ullamcorper urna, et tincidunt tellus tortor.',
              imagePath: 'lib/assets/img/purchase_online.png',
            ),
            OnboardingContent(
              title: 'Track your order',
              description:
                  'Aliquam egestas, sapien in eleifend aliquam, nisl odio efficitur magna, ut interdum sapien magna eget est.',
              imagePath: 'lib/assets/img/track_order.png',
            ),
            OnboardingContent(
              title: 'Enjoy your shopping',
              description:
                  'Quisque gravida id velit eget tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
              imagePath: 'lib/assets/img/get_your_order.png',
            )
          ],
        ),
        footer: OnboardingFooter(
          currentIndex: _currentIndex,
          onNextPress: _onNextPress,
          onSkipPress: _onSkipPress,
        ),
      ),
    );
  }
}
