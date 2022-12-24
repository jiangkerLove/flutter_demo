import 'package:app_flutter/accomplish/api.dart';
import 'package:app_flutter/common/base_controller.dart';
import 'package:app_flutter/main/comp/habit_list/model/habit_list_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccomplishController extends BaseController {
  AccomplishController(this.record);

  final TextEditingController inputController = TextEditingController();

  final List<XFile> imageFileList = [];

  final Records record;

  final ImagePicker _picker = ImagePicker();

  Future pickImages() async {
    XFile? res = await _picker.pickImage(source: ImageSource.gallery);
    if (res != null) {
      imageFileList.add(res);
      update();
    }
  }

  void deleteImage(XFile file) {
    imageFileList.remove(file);
    update();
  }

  void submit(NavigatorState state) async {
    var result = await AccomplishApi.submit(
      inputController.text,
      record.id!,
      imageFileList.map((e) => e.path).toList(),
    );
    if (result != null && result.valid() && result.data != null) {
      state.pop(true);
    } else {
      checkAndNotice(result);
    }
  }
}
