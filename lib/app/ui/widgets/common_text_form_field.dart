import 'package:flutter/material.dart';

import '../../core/theme/my_app_colors.dart';


// ignore: must_be_immutable
class CommonTextFormField extends StatelessWidget {
  

  CommonTextFormField(
      {super.key,
      this.suffixIconWidget,
      this.prefixIconWidget,
      this.hintTextWidget,
      this.onEditingComplete,
      this.onTap,
      this.controller
      });

  void Function()? onEditingComplete;
  void Function()? onTap;
  TextEditingController? controller;
  Widget? prefixIconWidget;
  Widget? suffixIconWidget;
  String? hintTextWidget;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextFormField(
        minLines: 1,
        maxLines: 30,
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.text,
        onTap: onTap,
        cursorColor: ColorConstants.white,
        style: const TextStyle(
            color: ColorConstants.white, fontWeight: FontWeight.w500),
        onEditingComplete: onEditingComplete,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suffixIconWidget,
            prefixIcon: prefixIconWidget,
            filled: true,
            hintText: hintTextWidget,
            hintStyle:
                const TextStyle(color: ColorConstants.white38, fontSize: 17),
            fillColor: ColorConstants.green373E4E,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)))),
      ),
    );
  }
}
