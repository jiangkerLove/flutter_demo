import 'package:app_flutter/common/network.dart';
import 'package:app_flutter/common/response_model.dart';
import 'package:app_flutter/main/comp/habit_list/model/habit_list_model.dart';

class HabitListAPi {
  static const String todayHabitApi = "/habit/search";

  static Future<RespModel<HabitListModel?>?> fetchTodayHabitApi(int currentPage) async {
    return NetWork.post<HabitListModel>(
      todayHabitApi,
      extraBody: {
        "currentPage": currentPage,
        "pageSize": 20,
      },
      format: (data) {
        return HabitListModel.fromJson(data);
      },
    );
  }
}
