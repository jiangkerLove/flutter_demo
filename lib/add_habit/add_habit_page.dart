import 'package:app_flutter/add_habit/add_habit_controller.dart';
import 'package:app_flutter/common/colors.dart';
import 'package:app_flutter/common/common_ui.dart';
import 'package:app_flutter/common/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        body: GetBuilder<AddHabitController>(
          init: AddHabitController(),
          builder: (controller) => Column(
            children: [
              const TitleWidget(title: "添加习惯"),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.dp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 13.dp),
                      FlatText.blod("习惯命名", fontSize: 16, color: Colors.black),
                      SizedBox(height: 15.dp),
                      InputText(
                        maxLines: 1,
                        maxLength: 20,
                        showNotice: false,
                        hintText: "例如跑步、早起等（限20字内）",
                        inputController: controller.nameInputController,
                      ),
                      SizedBox(height: 15.dp),
                      FlatText.blod("具体计划", fontSize: 16, color: Colors.black),
                      SizedBox(height: 15.dp),
                      InputText(
                        maxLines: 8,
                        maxLength: 255,
                        hintText: "何时何地具体做什么，如早饭后看书、晚上9点瑜伽",
                        inputController: controller.contentInputController,
                      ),
                      SizedBox(height: 40.dp),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            controller.createHabit(Navigator.of(context));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15.dp, horizontal: 47.dp),
                            decoration: BoxDecoration(
                              color: btnColor,
                              borderRadius: BorderRadius.circular(29.dp),
                            ),
                            child: FlatText.blod("确定", fontSize: 18, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
