import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle getTitleTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
      fontFamily: 'DMSerifDisplay',
      color: color ?? AppColors.blackColor,
      fontSize: fontSize ?? 30,
      fontWeight: fontWeight ?? FontWeight.w400);
}

TextStyle getBodyTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
      fontFamily: 'DMSerifDisplay',
      color: color ?? AppColors.hintColor,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w400);
}

TextStyle getSmallTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
      fontFamily: 'DMSerifDisplay',
      color: color ?? AppColors.blackColor,
      fontSize: fontSize ?? 15,
      fontWeight: fontWeight ?? FontWeight.w400);
}
