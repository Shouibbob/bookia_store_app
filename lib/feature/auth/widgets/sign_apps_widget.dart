import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignApps extends StatelessWidget {
  const SignApps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 105,
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: AppColors.borderColor,
              )),
          child: Center(
            child: SvgPicture.asset(AssetsIcons.facebookSvg),
          ),
        ),
        Container(
          width: 105,
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: AppColors.borderColor,
              )),
          child: Center(
            child: SvgPicture.asset(AssetsIcons.googleSvg),
          ),
        ),
        Container(
          width: 105,
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: AppColors.borderColor,
              )),
          child: Center(
            child: SvgPicture.asset(AssetsIcons.appleSvg),
          ),
        )
      ],
    );
  }
}