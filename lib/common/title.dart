import 'package:app_flutter/common/common_ui.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final bool safeTop;

  const TitleWidget({
    Key? key,
    required this.title,
    this.safeTop = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.dp,
      margin: EdgeInsets.only(top: safeTop ? 22.dp : 0),
      alignment: Alignment.center,
      child: FlatText.blod(
        title,
        color: Colors.black,
        fontSize: 18.5,
      ),
    );
  }
}
