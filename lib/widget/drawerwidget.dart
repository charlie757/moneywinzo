import 'package:color_demo/controller/home_controller.dart';
import 'package:color_demo/helper/appimage.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/helper/logoutdialogbox.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_avatar/random_avatar.dart';

drawer(BuildContext context, HomeController homeController) {
  return Container(
    width: MediaQuery.of(context).size.width - 70,
    height: double.infinity,
    color: ColorConstant.blackColor,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 45,
            right: 8,
          ),
          child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  AppImages.closeIcon,
                  width: 25,
                  height: 25,
                ),
              )),
        ),
        ScreenSize.height(30),
        Padding(
          padding: const EdgeInsets.only(left: 21),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ColorConstant.white),
                    child: Image.asset(
                      AppImages.userIcon,
                      height: 35,
                      width: 28,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 26,
                      width: 26,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: ColorConstant.white),
                      child: Image.asset(
                        AppImages.cameraIcon,
                        height: 10,
                        width: 12,
                      ),
                    ),
                  )
                ],
              ),
              // RandomAvatar('saytoonz', height: 50, width: 50),
              ScreenSize.width(22),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        title: homeController.userName.value,
                        size: 18,
                        fontFamily: LatoRegular,
                        color: ColorConstant.white,
                        fontWeight: FontWeight.w700),
                    ScreenSize.height(9),
                    getText(
                        title: homeController.mobile.value,
                        size: 12,
                        fontFamily: LatoRegular,
                        color: ColorConstant.white,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              )
            ],
          ),
        ),
        ScreenSize.height(38),
        Container(
          height: 1,
          color: ColorConstant.c0Color,
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              ScreenSize.height(20),
              drawerItemWidget('Wallet', AppImages.drawer1Icon, () {}),
              ScreenSize.height(5),
              drawerItemWidget('My Bets', AppImages.drawer2Icon, () {}),
              ScreenSize.height(5),
              drawerItemWidget(
                  'Financial Statements', AppImages.drawer3Icon, () {}),
              ScreenSize.height(5),
              drawerItemWidget('How to play', AppImages.drawer4Icon, () {}),
              ScreenSize.height(5),
              drawerItemWidget('Support', AppImages.drawer5Icon, () {}),
              ScreenSize.height(5),
              drawerItemWidget('Settings', AppImages.drawer6Icon, () {}),
              ScreenSize.height(5),
              drawerItemWidget('Share', AppImages.drawer7Icon, () {}),
              ScreenSize.height(5),
              drawerItemWidget('Log Out', AppImages.drawer8Icon, () {
                Get.back();
                logoutDialogBox(context, homeController);
              }),
            ],
          ),
        ))
      ],
    ),
  );
}

drawerItemWidget(String title, String img, Function() onTap) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 21),
      height: 50,
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.white.withOpacity(.3)),
            child: Image.asset(
              img,
              height: 18,
              width: 18,
            ),
          ),
          ScreenSize.width(13),
          getText(
              title: title,
              size: 14,
              fontFamily: LatoRegular,
              color: ColorConstant.white,
              fontWeight: FontWeight.w400)
        ],
      ),
    ),
  );
}
