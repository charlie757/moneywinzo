import 'dart:convert';

import 'package:color_demo/api/apiconfig.dart';
import 'package:color_demo/config/routes.dart';
import 'package:color_demo/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formcreatekey = GlobalKey<FormState>();
  final checkBoxValue = false.obs;
  final passwordVisible = true.obs;
  final isLoading = false.obs;
  final checkBoxValidation = false.obs;
  void dispose() {
    // formcreatekey!.dispose();
  }

  validation() {
    if (!formcreatekey.currentState!.validate()) {
    } else if (checkBoxValue.value == false) {
      checkBoxValidation.value = true;
    } else {
      checkBoxValidation.value = false;
      // createAccountApiFunction();
      sendOtpApiFunction();
    }
  }

  void sendOtpApiFunction() async {
    isLoading.value = true;
    var body = json.encode({
      "mobile": '+91${numberController.text}',
      "type": "register",
    });
    final response = await ApiConfig.post(
        body: body, url: ApiConfig.otpUrl, useAuthToken: false);
    isLoading.value = false;
    if (response != null && response['success'] == true) {
      EasyLoading.showToast(response['otp'].toString());
      Get.toNamed(AppRoutes.otp);
    } else {
      EasyLoading.showToast(response['message'].toString(),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }
}
