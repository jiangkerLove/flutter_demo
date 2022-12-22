import 'package:app_flutter/common/base_controller.dart';
import 'package:app_flutter/main/comp/habit_list/api.dart';
import 'package:app_flutter/main/comp/habit_list/model/habit_list_model.dart';

class HabitListController extends BaseController<HabitListModel> {
  List<Records> habitList = [];

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  Future<HabitListModel?> apiFetch() {
    return HabitListAPi.fetchTodayHabitApi();
  }

  @override
  void onDataFetched(HabitListModel data) {
    super.onDataFetched(data);
    var list = data.records ?? [];
    habitList.addAll(list);
  }
}
