import 'dart:ui';

import 'package:app_flutter/common/common_ui.dart';
import 'package:app_flutter/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model_routes.dart';

typedef RouteWidgetBuilder = Widget Function(BuildContext context, Map<String, dynamic> params);

void main() {
  baseScale = window.physicalSize.width / window.devicePixelRatio / 375;
  var routeMap = modelRoutes;
  // 路由转换，获取统一获取传值
  var newMap = routeMap.map((key, value) {
    return MapEntry(key, (context) {
      Map<String, dynamic> params;
      try {
        params = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      } catch (e) {
        params = {};
      }
      return value(context, params);
    });
  });

  // 状态栏
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes: newMap,
      home: MainPage(),
    ),
  );
}
