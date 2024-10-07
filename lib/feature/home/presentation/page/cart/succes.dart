import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/core/widgets/nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({super.key});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(22),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/done.svg',
                width: 145,
                height: 145,
              ),
              const Gap(35),
              Text(
                'SUCCESS!',
                style: getTitleTextStyle(context,
                    fontFamily: 'Merriweather', fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Text(
                'Your order will be delivered soon.Thank you for choosing our app!',
                textAlign: TextAlign.center,
                style: getBodyTextStyle(
                  context,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
              ),
              const Gap(40),
              CustomButton(
                text: 'Back To Home',
                onPressed: () {
                  pushAndRemoveUntil(context, const NavBarWidget());
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
