import 'package:color_demo/controller/splash_controller.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: getText(
                title: splashTitle,
                size: 64,
                fontFamily: GochiHandRegular,
                color: ColorConstant.white,
                fontWeight: FontWeight.w400)));
  }
}
