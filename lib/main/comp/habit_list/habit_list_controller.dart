import 'package:app_flutter/common/base_controller.dart';
import 'package:app_flutter/main/comp/habit_list/api.dart';
import 'package:app_flutter/main/comp/habit_list/model/habit_list_model.dart';

const weekday = [" ", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"];

class HabitListController extends BaseController<HabitListModel> {

  List<Records> habitList = [];

  var dateTime = DateTime.now();

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
