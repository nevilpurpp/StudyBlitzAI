import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static  showSuccess(String message, {ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity, 
      backgroundColor:  Colors.green, 
      textColor: Colors.white,
    );
  }
   static  showError(String message, {ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity, // Adjust gravity as needed
      backgroundColor:  Colors.red,// Set color based on message
      textColor: Colors.white,
    );
  }
    static bool validateEmail(String email) {
    final emailRegExp = RegExp(r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}");
    return emailRegExp.hasMatch(email);
  }
}
