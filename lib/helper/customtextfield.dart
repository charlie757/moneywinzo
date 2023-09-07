import 'package:color_demo/helper/appcolor.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  String? hintText;
  final TextEditingController controller;
  Widget? prefix;
  final validator;
  List<TextInputFormatter>? inputFormatters;
  bool? isObscureText;
  final TextInputType textInputType;
  final isReadOnly;
  CustomTextfield(
      {key,
      required this.hintText,
      this.validator,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.inputFormatters,
      this.prefix,
      this.isObscureText = false,
      this.isReadOnly = false});
  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        readOnly: widget.isReadOnly,
        obscureText: widget.isObscureText!,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        cursorColor: Colors.black,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        decoration: InputDecoration(
          isDense: true,
          fillColor: AppColor.whiteColor,
          filled: true,
          hintText: widget.hintText,
          prefixIcon: widget.prefix,
          hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: LatoRegular,
              color: ColorConstant.hintColor),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.whiteColor,
              ),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.naviBlueColor,
              ),
              borderRadius: BorderRadius.circular(8)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.redColor)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.redColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.naviBlueColor,
              ),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
