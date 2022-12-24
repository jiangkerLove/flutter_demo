import 'package:app_flutter/common/colors.dart';
import 'package:app_flutter/common/common_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class NaviBar extends StatelessWidget {
  final String selectIcon;
  final String unSelectIcon;
  final Callback onTap;
  final bool select;
  final String tabText;

  const NaviBar({
    Key? key,
    required this.selectIcon,
    required this.unSelectIcon,
    required this.onTap,
    required this.select,
    required this.tabText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.only(top: 12.dp, bottom: 6.dp),
        child: AnimatedSwitcher(
          duration: const Duration(microseconds: 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                height: 24.dp,
                width: 24.dp,
                image: AssetImage(select ? selectIcon : unSelectIcon),
              ),
              SizedBox(height: 2.dp),
              FlatText(
                tabText,
                fontSize: 10,
                color: select ? btnColor : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
