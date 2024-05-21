import 'package:flutter/material.dart';
import '../../core/theme/my_app_colors.dart';
import 'common_text.dart';

// ignore: must_be_immutable
class CommonPopUpItems extends StatelessWidget {
  CommonPopUpItems(
      {super.key,
      required this.onTap,
      required this.colorsList,
      required this.text,
      required this.icon});
  void Function()? onTap;
  List<Color> colorsList;
  IconData? icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(200)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: colorsList)),
              child: Icon(
                icon,
                color: ColorConstants.white,
                size: 35,
              ),
            ),
          ),
        ),
        CommonText(
          text: text,
          color: ColorConstants.white38,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
