import 'dart:io';

import 'package:app_flutter/accomplish/accomplish_controller.dart';
import 'package:app_flutter/common/colors.dart';
import 'package:app_flutter/common/common_ui.dart';
import 'package:app_flutter/common/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

typedef OnPickImageCallback = void Function(double? maxWidth, double? maxHeight, int? quality);

class AccomplishPage extends StatelessWidget {
  final Object? params;

  const AccomplishPage({Key? key, this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor,
        body: GetBuilder<AccomplishController>(
          init: AccomplishController(),
          builder: (controller) => Column(
            children: [
              const TitleWidget(title: "习惯打卡"),
              Expanded(
                child: ScrollConfiguration(
                  behavior: OverScrollBehavior(),
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(15.dp, 13.dp, 15.dp, 0),
                    children: [
                      const InputText(
                        maxLines: 8,
                        maxLength: 500,
                        hintText: "请输入打卡心得（500字内）",
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
                          if (index == controller.imageFileList.length) {
                            return GestureDetector(
                              onTap: controller.pickImages,
                              child: Container(
                                height: 105.dp,
                                decoration: BoxDecoration(
                                  border: Border.all(color: lightBlack, width: 0.75.dp),
                                  borderRadius: BorderRadius.circular(12.dp),
                                  color: const Color(0xFFFCFDFE),
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image(
                                      width: 36.dp,
                                      height: 27.dp,
                                      image: const AssetImage("images/ic_pick_image.png"),
                                    ),
                                    SizedBox(height: 10.dp),
                                    const FlatText("上传图片", color: lightBlack, fontSize: 18),
                                  ],
                                ),
                              ),
                            );
                          }
                          var imageFile = controller.imageFileList[index];
                          return Stack(
                            key: ValueKey(imageFile.path),
                            children: [
                              Container(
                                height: 105.dp,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: lightBlack, width: 0.75.dp),
                                  borderRadius: BorderRadius.circular(12.dp),
                                  color: Colors.white,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.dp),
                                  child: Image.file(File(imageFile.path), fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                right: 1.dp,
                                top: 1.dp,
                                child: GestureDetector(
                                  onTap: () => controller.deleteImage(imageFile),
                                  child: Image(
                                    height: 22.dp,
                                    width: 22.dp,
                                    image: const AssetImage("images/ic_delete.png"),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        shrinkWrap: true,
                        itemCount: controller.imageFileList.length + 1,
                      ),
                      SizedBox(height: 15.dp),
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15.dp, horizontal: 47.dp),
                          decoration: BoxDecoration(
                            color: btnColor,
                            borderRadius: BorderRadius.circular(29.dp),
                          ),
                          child: FlatText.blod("确定", fontSize: 18, color: Colors.white),
                        ),
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
