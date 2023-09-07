import 'package:color_demo/controller/bank_detail_controller.dart';
import 'package:color_demo/controller/change_password_controller.dart';
import 'package:get/get.dart';

class BankDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BankDetailsController());
  }
}
