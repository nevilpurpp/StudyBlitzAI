import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonImages extends StatelessWidget {
  CommonImages(
      {super.key,
      required this.file,
      this.bottomLeft,
      this.bottomRight,
      this.topLeft,
      this.topRight});
  File file;
  double? bottomLeft;
  double? bottomRight;
  double? topLeft;
  double? topRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeft ?? 0),
            bottomRight: Radius.circular(bottomRight ?? 0),
            topLeft: Radius.circular(topLeft ?? 0),
            topRight: Radius.circular(topRight ?? 0)),
        child: Image.file(
          file,
          height: 200,
          width: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
