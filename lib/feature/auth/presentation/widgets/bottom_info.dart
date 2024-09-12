import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class BottomInfo extends StatelessWidget {
  const BottomInfo({
    super.key,
    required this.text,
    required this.textButton,
    required this.onpressed,
  });

  final String text;
  final String textButton;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: getSmallTextStyle(context),
          ),
          TextButton(
            onPressed: onpressed,
            child: Text(
              textButton,
              style: getSmallTextStyle(context, color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
