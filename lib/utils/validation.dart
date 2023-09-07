import 'package:color_demo/helper/appcolor.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

String emailPattern =
    r'^(([^<>()[\]\\.,;:@\"]+(\.[^<>()[\]\\.,;:@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

String gstPattern =
    '[0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9A-Za-z]{1}[Z]{1}[0-9a-zA-Z]{1}';
final whiteSpaceRegex = RegExp(r'\s+');

bool isValidEmail(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

internetSnackbar() {
  ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      shape: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.redColor),
          borderRadius: BorderRadius.circular(3)),
      //  margin: EdgeInsets.only(left: 20,right: 20,bottom: bottom),
      backgroundColor: AppColor.redColor,
      content: Text('No internet connectivity')));
}
