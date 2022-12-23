import 'package:app_flutter/common/network.dart';
import 'package:app_flutter/common/response_model.dart';
import 'package:app_flutter/habit_detail/model/habit_detail_model.dart';

class HabitDetailAPi {
  static const String habitDetailUrl = "/accumulation/";

  static Future<RespModel<HabitDetailModel?>?> queryHabitDetail(int habitId) async {
    return NetWork.post<HabitDetailModel?>(
      "$habitDetailUrl/$habitId",
      format: (data){
        return HabitDetailModel.fromJson(data);
      }
    );
  }
}
