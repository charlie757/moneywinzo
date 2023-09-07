import 'package:color_demo/controller/wallet_controller.dart';
import 'package:color_demo/helper/appimage.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/color_constant.dart';
import '../../utils/constants.dart';

class WalletScreen extends GetView<WalletController> {
  const WalletScreen({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              header(),
              ScreenSize.height(3),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15,),
                    mainScreen(context)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  header() {
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {

          },
          child: Container(
            height: 25,
            width: 25,
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.drawrIcon,
              height: 20,
              width: 20,
            ),
          ),
        ),
        ScreenSize.width(7.7),
        getText(
            title: 'Get2 Money',
            size: 12,
            fontFamily: LatoRegular,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w700),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
              color: ColorConstant.lightBlueColor,
              borderRadius: BorderRadius.circular(3)),
          padding:
          const EdgeInsets.only(left: 8, top: 5, bottom: 4.13, right: 11),
          child: Row(
            children: [
              Image.asset(
                AppImages.walletIcon,
                width: 20,
                height: 16,
              ),
              ScreenSize.width(7.13),
              getText(
                  title: '₹565',
                  size: 14,
                  fontFamily: LatoRegular,
                  color: ColorConstant.white,
                  fontWeight: FontWeight.w400)
            ],
          ),
        ),
        ScreenSize.width(16),
        Image.asset(
          AppImages.notificationIcon,
          height: 18,
          width: 17,
        )
      ],
    );
  }

  mainScreen(BuildContext context)
  {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width-50,
        child: Column(
          children: [
            getText(
                title: 'Wallet Balance',
                size: 16,
                fontFamily: LatoRegular,
                color: ColorConstant.blackColor,
                fontWeight: FontWeight.w500),

            ScreenSize.height(10.7),
            getText(
                title: '₹565.99',
                size: 16,
                fontFamily: LatoRegular,
                color: ColorConstant.blueColor,
                fontWeight: FontWeight.w700),
            ScreenSize.height(10.7),
            walletBtn(
                AppImages.addMoneyIcon, 'Add Money', ColorConstant.greenColor,
                    () => null),
            ScreenSize.height(10.7),

          ],
        ),
      ),
    );
  }
  walletBtn(String img, String title, Color color, Function() onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              width: 20,
              height: 20,
            ),
            ScreenSize.width(5),
            getText(
                title: title,
                size: 14,
                fontFamily: LatoRegular,
                color: ColorConstant.white,
                fontWeight: FontWeight.w700),
          ],
        ),
      ),
    );
  }


}
