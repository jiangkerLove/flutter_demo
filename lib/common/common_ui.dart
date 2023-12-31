import 'package:flutter/material.dart';

double baseScale = 1;

extension IntExtension on int {
  double get dp => this * baseScale;
}

extension DoubleExtension on double {
  double get dp => this * baseScale;
}

class FlatText extends StatelessWidget {
  final String? data;

  final double? fontSize;

  final FontWeight? fontWeight;

  final Color? color;

  final TextOverflow? overflow;

  final int? maxLines;

  const FlatText(
    this.data, {
    Key? key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  factory FlatText.blod(
    String data, {
    Key? key,
    Color? color,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return FlatText(
      data,
      key: key,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? "",
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
    );
  }
}

class KeepAliveWidget extends StatefulWidget {
  final Widget child;

  const KeepAliveWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<KeepAliveWidget> createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

class OverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if (getPlatform(context) == TargetPlatform.android) {
      return GlowingOverscrollIndicator(
        showLeading: false,
        //不显示尾部水波纹
        showTrailing: false,
        axisDirection: axisDirection,
        color: Colors.transparent,
        child: child,
      );
    }
    return child;
  }
}

class InputText extends StatelessWidget {
  final String? hintText;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? inputController;
  final bool showNotice;

  const InputText({
    Key? key,
    this.hintText,
    this.maxLines,
    this.maxLength,
    this.inputController,
    this.showNotice = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      maxLength: maxLength,
      controller: inputController,
      decoration: InputDecoration(
        // 字数提示
        counterText: showNotice ? null : "",
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }
}
