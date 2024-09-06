import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/feature/auth/view/login_view.dart';
import 'package:bookia_store_app/feature/auth/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});
  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/book.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 57,
                        width: 57,
                      ),
                      const Text(
                        'Bookia',
                        style: TextStyle(
                          fontFamily: 'DMSerifDisplay',
                          color: AppColors.blackColor,
                          fontSize: 55,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),
                  const Text(
                    'Order Your Book Now!',
                    style: TextStyle(
                      fontFamily: 'DMSerifDisplay',
                      color: AppColors.blackColor,
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            child: Center(
              child: Column(
                children: [
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      pushReplacement(context, const LoginView());
                    },
                  ),
                  const Gap(15),
                  CustomButton(
                    text: 'Register',
                    onPressed: () {
                      pushReplacement(context, const RegisterView());
                    },
                    color: AppColors.background,
                    textColor: AppColors.blackColor,
                    isChanged: true,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
