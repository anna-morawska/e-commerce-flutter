import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../styles/theme.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final bool? withRoundedCorners;

  const CustomImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.withRoundedCorners = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: width,
          height: height,
          child: const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: ThemeColors.secondaryMain,
                strokeWidth: 2,
              ),
            ),
          ),
        ),
        Center(
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(withRoundedCorners == true ? 8 : 0),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageUrl,
              width: width,
              height: height,
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
