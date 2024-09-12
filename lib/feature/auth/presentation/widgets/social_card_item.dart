
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialCardItem extends StatelessWidget {
  const SocialCardItem({
    super.key,
    required this.logo,
  });
  final String logo;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.whiteColor,
            border: Border.all(
              color: AppColors.borderColor,
            )),
        child: Center(
          child: SvgPicture.asset(logo),
        ),
      ),
    );
  }
}
