import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/core/widgets/text_form_field_widget.dart';
import 'package:bookia_store_app/feature/auth/view/login_view.dart';
import 'package:bookia_store_app/feature/auth/view/otp_verification.dart';
import 'package:bookia_store_app/feature/auth/widgets/bottom_info.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForfotPasswordView extends StatefulWidget {
  const ForfotPasswordView({super.key});

  @override
  State<ForfotPasswordView> createState() => _ForfotPasswordViewState();
}

class _ForfotPasswordViewState extends State<ForfotPasswordView> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () => pushReplacement(context, const LoginView()),
              child: Container(
                width: 41,
                height: 41,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.background,
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password?',
              style: getTitleTextStyle(),
            ),
            const Gap(10),
            Text(
              'Don\'t worry! It occurs. Please enter the email\naddress linked with your account',
              style: getBodyTextStyle(),
            ),
            const Gap(32),
            const TextFormFieldWidget(
              hintText: 'Enter your email',
            ),
            const Gap(30),
            CustomButton(
              text: 'Send Code',
              onPressed: () {
                pushReplacement(context, const OtpVerificationView());
              },
              width: double.infinity,
            ),
            const Gap(54),
          ],
        ),
      ),
      bottomNavigationBar: BottomInfo(
        text: 'Remember password?',
        textButton: 'Login',
        onpressed: () {
          pushReplacement(context, const LoginView());
        },
      ),
    );
  }
}
