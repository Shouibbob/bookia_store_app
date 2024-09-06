import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/feature/auth/view/forgot_password.dart';
import 'package:bookia_store_app/feature/auth/view/login_view.dart';
import 'package:bookia_store_app/feature/auth/view/reset_password.dart';
import 'package:bookia_store_app/feature/auth/widgets/bottom_info.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () => pushReplacement(context, const ForfotPasswordView()),
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
              'OTP Verification',
              style: getTitleTextStyle(),
            ),
            const Gap(10),
            Text(
              'Enter the verification code we just sent on\nyour email address.',
              style: getBodyTextStyle(),
            ),
            const Gap(32),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      controller: TextEditingController(),
                      focusNode: FocusNode(),
                      defaultPinTheme: PinTheme(
                        width: 70,
                        height: 60,
                        textStyle: const TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(30, 60, 87, 1),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                      ),
                      separatorBuilder: (index) => const Gap(8),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                      focusedPinTheme: PinTheme(
                        width: 70,
                        height: 60,
                        textStyle: const TextStyle(
                          fontSize: 22,
                          color: const Color.fromRGBO(30, 60, 87, 1),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.primary),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        width: 70,
                        height: 60,
                        textStyle: const TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(30, 60, 87, 1),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.primary),
                        ),
                      ),
                      errorPinTheme: PinTheme(
                        width: 70,
                        height: 60,
                        textStyle: const TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(30, 60, 87, 1),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.redColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(30),
            CustomButton(
              text: 'Verify',
              onPressed: () {
                pushReplacement(context, const ResetPasswordView());
              },
              width: double.infinity,
            ),
            const Gap(54),
          ],
        ),
      ),
      bottomNavigationBar: BottomInfo(
        text: 'Didn’t received code?',
        textButton: 'Resend',
        onpressed: () {
          pushReplacement(context, const LoginView());
        },
      ),
    );
  }
}
