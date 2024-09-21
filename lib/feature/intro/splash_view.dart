import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/services/local_storage.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/nav_bar_widget.dart';
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
    String token = AppLocalStorage.getData(key: AppLocalStorage.token) ?? '';
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      if (token.isNotEmpty) {
        pushReplacement(context, const NavBarWidget());
      } else {
        pushReplacement(context, const WelcomeView());
      }
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
