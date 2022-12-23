import 'package:app_flutter/common/network.dart';
import 'package:app_flutter/common/response_model.dart';

class AddHabitAPi {
  static const String addHabitApi = "/habit/create";

  static Future<RespModel<String?>?> addHabit(String habitName, String plan) async {
    return NetWork.post<String>(
      addHabitApi,
      extraParams: {
        "habitName": habitName,
        "plan": plan,
      },
      // testAssert: "assets/habit_list.json",
    );
  }
}
