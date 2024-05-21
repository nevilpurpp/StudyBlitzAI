import 'package:flutter/material.dart';
import '../../core/theme/my_app_colors.dart';

// ignore: must_be_immutable
class CommonSendButton extends StatelessWidget {
  CommonSendButton({super.key, required this.onPressed});
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.send,
          color: ColorConstants.white38,
        ));
  }
}
