import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class FileSystemService {
  Future<String> requestAppDocumentsDirectory() async {
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    return appDocumentsDir.path;
  }

  Future<String> saveFileToAppDocumentsDir(XFile file) async {
    final dir = await requestAppDocumentsDirectory();
    final fileName = p.basename(file.path);
    final saveToPath = p.join(dir, fileName);

    await file.saveTo(saveToPath);

    return saveToPath;
  }
}
