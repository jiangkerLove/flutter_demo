import 'package:app_flutter/common/colors.dart';
import 'package:app_flutter/common/common_ui.dart';
import 'package:app_flutter/common/network.dart';
import 'package:app_flutter/common/title.dart';
import 'package:app_flutter/habit_detail/habit_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HabitDetailPage extends StatelessWidget {
  final Object? params;

  const HabitDetailPage({Key? key, this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        body: GetBuilder<HabitDetailController>(
          init: HabitDetailController(),
          builder: (controller) => Column(
            children: [
              const TitleWidget(title: "习惯详情"),
              Expanded(
                child: ScrollConfiguration(
                  behavior: OverScrollBehavior(),
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(15.dp, 13.dp, 15.dp, 0),
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.dp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Text(
                          controller.model?.habitDesc ?? "",
                          style: const TextStyle(
                            color: Color(0xB3000000),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.dp),
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10.dp,
                          crossAxisSpacing: 10.dp,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 105.dp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: lightBlack, width: 0.75.dp),
                              borderRadius: BorderRadius.circular(12.dp),
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.dp),
                              child: Image.network(
                                "${NetWork.baseUrl}/image/${controller.model!.imgUrlList[index]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: controller.model?.imgUrlList.length ?? 0,
                      ),
                      SizedBox(height: 15.dp),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
