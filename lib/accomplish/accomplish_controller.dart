import 'package:app_flutter/accomplish/api.dart';
import 'package:app_flutter/main/comp/habit_list/model/habit_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class AccomplishController extends GetxController {
  AccomplishController(this.record);

  final TextEditingController inputController = TextEditingController();

  final List<XFile> imageFileList = [];

  final Records record;

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

  void submit() {
    AccomplishApi.submit(
      inputController.text,
      record.id!,
      imageFileList.map((e) => e.path).toList(),
    );
  }
}
