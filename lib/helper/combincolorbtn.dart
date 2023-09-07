import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:flutter/material.dart';

class CombineColorBtn extends StatefulWidget {
  final String title;
  final double height;
  final double width;
  final Color color;
  final Function() onTap;
  const CombineColorBtn({
    key,
    required this.title,
    required this.height,
    required this.width,
    required this.onTap,
    required this.color,
  });

  @override
  State<CombineColorBtn> createState() => _CombineColorBtnState();
}

class _CombineColorBtnState extends State<CombineColorBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          // elevation: 0,
          backgroundColor: widget.color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getText(
                title: widget.title,
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
