import 'package:app_flutter/accomplish/accomplish_page.dart';
import 'package:app_flutter/habit_detail/habit_detail_page.dart';
import 'package:app_flutter/main.dart';

import 'add_habit/add_habit_page.dart';

const String addHabitRoute = "add_habit";
const String accomplishRoute = "accomplish";
const String habitDetailRoute = "habit_detail";

Map<String, RouteWidgetBuilder> modelRoutes = {
  addHabitRoute: (_, params) => const AddHabitPage(),
  accomplishRoute: (_, params) => AccomplishPage(params: params),
  habitDetailRoute: (_, params) => HabitDetailPage(params: params),
};
