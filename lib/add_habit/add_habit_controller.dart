import 'package:app_flutter/add_habit/api.dart';
import 'package:app_flutter/common/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddHabitController extends BaseController {
  final TextEditingController nameInputController = TextEditingController();

  final TextEditingController contentInputController = TextEditingController();

  void createHabit(NavigatorState state) async {
    if (nameInputController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "请填写习惯名称",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return;
    }
    if (contentInputController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "请填写习惯内容",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return;
    }
    var result = await AddHabitAPi.addHabit(nameInputController.text, contentInputController.text);
    if (!isClosed && result != null && result.valid() && result.data != null) {
      state.pop(true);
    } else if (result?.message?.isNotEmpty == true) {
      Fluttertoast.showToast(
        msg: result!.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
  }
}
