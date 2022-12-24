import 'package:app_flutter/common/network.dart';
import 'package:app_flutter/common/response_model.dart';

class AddHabitAPi {
  static const String addHabitApi = "/habit/create";

  static Future<RespModel<int?>?> addHabit(String habitName, String plan) async {
    return NetWork.post<int?>(
      addHabitApi,
      extraBody: {
        "habitName": habitName,
        "plan": plan,
      },
    );
  }
}
