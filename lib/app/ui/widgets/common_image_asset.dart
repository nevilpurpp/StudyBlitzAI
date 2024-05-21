import 'package:flutter/material.dart';
import 'package:nevilai/app/core/constants/assets_constant.dart';
import '../../core/theme/my_app_colors.dart';
import 'common_sized_box.dart';

// ignore: must_be_immutable
class CommonMenuButton extends StatelessWidget {
  CommonMenuButton({super.key, required this.onTap});
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CommonSizedBox(
      height: 22,
      width: 22,
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          AssetConstant.clipIcon,
          color: ColorConstants.white38,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
