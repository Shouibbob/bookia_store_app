import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: AppColors.whiteColor,
        boxShadow: [BoxShadow(color: AppColors.greyColor, blurRadius: 5)],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 15, 13),
        child: Row(
          children: [
            Text(
              text,
              style: getBodyTextStyle(context, fontWeight: FontWeight.w900),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
