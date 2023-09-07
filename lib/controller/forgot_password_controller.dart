import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
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
    emailController.text = "";
  }


}
