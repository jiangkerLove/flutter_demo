import 'package:app_flutter/common/colors.dart';
import 'package:app_flutter/common/common_ui.dart';
import 'package:app_flutter/main/comp/habit_list/habit_list_page.dart';
import 'package:app_flutter/main/main_controller.dart';
import 'package:app_flutter/main/ui/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainPage extends StatelessWidget {
  final List<Widget> _pages = [
    const KeepAliveWidget(child: HabitListPage()),
    FlatText("统计"),
    FlatText("挑战"),
    FlatText("消息"),
    FlatText("我的"),
  ];

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) => Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
          bottomNavigationBar: Container(
            height: 58.dp,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: NaviBar(
                    selectIcon: "images/ic_tab_today_select.png",
                    unSelectIcon: "images/ic_tab_today_unselect.png",
                    select: controller.currentIndex == 0,
                    onTap: () => controller.onTabClick(0),
                    tabText: "习惯",
                  ),
                ),
                Expanded(
                  child: NaviBar(
                    selectIcon: "images/ic_tab_statistics_select.png",
                    unSelectIcon: "images/ic_tab_statistics_unselect.png",
                    select: controller.currentIndex == 1,
                    onTap: () => controller.onTabClick(1),
                    tabText: "统计",
                  ),
                ),
                Expanded(
                  child: NaviBar(
                    selectIcon: "images/ic_tab_challenge_select.png",
                    unSelectIcon: "images/ic_tab_challenge_unselect.png",
                    select: controller.currentIndex == 2,
                    onTap: () => controller.onTabClick(2),
                    tabText: "挑战",
                  ),
                ),
                Expanded(
                  child: NaviBar(
                    selectIcon: "images/ic_tab_challenge_select.png",
                    unSelectIcon: "images/ic_tab_challenge_unselect.png",
                    select: controller.currentIndex == 3,
                    onTap: () => controller.onTabClick(3),
                    tabText: "消息",
                  ),
                ),
                Expanded(
                  child: NaviBar(
                    selectIcon: "images/ic_tab_today_select.png",
                    unSelectIcon: "images/ic_tab_today_unselect.png",
                    select: controller.currentIndex == 4,
                    onTap: () => controller.onTabClick(4),
                    tabText: '我的',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
