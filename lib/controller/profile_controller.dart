import 'dart:convert';
import 'package:color_demo/api/apiconfig.dart';
import 'package:color_demo/utils/showcircleprogressdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  @override
  void onInit() {
    Future.delayed(Duration.zero, () {
      userDetailApiFunction();
    });
    super.onInit();
  }

  validation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      updateUserProfileApiFunction(context);
    }
  }

  userDetailApiFunction() async {
    showCircleProgressDialog(Get.context!);
    final response =
        await ApiConfig.get(url: ApiConfig.userDetailsUrl, useAuthToken: true);
    Get.back();
    if (response != null && response['success'] == true) {
      print(response['user']);
      nameController.text = response['user']['name'] ?? "";
      emailController.text = response['user']['email'] ?? "";
      numberController.text = response['user']['mobile'] ?? "";
    }
  }

  void updateUserProfileApiFunction(BuildContext context) async {
    showCircleProgressDialog(context);
    isLoading.value = true;
    var body = json.encode({
      "mobile": nameController.text.toString(),
      "email": emailController.text.toString(),
      "name": numberController.text.toString(),
    });
    final response = await ApiConfig.post(
        body: body, url: ApiConfig.updateUserDetailsUrl, useAuthToken: true);
    Get.back();
    isLoading.value = false;
    if (response != null && response['success'] == true) {
      EasyLoading.showToast(response['message'].toString());
    } else {
      EasyLoading.showToast(response['message'].toString(),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }
}
