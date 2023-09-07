import 'package:color_demo/controller/bet_controller.dart';
import 'package:color_demo/controller/dashboard_controller.dart';
import 'package:color_demo/controller/home_controller.dart';
import 'package:color_demo/controller/profile_controller.dart';
import 'package:color_demo/controller/wallet_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => BetController(), fenix: true);
    Get.lazyPut(() => WalletController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
