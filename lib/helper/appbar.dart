import 'package:color_demo/helper/appimage.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context, String title, Function() onTap) {
  return AppBar(
    backgroundColor: ColorConstant.white,
    elevation: 0,
    leadingWidth: 30,
    leading: Container(
        height: 28,
        width: 28,
        alignment: Alignment.centerRight,
        child: GestureDetector(
            onTap: onTap,
            child: Image.asset(
              AppImages.leftImage,
              height: 28,
              width: 28,
            ))),
    title: getText(
        title: title,
        size: 17,
        fontFamily: LatoRegular,
        color: ColorConstant.blackColor,
        fontWeight: FontWeight.w400),
    centerTitle: true,
  );
}
