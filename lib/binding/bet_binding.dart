import 'package:color_demo/controller/bet_controller.dart';
import 'package:get/get.dart';

class BetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BetController());
  }
}
