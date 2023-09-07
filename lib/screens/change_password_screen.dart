import 'package:color_demo/controller/change_password_controller.dart';
import 'package:color_demo/helper/appbar.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/customtextfield.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, changePasswordAppBar, () {
        Get.back();
      }),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextfield(
                    hintText: etOldPassword,
                    controller: controller.emailController),
                ScreenSize.height(20),
                CustomTextfield(
                    hintText: etPassword,
                    controller: controller.emailController),
                ScreenSize.height(20),
                CustomTextfield(
                    hintText: etConfirmPassword,
                    controller: controller.emailController),
                ScreenSize.height(20),
                CustomBtn(
                    title: btSaveNowPassword,
                    height: 45,
                    width: double.infinity,
                    color: ColorConstant.blackColor,
                    onTap: () {
                      // Get.toNamed(AppRoutes.otp);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
