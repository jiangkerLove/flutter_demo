import 'package:app_flutter/common/colors.dart';
import 'package:app_flutter/common/common_ui.dart';
import 'package:app_flutter/common/title.dart';
import 'package:flutter/material.dart';

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF1F5FE),
        body: Column(
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
                    const InputText(
                      maxLines: 1,
                      maxLength: 20,
                      hintText: "例如跑步、早起等（限20字内）",
                    ),
                    SizedBox(height: 15.dp),
                    FlatText.blod("具体计划", fontSize: 16, color: Colors.black),
                    SizedBox(height: 15.dp),
                    const InputText(
                      maxLines: 8,
                      maxLength: 500,
                      hintText: "何时何地具体做什么，如早饭后看书、晚上9点瑜伽",
                    ),
                    SizedBox(height: 40.dp),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.dp, horizontal: 47.dp),
                        decoration: BoxDecoration(
                          color: btnColor,
                          borderRadius: BorderRadius.circular(29.dp),
                        ),
                        child: FlatText.blod("确定", fontSize: 18, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
