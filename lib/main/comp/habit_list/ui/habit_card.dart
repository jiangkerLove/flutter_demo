import 'package:app_flutter/common/colors.dart';
import 'package:app_flutter/common/common_ui.dart';
import 'package:app_flutter/main/comp/habit_list/habit_list_controller.dart';
import 'package:app_flutter/main/comp/habit_list/model/habit_list_data.dart';
import 'package:flutter/material.dart';

Widget createHabitCard(HabitListController controller, HabitListData data) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(left: 15.dp, top: 15.dp),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.dp),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatText(data.title, fontSize: 18, color: Colors.black),
        SizedBox(height: 5.dp),
        Opacity(
          opacity: 0.5,
          child: FlatText(data.content, color: Colors.black),
        ),
        SizedBox(height: 10.dp),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.dp, horizontal: 15.dp),
              decoration: BoxDecoration(
                color: btnColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.dp),
                  bottomRight: Radius.circular(12.dp),
                ),
              ),
              child: Row(
                children: [
                  const FlatText("打卡", color: Colors.white),
                  SizedBox(width: 8.dp),
                  Image(
                    width: 14.dp,
                    height: 6.dp,
                    image: const AssetImage("images/ic_right_point.png"),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
