import 'package:color_demo/config/routes.dart';
import 'package:color_demo/controller/forgot_password_controller.dart';
import 'package:color_demo/helper/appbar.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/customtextfield.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:color_demo/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, forgotAppBar, () {
        Get.back();
      }),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 15, right: 15),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getText(
                    title: forgotAppBar,
                    size: 22,
                    fontFamily: LatoRegular,
                    color: ColorConstant.blackColor,
                    fontWeight: FontWeight.w700),
                ScreenSize.height(18),
                getText(
                    title: forgotPassSubTitle,
                    size: 15,
                    textAlign: TextAlign.center,
                    fontFamily: LatoRegular,
                    color: ColorConstant.hintColor,
                    fontWeight: FontWeight.w400),
                ScreenSize.height(24),
                CustomTextfield(
                    hintText: forgotPassEmail,
                    controller: controller.emailController),
                ScreenSize.height(14),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: forgotPassButton,
                        style: TextStyle(
                          color: ColorConstant.hintColor,
                          fontSize: AppFontSize.s14,
                          fontFamily: LatoRegular,
                        ),
                      ),
                      TextSpan(
                        text: "joyn*****@gmail.com",
                        style: TextStyle(
                          color: ColorConstant.blueColor,
                          fontSize: AppFontSize.s14,
                          fontFamily: LatoRegular,
                        ),
                      ),
                    ],
                  ),
                ),
                ScreenSize.height(34),
                CustomBtn(
                    title: forgotConfirmPassword,
                    height: 45,
                    width: double.infinity,
                    color: ColorConstant.blackColor,
                    onTap: () {
                      Get.toNamed(AppRoutes.otp);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
