import 'package:app_flutter/common/network.dart';

class AddHabitAPi {
  static const String addHabitApi = "/habit/create";

  static Future<dynamic> addHabit(String habitName, String plan) async {
    return NetWork.post<dynamic>(
      addHabitApi,
      extraParams: {
        "habitName": habitName,
        "plan": plan,
      },
      (data) {
        return data;
      },
      testAssert: "assets/habit_list.json",
    );
  }
}
