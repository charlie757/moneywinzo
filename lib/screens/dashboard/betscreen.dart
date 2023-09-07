import 'package:color_demo/controller/bet_controller.dart';
import 'package:color_demo/helper/appimage.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BetScreen extends GetView<BetController> {
  const BetScreen({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(),
            ScreenSize.height(30),
            Expanded(
                child: ListView.separated(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 40),
                    separatorBuilder: (context, sp) {
                      return ScreenSize.height(12);
                    },
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return betsUI();
                    }))
          ],
        ),
      ),
    );
  }

  betsUI() {
    return Container(
      padding: const EdgeInsets.only(top: 18, left: 10, right: 9, bottom: 17),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorConstant.hintColor.withOpacity(.25))),
      child: Column(
        children: [
          Row(
            children: [
              getText(
                  title: 'Game ID',
                  size: 10,
                  fontFamily: LatoBold,
                  color: ColorConstant.blackColor,
                  fontWeight: FontWeight.w400),
              ScreenSize.width(8),
              getText(
                  title: 'C3232342',
                  size: 10,
                  fontFamily: LatoRegular,
                  color: ColorConstant.lightBlueColor,
                  fontWeight: FontWeight.w700),
              const Spacer(),
              getText(
                  title: 'Date :- 22/10/2022 11:35 AM',
                  size: 10,
                  fontFamily: LatoBold,
                  color: ColorConstant.blackColor,
                  fontWeight: FontWeight.w400)
            ],
          ),
          ScreenSize.height(19),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  getText(
                      title: 'Bet',
                      size: 10,
                      fontFamily: LatoRegular,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w600),
                  ScreenSize.height(9),
                  btn(ColorConstant.lightBlueColor, 'Blue')
                ],
              ),
              Column(
                children: [
                  getText(
                      title: 'Bet Amount',
                      size: 10,
                      fontFamily: LatoRegular,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w600),
                  ScreenSize.height(9),
                  Container(
                    height: 25,
                    alignment: Alignment.center,
                    child: getText(
                        title: '₹10',
                        size: 10,
                        fontFamily: LatoBlack,
                        color: ColorConstant.blackColor,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Column(
                children: [
                  getText(
                      title: 'Result',
                      size: 10,
                      fontFamily: LatoRegular,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w600),
                  ScreenSize.height(9),
                  btn(ColorConstant.lightBlueColor, 'Blue')
                ],
              ),
              Column(
                children: [
                  getText(
                      title: 'Settlement',
                      size: 10,
                      fontFamily: LatoRegular,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w600),
                  ScreenSize.height(9),
                  Container(
                    height: 25,
                    alignment: Alignment.center,
                    child: getText(
                        title: '+ ₹10',
                        size: 10,
                        fontFamily: LatoBlack,
                        color: ColorConstant.greenColor,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  header() {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Row(
        children: [
          Image.asset(
            AppImages.keyboardArrowRightIcon,
            width: 18,
            height: 18,
          ),
          ScreenSize.width(9),
          getText(
              title: 'My Bets',
              size: 12,
              fontFamily: LatoRegular,
              color: ColorConstant.blackColor,
              fontWeight: FontWeight.w700)
        ],
      ),
    );
  }

  btn(Color color, String title) {
    return Container(
      height: 25,
      width: 79,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: getText(
          title: title,
          size: 11,
          fontFamily: LatoRegular,
          color: ColorConstant.white,
          fontWeight: FontWeight.w700),
    );
  }
}
