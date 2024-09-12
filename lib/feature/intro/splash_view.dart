import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/feature/intro/welcom_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      pushReplacement(context, const WelcomeView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsIcons.logoSvg),
            const Gap(15),
            Text(
              'Order Your Book Now!',
              style: getBodyTextStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
