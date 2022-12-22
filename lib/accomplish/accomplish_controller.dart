import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class AccomplishController extends GetxController {
  final List<XFile> imageFileList = [];

  final ImagePicker _picker = ImagePicker();

  Future pickImages() async {
    List<XFile> res = await _picker.pickMultiImage();
    imageFileList.addAll(res);
    update();
  }

  void deleteImage(XFile file) {
    imageFileList.remove(file);
    update();
  }
}
