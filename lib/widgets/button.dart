import 'package:flutter/material.dart';

import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/typography.dart';

enum ButtonType {
  filled,
  outlined,
}

enum ButtonSize {
  regular,
  small,
}

class Button extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPress;
  final bool? isLoading;
  final ButtonType buttonType;
  final ButtonSize buttonSize;

  const Button(
    this.text, {
    this.icon,
    this.onPress,
    this.isLoading = false,
    this.buttonType = ButtonType.filled,
    this.buttonSize = ButtonSize.regular,
    Key? key,
  }) : super(key: key);

  Widget getContainer(Widget child) {
    return isLoading == true
        ? SizedBox(
            width: double.infinity,
            child: child,
          )
        : InkWell(
            onTap: onPress,
            child: child,
          );
  }

  @override
  Widget build(BuildContext context) {
    final isOutlined = buttonType == ButtonType.outlined;
    final isSizeSmall = buttonSize == ButtonSize.small;

    return getContainer(
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(isSizeSmall ? 8 : 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isLoading == true) ...[
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(right: 16),
                child: const CircularProgressIndicator(
                  color: ThemeColors.white,
                  strokeWidth: 1,
                ),
              )
            ],
            if (icon != null && isLoading == false) ...[
              Icon(
                icon,
                color: isOutlined
                    ? ThemeColors.textPrimary
                    : ThemeColors.background,
                size: isSizeSmall ? 14 : 24,
              ),
              const SizedBox(
                width: 8,
              ),
            ],
            Body(
              text,
              options: TypographyOptions(
                color: isOutlined
                    ? ThemeColors.textPrimary
                    : ThemeColors.background,
              ),
            ),
          ],
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isOutlined ? ThemeColors.white : ThemeColors.accent,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(
            color: ThemeColors.accent,
            width: isOutlined ? 1 : 0,
          ),
        ),
      ),
    );
  }
}
