import 'package:color_demo/config/routes.dart';
import 'package:color_demo/controller/register_controller.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/customtextfield.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:color_demo/utils/size_config.dart';
import 'package:color_demo/utils/validation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black45,
        statusBarIconBrightness: Brightness.light
        //color set to transperent or set your own color
        ));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formcreatekey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 28, top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getText(
                          title: registerTitle,
                          size: AppFontSize.s24,
                          fontFamily: LatoBlack,
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.w800),
                      ScreenSize.height(6),
                      getText(
                          title: registerSubTitle,
                          textAlign: TextAlign.start,
                          size: AppFontSize.s14,
                          fontFamily: LatoLight,
                          color: ColorConstant.hintColor,
                          fontWeight: FontWeight.w800),
                      ScreenSize.height(21),
                      CustomTextfield(
                        hintText: registerName,
                        controller: controller.nameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return registerName;
                          }
                        },
                      ),
                      ScreenSize.height(21),
                      CustomTextfield(
                        hintText: registerMobile,
                        controller: controller.numberController,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        validator: (val) {
                          if (val!.isEmpty) {
                            return registerEnterPhone;
                          } else if (val.length < 10) {
                            return registerValidPhone;
                          }
                        },
                      ),
                      ScreenSize.height(21),
                      CustomTextfield(
                        hintText: registerEnterEmail,
                        controller: controller.emailController,
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return registerValidEmail;
                          }
                          return null;
                        },
                      ),
                      ScreenSize.height(21),
                      CustomTextfield(
                        hintText: registerPassword,
                        controller: controller.passwordController,
                        isObscureText: controller.passwordVisible.value,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return registerEnterPassword;
                          } else if (val.length < 6) {
                            return registerValidPassword;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                ScreenSize.height(11),
                Row(
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.black87,
                          value: controller.checkBoxValue.value,
                          onChanged: (bool? value) {
                            controller.checkBoxValue.value = value!;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: registerAgree,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: AppFontSize.s16,
                            fontFamily: LatoLight,
                          ),
                          children: [
                            TextSpan(
                              text: registerTerms,
                              style: TextStyle(
                                color: ColorConstant.hintColor,
                                fontSize: AppFontSize.s16,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            const TextSpan(text: registerAnd),
                            TextSpan(
                              text: registerPrivacy,
                              style: TextStyle(
                                fontSize: AppFontSize.s16,
                                color: ColorConstant.hintColor,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  /* controller.launchURL(
                                      'https://www.kodago.com/page/privacy-policy');*/
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 20),
                    child: CustomBtn(
                        title: registerButton,
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
                ),
                ScreenSize.height(21),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(AppRoutes.login);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getText(
                          textAlign: TextAlign.end,
                          title: registerAlreadyAccount,
                          size: AppFontSize.s14,
                          fontFamily: LatoRegular,
                          color: ColorConstant.newUser,
                          fontWeight: FontWeight.w700),
                      ScreenSize.width(5),
                      getText(
                          textAlign: TextAlign.end,
                          title: registerLogIn,
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
      ),
    );
  }
}
