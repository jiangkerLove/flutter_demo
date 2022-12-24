import 'package:app_flutter/common/colors.dart';
import 'package:app_flutter/common/common_ui.dart';
import 'package:app_flutter/common/title.dart';
import 'package:app_flutter/main/comp/habit_list/habit_list_controller.dart';
import 'package:app_flutter/main/comp/habit_list/ui/habit_card.dart';
import 'package:app_flutter/model_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HabitListPage extends StatelessWidget {
  const HabitListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: GetBuilder<HabitListController>(
        init: HabitListController(),
        builder: (controller) => Stack(
          children: [
            const Image(
              image: AssetImage("images/bg_today.png"),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const TitleWidget(title: "习惯列表页", showBack: false),
                SizedBox(
                  height: 152.dp,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 16.dp,
                        left: 15.dp,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlatText.blod(
                              "${controller.dateTime.day}",
                              fontSize: 67,
                              color: Colors.black,
                            ),
                            SizedBox(width: 4.dp),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FlatText.blod(
                                  "/${controller.dateTime.month}",
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                SizedBox(height: 1.dp),
                                FlatText.blod(
                                  weekday[controller.dateTime.weekday],
                                  fontSize: 13,
                                  color: Colors.black,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 28.dp,
                        right: 35.dp,
                        child: GestureDetector(
                          onTap: () {
                            var result = Navigator.of(context).pushNamed(addHabitRoute);
                            result.then(
                              (value) => {
                                if (value != null) controller.fetchData(),
                              },
                            );
                          },
                          child: Container(
                            width: 54.dp,
                            height: 54.dp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.dp),
                              color: btnColor,
                            ),
                            child: Center(
                              child: Image(
                                height: 28.dp,
                                width: 28.dp,
                                image: const AssetImage("images/ic_plus.png"),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: buildBody(controller),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBody(HabitListController controller) {
    if (controller.habitList.isEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 63.dp),
            child: Image(
              width: 197.58.dp,
              height: 170.29.dp,
              image: const AssetImage("images/bg_today_empty.png"),
            ),
          ),
          SizedBox(height: 19.dp),
          const FlatText(
            "还没有任何习惯，去添加",
            fontSize: 16,
            color: Color(0xFF232E3C),
          )
        ],
      );
    }
    return ScrollConfiguration(
      behavior: OverScrollBehavior(),
      child: SmartRefresher(
        controller: controller.refreshController,
        enablePullDown: false,
        enablePullUp: controller.hasMore,
        onLoading: controller.loadMore,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemBuilder: (_, index) => Container(
            key: UniqueKey(),
            padding: EdgeInsets.fromLTRB(
              15.dp,
              index == 0 ? 19.dp : 0,
              15.dp,
              15.dp,
            ),
            child: HabitCard(controller: controller, data: controller.habitList[index]),
          ),
          itemCount: controller.habitList.length,
        ),
      ),
    );
  }
}
