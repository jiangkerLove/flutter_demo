import 'package:app_flutter/common/colors.dart';
import 'package:app_flutter/common/common_ui.dart';
import 'package:app_flutter/common/title.dart';
import 'package:app_flutter/main/comp/habit_list/habit_list_controller.dart';
import 'package:app_flutter/main/comp/habit_list/ui/habit_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HabitListPage extends StatelessWidget {
  const HabitListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F5FE),
        body: GetBuilder<HabitListController>(
          init: HabitListController(),
          builder: (controller) => Stack(
            children: [
              Image(
                height: 218.dp,
                image: const AssetImage("images/bg_today.png"),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const TitleWidget(title: "习惯列表页"),
                  SizedBox(
                    height: 162.dp,
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
                                "06",
                                fontSize: 67,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4.dp),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FlatText.blod(
                                    "/12",
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 1.dp),
                                  FlatText.blod(
                                    "星期一",
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
      ),
    );
  }

  Widget buildBody(HabitListController controller) {
    if (controller.habitList.isEmpty) {
      return Column(
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
    return Padding(
      padding: EdgeInsets.only(top: 12.dp),
      child: ScrollConfiguration(
        behavior: OverScrollBehavior(),
        child: ListView.builder(
          itemBuilder: (_, index) => Container(
            key: UniqueKey(),
            padding: EdgeInsets.fromLTRB(
              15.dp,
              index == 0 ? 19.dp : 15.dp,
              15.dp,
              0,
            ),
            child: createHabitCard(controller, controller.habitList[index]),
          ),
          itemCount: controller.habitList.length,
        ),
      ),
    );
  }
}
