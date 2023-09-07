import 'package:color_demo/utils/customcircle.dart';
import 'package:flutter/material.dart';

showCircleProgressDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          child: CustomCircularProgressIndicator(),
          onWillPop: () async {
            return false;
          },
        );
      });
}
