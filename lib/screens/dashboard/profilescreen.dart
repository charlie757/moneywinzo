import 'package:color_demo/config/routes.dart';
import 'package:color_demo/controller/profile_controller.dart';
import 'package:color_demo/helper/appbar.dart';
import 'package:color_demo/helper/appimage.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/customtextfield.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:color_demo/utils/size_config.dart';
import 'package:color_demo/utils/validation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.white,
        elevation: 0,
        leadingWidth: 30,
        title: getText(
            title: "Profile",
            size: 20,
            fontFamily: LatoRegular,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w400),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.brown),
                      // child:RandomAvatar('donn', height: 100, width: 100,trBackground: false),
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
                ScreenSize.height(10),
                getText(
                    title: 'John Doe',
                    size: AppFontSize.s20,
                    fontFamily: LatoRegular,
                    color: ColorConstant.blueColor,
                    fontWeight: FontWeight.w500),
                ScreenSize.height(25),
                CustomTextfield(
                  hintText: etName,
                  isReadOnly: true,
                  controller: controller.nameController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return registerName;
                    }
                  },
                ),
                ScreenSize.height(31),
                CustomTextfield(
                    hintText: etMobile,
                    isReadOnly: true,
                    controller: controller.numberController),
                ScreenSize.height(31),
                CustomTextfield(
                  hintText: etEmail,
                  controller: controller.emailController,
                  isReadOnly: true,
                  validator: (value) {
                    if (value == null ||
                        (!isValidEmail(value, isRequired: true))) {
                      return registerValidEmail;
                    }
                    return null;
                  },
                ),
                ScreenSize.height(31),
                CustomBtn(
                    title: save,
                    height: 45,
                    width: double.infinity,
                    color: ColorConstant.blackColor,
                    isLoading: controller.isLoading.value,
                    onTap: () {
                      controller.validation(context);
                    }),
                ScreenSize.height(21),
                GestureDetector(
                  onTap: () {},
                  child: CustomBtn(
                      title: "Add Bank Details",
                      height: 45,
                      width: double.infinity,
                      color: ColorConstant.blackColor,
                      onTap: () {
                        Get.toNamed(AppRoutes.bankDetails);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
