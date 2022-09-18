import 'package:flutter/material.dart';

import '../../styles/theme.dart';
import '../../widgets/image.dart';

class ProductImagePreview extends StatelessWidget {
  final String? imageUrl;

  const ProductImagePreview({
    this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          width: 2,
          color: ThemeColors.backgroundPaper,
        ),
      ),
      child: imageUrl != null && imageUrl != ""
          ? CustomImage(
              imageUrl: imageUrl!,
              width: double.infinity,
              height: 200,
            )
          : const Center(
              child: Icon(
                Icons.photo,
                size: 80,
                color: ThemeColors.backgroundPaper,
              ),
            ),
    );
  }
}
