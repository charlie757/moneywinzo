import 'package:color_demo/controller/dashboard_controller.dart';
import 'package:color_demo/helper/appimage.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Obx(() => controller.screensList[controller.selectedIndex.value]),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(color: ColorConstant.white, boxShadow: [
            BoxShadow(
              color: ColorConstant.hintColor,
              offset: const Offset(0, -1),
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomImage(AppImages.dashboard1Icon, 0, () {
                controller.selectedIndex.value = 0;
              }),
              bottomImage(AppImages.dashboard2Icon, 1, () {
                controller.selectedIndex.value = 1;
              }),
              bottomImage(AppImages.dashboard3Icon, 2, () {
                controller.selectedIndex.value = 2;
              }),
              bottomImage(AppImages.dashboard4Icon, 3, () {
                controller.selectedIndex.value = 3;
              }),
            ],
          ),
        ),
      ),
    );
  }

  bottomImage(String img, index, Function() onTap) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        child: Image.asset(
          img,
          height: 26,
          width: 20,
          color: controller.selectedIndex.value == index
              ? ColorConstant.blackColor
              : ColorConstant.hintColor,
        ),
      ),
    );
  }
}
