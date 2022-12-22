import 'package:app_flutter/common/network.dart';
import 'package:app_flutter/main/comp/habit_list/model/habit_list_model.dart';

class HabitListAPi {
  static const String todayHabitApi = "/habit/search";

  static Future<HabitListModel?> fetchTodayHabitApi() async {
    return NetWork.post<HabitListModel>(
      todayHabitApi,
      (data) {
        return HabitListModel.fromJson(data);
      },
      testAssert: "assets/habit_list.json",
    );
  }
}
