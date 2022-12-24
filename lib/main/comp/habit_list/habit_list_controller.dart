import 'package:app_flutter/common/base_controller.dart';
import 'package:app_flutter/common/refresh_mixin.dart';
import 'package:app_flutter/common/response_model.dart';
import 'package:app_flutter/main/comp/habit_list/api.dart';
import 'package:app_flutter/main/comp/habit_list/model/habit_list_model.dart';

const weekday = [" ", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"];

class HabitListController extends BaseController<HabitListModel> with RefreshMixin {
  final List<Records> habitList = [];

  var dateTime = DateTime.now();
  var currentPage = 0;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  Future<RespModel<HabitListModel?>?> apiFetch(extra) {
    return HabitListAPi.fetchTodayHabitApi(currentPage);
  }

  @override
  void onDataFetched(HabitListModel data, extra) {
    super.onDataFetched(data, extra);
    var list = data.records ?? [];
    if (extra != RefreshType.loadMore) {
      habitList.clear();
      currentPage = 0;
    }
    habitList.addAll(list);
    currentPage++;
    hasMore = list.length < (data.total ?? 0);
  }
}
