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
      this.controller,
      this.obsocuringCharacter,
      this.obscureText= false,
      this.maxLines,
      this.minLines,
      this.labelTextWidget,
      });

  void Function()? onEditingComplete;
  void Function()? onTap;
  TextEditingController? controller;
  Widget? prefixIconWidget;
  Widget? suffixIconWidget;
  String? hintTextWidget;
  String? obsocuringCharacter;
   bool   obscureText;
int? maxLines;
int? minLines;
String? labelTextWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextFormField(
        obscureText: obscureText,
        minLines: minLines,
        maxLines: obscureText ? 1 : null,
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.text,
        onTap: onTap,
        cursorColor: Theme.of(context).brightness == Brightness.dark
                 ? ColorConstants.white38
                 :  ColorConstants.green3D4354,
        style:  TextStyle(
            color:  Theme.of(context).brightness == Brightness.dark
                 ? ColorConstants.white38
                 :  ColorConstants.green3D4354, fontWeight: FontWeight.w500),
        onEditingComplete: onEditingComplete,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suffixIconWidget,
            prefixIcon: prefixIconWidget,
            filled: true,
            hintText: hintTextWidget,
            hintStyle:
                 TextStyle(color: Theme.of(context).brightness == Brightness.dark
                 ? ColorConstants.white38
                 :  ColorConstants.green3D4354, fontSize: 17),
            fillColor: Theme.of(context).brightness == Brightness.dark
                  ? ColorConstants.green3D4354
                  : Colors.white70,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                labelText: labelTextWidget, 
                ),
               
      ),
    );
  }
}
