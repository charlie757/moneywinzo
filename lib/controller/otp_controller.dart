import 'dart:async';
import 'dart:convert';

import 'package:color_demo/api/apiconfig.dart';
import 'package:color_demo/api/preferencestorage.dart';
import 'package:color_demo/config/routes.dart';
import 'package:color_demo/controller/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final registerController = Get.put(RegisterController());
  final isLoading = false.obs;
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final counter = 0.obs;
  Timer? timer;

  @override
  void onInit() async {
    startTimer();
    super.onInit();
  }

  startTimer() {
    //shows timer
    counter.value = 30; //time counter
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter.value > 0 ? counter.value-- : timer.cancel();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void resetValues() {
    otpController.text = "";
  }

  checkValidation() async {
    if (formKey.currentState!.validate()) {
      verifyOtpApiFunction();
    }
  }

  verifyOtpApiFunction() async {
    isLoading.value = true;
    var body = json.encode({
      "mobile": "+91${registerController.numberController.text}",
      "device_token": "test123123",
      'otp': otpController.text
    });
    final response = await ApiConfig.post(
        body: body, url: ApiConfig.verifyOtpUrl, useAuthToken: false);
    isLoading.value = false;
    if (response != null && response['success'] == true) {
      response['user']['is_register'] != null &&
              !response['user']['is_register']
          ? createAccountApiFunction()
          : null;
    } else {
      EasyLoading.showToast(response['message'].toString(),
          toastPosition: EasyLoadingToastPosition.bottom);
    }
  }

  resendApiFunction() async {
    var body = json.encode({
      "mobile": "+91${registerController.numberController.text}",
      "type": "register"
    });
    final response = await ApiConfig.post(
        body: body, url: ApiConfig.resendUrl, useAuthToken: false);
    if (response != null && response['success'] == true) {
      EasyLoading.showToast(response['otp'].toString());
      startTimer();
    }
  }

  createAccountApiFunction() async {
    isLoading.value = true;
    var body = json.encode({
      'name': registerController.nameController.text,
      "email": registerController.emailController.text.toString(),
      "mobile": "+91${registerController.numberController.text}",
      "password": registerController.passwordController.text.toString(),
      "device_token": "test123123"
    });
    final response = await ApiConfig.post(
        body: body, url: ApiConfig.signUpUrl, useAuthToken: false);
    isLoading.value = false;
    if (response != null && response['success'] == true) {
      Get.offAllNamed(AppRoutes.dashboard);
      setAuthToken(response['user']['token']);
      EasyLoading.showToast(response['message'].toString(),
          toastPosition: EasyLoadingToastPosition.bottom);
    } else {
      EasyLoading.showToast(response['message'].toString(),
          toastPosition: EasyLoadingToastPosition.bottom);
      // errorSnackBar('Error', response['message']);
    }
  }
}
