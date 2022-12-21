import 'package:app_flutter/main/comp/habit_list/model/habit_list_data.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HabitListController extends GetxController {
  List<HabitListData> habitList = [HabitListData("每天阅读一本书", "每天 9:00 阅读一本书")];
}
