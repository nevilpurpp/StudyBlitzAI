import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonSizedBox extends StatelessWidget {
  CommonSizedBox({super.key, this.child, this.height, this.width});
  double? height;
  double? width;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
