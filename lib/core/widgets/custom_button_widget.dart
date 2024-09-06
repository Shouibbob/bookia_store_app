import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.borderRadius,
      this.height,
      this.width,
      this.color = AppColors.primary,
      this.textColor = AppColors.background,
      this.isChanged = false,
      required this.text,
      required this.onPressed});

  final double? height;
  final double? width;
  final String text;
  final Color color;
  final Color textColor;
  final double? borderRadius;
  final Function() onPressed;
  final bool isChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 331,
        height: height ?? 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              side: isChanged
                  ? BorderSide(color: AppColors.blackColor)
                  : BorderSide(color: AppColors.primary),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'DMSerifDisplay',
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ));
  }
}
