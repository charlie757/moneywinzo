import 'package:color_demo/controller/bank_detail_controller.dart';
import 'package:color_demo/controller/change_password_controller.dart';
import 'package:color_demo/helper/appbar.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/customtextfield.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankDetailsScreen extends GetView<BankDetailsController> {
  const BankDetailsScreen({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, bankDetailsAppBar, () {
        Get.back();
      }),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextfield(
                    hintText: etEnterBankName,
                    controller: controller.bankController),
                ScreenSize.height(20),
                CustomTextfield(
                    hintText: etEnterAccountNumber,
                    controller: controller.accountNoController),
                ScreenSize.height(20),
                CustomTextfield(
                    hintText: etConformAccountNumber,
                    controller: controller.conformAccountNoController),
                ScreenSize.height(20),
                CustomTextfield(
                    hintText: etEnterIfsc,
                    controller: controller.ifscController),
                ScreenSize.height(50),
                CustomBtn(
                    title: save,
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
