import 'package:app_flutter/main.dart';

import 'add_habit/add_habit_page.dart';

const String addHabitRoute = "add_habit";

Map<String, RouteWidgetBuilder> modelRoutes = {
  addHabitRoute: (_, params) => const AddHabitPage(),
};
