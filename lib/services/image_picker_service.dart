import 'package:ecommerce_app/services/file_system_service.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  late final ImagePicker _picker;

  ImagePickerService() {
    _picker = ImagePicker();
  }

  Future<String?> takePicture() async {
    XFile? imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (imageFile != null) {
      final path =
          await FileSystemService().saveFileToAppDocumentsDir(imageFile);
      return path;
    }

    return null;
  }
}
