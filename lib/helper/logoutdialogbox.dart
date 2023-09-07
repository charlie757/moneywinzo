import 'package:color_demo/controller/home_controller.dart';
import 'package:color_demo/helper/appcolor.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void logoutDialogBox(BuildContext context, HomeController homeController) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        title: 'Logout',
                        size: 18,
                        fontFamily: LatoRegular,
                        color: ColorConstant.blackColor,
                        fontWeight: FontWeight.w600),
                    ScreenSize.height(15),
                    getText(
                        title: 'Are you sure want to logout?',
                        size: 15,
                        fontFamily: LatoRegular,
                        color: ColorConstant.blackColor,
                        fontWeight: FontWeight.w400),
                    ScreenSize.height(30),
                    Row(
                      children: [
                        Flexible(
                            child: CustomBtn(
                                title: 'No',
                                height: 44,
                                width: 100,
                                color: ColorConstant.blackColor,
                                onTap: () {
                                  Get.back();
                                })),
                        ScreenSize.width(15),
                        Flexible(
                            child: CustomBtn(
                                title: 'Yes',
                                height: 44,
                                width: 100,
                                color: ColorConstant.blackColor,
                                onTap: () {
                                  homeController.logout();
                                })),
                      ],
                    )
                  ]),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}
