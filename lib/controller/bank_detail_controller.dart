import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BankDetailsController extends GetxController {
  final bankController = TextEditingController();
  final accountNoController = TextEditingController();
  final conformAccountNoController = TextEditingController();
  final ifscController = TextEditingController();

  final formKey = GlobalKey<FormState>();



  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void resetValues() {
    bankController.text = "";
    accountNoController.text = "";
    conformAccountNoController.text = "";
    ifscController.text = "";

  }


}
