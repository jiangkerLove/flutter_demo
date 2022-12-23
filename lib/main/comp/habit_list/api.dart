import 'package:app_flutter/common/network.dart';
import 'package:app_flutter/main/comp/habit_list/model/habit_list_model.dart';

class HabitListAPi {
  static const String todayHabitApi = "/habit/search";

  static Future<HabitListModel?> fetchTodayHabitApi(int currentPage) async {
    return NetWork.post<HabitListModel>(
      todayHabitApi,
      extraParams: {
        "currentPage": currentPage,
        "pageSize": 20,
      },
      (data) {
        return HabitListModel.fromJson(data);
      },
      testAssert: "assets/habit_list.json",
    );
  }
}
