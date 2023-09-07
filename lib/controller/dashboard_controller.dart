import 'package:color_demo/api/apiconfig.dart';
import 'package:color_demo/screens/dashboard/betscreen.dart';
import 'package:color_demo/screens/dashboard/homescreen.dart';
import 'package:color_demo/screens/dashboard/profilescreen.dart';
import 'package:color_demo/screens/dashboard/walletscreen.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  final screensList = [
    const HomeScreen(),
    const BetScreen(),
    const WalletScreen(),
    const ProfileScreen()
  ].obs;

  final selectedIndex = 0.obs;
}
