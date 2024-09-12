import 'package:flutter/material.dart';

TextStyle getHeadLineTextStyle(BuildContext context,
    {double fontSize = 30,
    Color? color,
    fontWeight = FontWeight.normal,
    String? fontFamily}) {
  return TextStyle(
    fontFamily: fontFamily ?? 'DMSerifDisplay',
    color: color ?? Theme.of(context).colorScheme.onSurface,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle getTitleTextStyle(BuildContext context,
    {double fontSize = 24,
    Color? color,
    fontWeight = FontWeight.normal,
    String? fontFamily}) {
  return TextStyle(
    fontFamily: fontFamily ?? 'DMSerifDisplay',
    color: color ?? Theme.of(context).colorScheme.onSurface,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle getBodyTextStyle(BuildContext context,
    {double fontSize = 18,
    Color? color,
    fontWeight = FontWeight.normal,
    String? fontFamily}) {
  return TextStyle(
    fontFamily: fontFamily ?? 'DMSerifDisplay',
    color: color ?? Theme.of(context).colorScheme.onSurface,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle getSmallTextStyle(BuildContext context,
    {double fontSize = 16,
    Color? color,
    fontWeight = FontWeight.normal,
    String? fontFamily}) {
  return TextStyle(
    fontFamily: fontFamily ?? 'DMSerifDisplay',
    color: color ?? Theme.of(context).colorScheme.onSurface,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}
