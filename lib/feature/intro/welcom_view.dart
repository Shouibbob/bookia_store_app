import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/feature/auth/presentation/page/login_view.dart';
import 'package:bookia_store_app/feature/auth/presentation/page/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsIcons.welcomeBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  SvgPicture.asset(
                    AssetsIcons.logoSvg,
                  ),
                  const Gap(12),
                  Text(
                    'Order Your Book Now!',
                    style: getBodyTextStyle(context),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      push(context, const LoginView());
                    },
                  ),
                  const Gap(15),
                  CustomButton(
                    text: 'Register',
                    onPressed: () {
                      push(context, const RegisterView());
                    },
                    color: AppColors.whiteColor,
                    isOutline: true,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
