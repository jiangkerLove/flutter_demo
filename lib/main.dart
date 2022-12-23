import 'dart:ui';

import 'package:app_flutter/common/common_ui.dart';
import 'package:app_flutter/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model_routes.dart';

typedef RouteWidgetBuilder = Widget Function(BuildContext context, Object? params);

void main() {
  baseScale = window.physicalSize.width / window.devicePixelRatio / 375;
  // 状态栏
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(
    // 替换默认Route
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      onGenerateRoute: (RouteSettings settings) {
        var generate = modelRoutes[settings.name]!;
        return SlideRightRoute(widgetBuilder: generate, settings: settings);
      },
    ),
  );
}

class SlideRightRoute<T> extends PageRouteBuilder<T> {
  final RouteWidgetBuilder widgetBuilder;

  SlideRightRoute({
    required this.widgetBuilder,
    required RouteSettings settings,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widgetBuilder(context, ModalRoute.of(context)?.settings.arguments);
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation),
              child: child,
            );
          },
          settings: settings,
        );
}
