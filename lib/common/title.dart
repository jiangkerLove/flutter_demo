import 'package:app_flutter/common/common_ui.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.dp,
      alignment: Alignment.center,
      child: FlatText.blod(
        title,
        color: Colors.black,
        fontSize: 18.5,
      ),
    );
  }
}
