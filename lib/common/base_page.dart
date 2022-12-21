import 'package:app_flutter/common/base_controller.dart';
import 'package:flutter/material.dart';

abstract class BasePage<T extends BaseController> extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);
}
