import 'package:color_demo/config/routes.dart';
import 'package:color_demo/controller/login_controller.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/customtextfield.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:color_demo/utils/size_config.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black45,
        statusBarIconBrightness: Brightness.light
        //color set to transperent or set your own color
        ));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText(
                      title: loginTitle,
                      size: AppFontSize.s20,
                      fontFamily: LatoBlack,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w800),
                  ScreenSize.height(4),
                  getText(
                      title: loginSubTitle,
                      textAlign: TextAlign.start,
                      size: AppFontSize.s20,
                      fontFamily: LatoBlack,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w800),
                  ScreenSize.height(21),
                  CustomTextfield(
                    hintText: loginMobile,
                    controller: controller.numberController,
                    textInputType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return loginEnterPhoneValidation;
                      } else if (val.length < 10) {
                        return loginEnterValidPhoneValidation;
                      }
                    },
                  ),
                  ScreenSize.height(31),
                  CustomTextfield(
                    hintText: loginPassword,
                    controller: controller.passwordController,
                    isObscureText: controller.passwordVisible.value,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return loginEnterPassword;
                      }
                    },
                  ),
                  ScreenSize.height(10),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.forgotPassword);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        getText(
                            textAlign: TextAlign.end,
                            title: loginForgotPass,
                            size: AppFontSize.s14,
                            fontFamily: LatoRegular,
                            color: ColorConstant.lightBlueColor,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                  ),
                  ScreenSize.height(31),
                  Obx(
                    () => CustomBtn(
                        title: loginButton,
                        height: 45,
                        width: double.infinity,
                        color: ColorConstant.blackColor,
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          controller.isLoading.value
                              ? null
                              : controller.validation();
                        }),
                  ),
                  ScreenSize.height(21),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.createAccount);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getText(
                            textAlign: TextAlign.end,
                            title: loginNewUser,
                            size: AppFontSize.s14,
                            fontFamily: LatoRegular,
                            color: ColorConstant.newUser,
                            fontWeight: FontWeight.w700),
                        ScreenSize.width(5),
                        getText(
                            textAlign: TextAlign.end,
                            title: loginCreateAccount,
                            size: AppFontSize.s14,
                            fontFamily: LatoRegular,
                            color: ColorConstant.blackColor,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
