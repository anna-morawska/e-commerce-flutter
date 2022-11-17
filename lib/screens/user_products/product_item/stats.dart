import 'dart:math';

import 'package:flutter/material.dart';

import 'package:ecommerce_app/styles/theme.dart';
import 'package:ecommerce_app/widgets/typography.dart';

class Stats extends StatelessWidget {
  const Stats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          StatsItem(
            type: StatsItemType.messages,
          ),
          StatsItem(
            type: StatsItemType.views,
          ),
          StatsItem(
            type: StatsItemType.calls,
          ),
          StatsItem(
            type: StatsItemType.favorites,
          ),
        ]);
  }
}

enum StatsItemType {
  views,
  favorites,
  calls,
  messages,
}

class StatsItem extends StatelessWidget {
  final StatsItemType type;

  const StatsItem({
    required this.type,
    Key? key,
  }) : super(key: key);

  IconData get iconData {
    switch (type) {
      case StatsItemType.messages:
        return Icons.chat_bubble_outline_rounded;

      case StatsItemType.views:
        return Icons.remove_red_eye_outlined;

      case StatsItemType.calls:
        return Icons.phone_callback_outlined;

      case StatsItemType.favorites:
        return Icons.favorite_outline;

      default:
        return Icons.chat_bubble_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: ThemeColors.textSecondary,
          size: 16,
        ),
        const SizedBox(
          width: 4,
        ),
        BodyBold(
          Random().nextInt(500).toString(),
          options: const TypographyOptions(
            color: ThemeColors.textSecondary,
          ),
        )
      ],
    );
  }
}
