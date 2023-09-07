import 'dart:async';
import 'dart:convert';

import 'package:color_demo/api/apiconfig.dart';
import 'package:color_demo/config/routes.dart';
import 'package:color_demo/utils/showcircleprogressdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final isSelectedBetId = ''.obs;
  final gameId = ''.obs;
  final gameTimer = ''.obs;
  final type = ''.obs;
  final apiColorList = [].obs;
  final apiNumberList = [].obs;
  final userName = "".obs;
  final mobile = "".obs;
  final isViewResult = false.obs;
  final tabBarIndex = 0.obs;
  final amountController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final counter = 0.obs;
  Timer? timer;
  final remainingSeconds = 120.obs; // 2 minutes in seconds
  late Timer _timer;

  final colorList = [
    const Color(0xff008000),
    const Color(0xff6868AC),
    const Color(0xffB3906C),
    const Color(0xffD65079),
    const Color(0xffE187B8),
    const Color(0xffE9435E),
    const Color(0xffECC371),
    const Color(0xff85A1AC),
    const Color(0xff85AC89),
  ].obs;
  final numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9].obs;

  @override
  void onInit() {
    Future.delayed(Duration.zero, () {
      gameApiFunction(Get.context!);
    });

    startTimer();
    userDetailApiFunction();
    super.onInit();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '0${minutes}m:${remainingSeconds.toString().padLeft(1, '0')}s';
  }

  // startTimer() {
  //   //shows timer
  //   counter.value = 30; //time counter
  //   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     counter.value > 0 ? counter.value-- : timer.cancel();
  //   });
  // }

  validation() async {
    if (formKey.currentState!.validate()) {
      betApiFunction();
      userDetailApiFunction();
    }
  }

  gameApiFunction(BuildContext context) async {
    showCircleProgressDialog(context);
    final response =
        await ApiConfig.get(url: ApiConfig.gameUrl, useAuthToken: true);
    apiColorList.clear();
    apiNumberList.clear();
    gameId.value = '';
    gameTimer.value = '';
    Get.back();
    if (response != null && response['success'] == true) {
      gameId.value = response['game']['game_id'];
      gameTimer.value = response['game']['time'];
      apiColorList.value = response['game']['options']['colors'];
      apiNumberList.value = response['game']['options']['numbers'];
      remainingSeconds.value = response['game']['time'];
    }
  }

  userDetailApiFunction() async {
    final response =
        await ApiConfig.get(url: ApiConfig.userDetailsUrl, useAuthToken: true);
    if (response != null && response['success'] == true) {
      userName.value = response['user']['name'];
      mobile.value = response['user']['mobile'];
    }
  }

  betApiFunction() async {
    var body = json.encode({
      "game_id": gameId.value,
      "bet_color": null,
      "bet_number": "2",
      'type': type.value,
      "bet_amount": 10
    });
    final response = await ApiConfig.post(
        body: body, url: ApiConfig.betGameUrl, useAuthToken: true);
  }

  viewResultApiFunction() async {
    final response = await ApiConfig.get(
        url: "${ApiConfig.getGameResultUrl}number", useAuthToken: true);
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
