import 'package:flutter/material.dart';

import '../../styles/theme.dart';
import '../../services/image_picker_service.dart';

class ProductImagePreview extends StatelessWidget {
  final String? imageUrl;
  final Function setImageUrl;

  const ProductImagePreview({
    this.imageUrl,
    required this.setImageUrl,
    Key? key,
  }) : super(key: key);

  void _onTapHandler() async {
    final imagePickerService = ImagePickerService();
    final path = await imagePickerService.takePicture();
    if (path != null) {
      setImageUrl(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTapHandler,
      child: Container(
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
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              )
            : const Center(
                child: Icon(
                  Icons.photo,
                  size: 80,
                  color: ThemeColors.backgroundPaper,
                ),
              ),
      ),
    );
  }
}
