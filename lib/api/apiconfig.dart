import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'package:color_demo/config/routes.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/validation.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiConfig {
  static String baseUrl = 'https://uiuxdepot.com/ankur/money_winzo/public/api/';

  // atuh
  static String signUpUrl = '${baseUrl}user/signup';
  static String loginUrl = '${baseUrl}user/login';
  static String otpUrl = '${baseUrl}otp/send';
  static String resendUrl = '${baseUrl}otp/resend';
  static String verifyOtpUrl = '${baseUrl}otp/verify';
  static String userDetailsUrl = '${baseUrl}user/get_detail';
  static String updateUserDetailsUrl = '${baseUrl}user/update_detail';


  static String gameUrl = '${baseUrl}game';
  static String betGameUrl = '${baseUrl}user/game/bet';
  static String getGameResultUrl = '${baseUrl}game/get_result?type=';
  static String getMyBetUrl = '${baseUrl}user/game/my_bet';

  static Future post({
    required body,
    required String url,
    required bool useAuthToken,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print('body....$body');
      final response = await http.post(Uri.parse(url), body: body, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Bearer ${prefs.getString(authToken)}",
      });
      print(response.request);
      print(body);
      if (kDebugMode) {
        log(response.body);
      }
      final dataAll = json.decode(response.body);
      if (response.statusCode == 200) {
        return dataAll;
      } else {
        if (dataAll['message'] == 'Fail to authenticate token.') {
          prefs.clear();
          Get.offAllNamed(AppRoutes.login);
        }
        if (dataAll['message'] ==
            'Your profile is blocked. Please contact to admin') {
          prefs.clear();
          Get.offAllNamed(AppRoutes.login);
        }
        return dataAll;
      }
    } catch (e) {
      if (e is SocketException) {
        internetSnackbar();
        print("Socket exception: ${e.toString()}");
      } else if (e is TimeoutException) {
        //treat TimeoutException
        print("Timeout exception: ${e.toString()}");
      } else {
        print("Unhandled exception: ${e.toString()}");
      }
    }
  }

  static Future get({
    required String url,
    required bool useAuthToken,
    Map<String, dynamic>? queryParameters,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString(authToken).toString());
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${prefs.getString(authToken)}",
      });
      if (kDebugMode) {
        log(response.body);
        print(response.request);
      }
      final resultPort = ReceivePort();

      final dataAll = json.decode(response.body);
      // print("dataAll...$dataAll");
      if (response.statusCode == 200) {
        // print("dataAll2...$dataAll");

        return dataAll;
      } else {
        if (dataAll['message'] == 'Fail to authenticate token.') {
          prefs.clear();
          Get.offAllNamed(AppRoutes.login);
        }
        if (dataAll['message'] ==
            'Your profile is blocked. Please contact to admin') {
          prefs.clear();
          Get.offAllNamed(AppRoutes.login);
        }

        return null;
      }
    } catch (e) {
      if (e is SocketException) {
        internetSnackbar();
        print("Socket exception: ${e.toString()}");
      } else if (e is TimeoutException) {
        print("Timeout exception: ${e.toString()}");
      } else {
        print("Unhandled exception: ${e.toString()}");
      }
    }
  }

  static Future delete({
    required String url,
    required bool useAuthToken,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await http.delete(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${prefs.getString(authToken)}"
      });
      print(response.request);

      if (kDebugMode) {
        log(response.body);
      }
      final dataAll = json.decode(response.body);
      if (response.statusCode == 200) {
        return dataAll;
      } else {
        // errorSnackBar('Error', dataAll['message'].toString());
        return dataAll;
      }
    } catch (e) {
      rethrow;
    }
  }
}
