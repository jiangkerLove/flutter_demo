import 'package:app_flutter/common/common_ui.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final bool safeTop;
  final bool showBack;

  const TitleWidget({
    Key? key,
    required this.title,
    this.safeTop = true,
    this.showBack = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.dp,
      margin: EdgeInsets.only(top: safeTop ? 22.dp : 0),
      child: Stack(
        children: [
          Container(
            height: 44.dp,
            width: double.infinity,
            alignment: Alignment.center,
            child: FlatText.blod(
              title,
              color: Colors.black,
              fontSize: 18.5,
            ),
          ),
          if (showBack)
            Positioned(
              left: 10.dp,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image(
                  width: 11.dp,
                  height: 18.dp,
                  image: const AssetImage("images/ic_back.png"),
                ),
              ),
            )
        ],
      ),
    );
  }
}
