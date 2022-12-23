import 'package:app_flutter/common/base_controller.dart';
import 'package:app_flutter/common/response_model.dart';
import 'package:app_flutter/habit_detail/api.dart';
import 'package:app_flutter/habit_detail/model/habit_detail_model.dart';

class HabitDetailController extends BaseController<HabitDetailModel> {

  HabitDetailModel? model;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  Future<RespModel<HabitDetailModel?>?> apiFetch(extra) {
    return HabitDetailAPi.queryHabitDetail(1606307760823902210);
  }

  @override
  void onDataFetched(HabitDetailModel data, extra) {
    super.onDataFetched(data, extra);
    model = data;
  }

}
