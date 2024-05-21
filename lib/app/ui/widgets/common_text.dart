import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonText extends StatelessWidget {
  CommonText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      required this.fontWeight});
  String text;
  Color color;
  double? fontSize;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontWeight: FontWeight.w400, fontSize: fontSize),
    );
  }
}
