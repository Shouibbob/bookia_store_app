import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/core/widgets/text_form_field_widget.dart';
import 'package:bookia_store_app/feature/auth/view/otp_verification.dart';
import 'package:bookia_store_app/feature/auth/view/password_changed.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () =>
                  pushReplacement(context, const OtpVerificationView()),
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
              'Create new password',
              style: getTitleTextStyle(),
            ),
            const Gap(10),
            Text(
              'Your new password must be unique from those previously used.',
              style: getBodyTextStyle(),
            ),
            const Gap(32),
            const TextFormFieldWidget(
              hintText: 'New Password',
            ),
            const Gap(15),
            const TextFormFieldWidget(
              hintText: 'Confirm Password',
            ),
            const Gap(30),
            CustomButton(
              text: 'Reset Password',
              onPressed: () {
                pushReplacement(context, const PasswordChangedView());
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
