import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainController extends GetxController {
  int currentIndex = 0; //记录当前选中哪个页面

  //第1步，声明PageController
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentIndex);
  }

  void onTabClick(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    update();
  }
}
