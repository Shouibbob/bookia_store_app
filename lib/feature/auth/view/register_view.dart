import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/feature/auth/widgets/bottom_info.dart';
import 'package:bookia_store_app/feature/auth/widgets/sign_apps_widget.dart';
import 'package:bookia_store_app/core/widgets/text_form_field_widget.dart';
import 'package:bookia_store_app/feature/auth/view/login_view.dart';
import 'package:bookia_store_app/feature/auth/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isObscure = true;
  bool isObscureConfirm = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              'Hello! Register to get\nstarted',
              style: getTitleTextStyle(),
            ),
            const Gap(32),
            const TextFormFieldWidget(
              hintText: 'User Name',
            ),
            const Gap(15),
            const TextFormFieldWidget(
              hintText: 'Email',
            ),
            const Gap(15),
            TextFormFieldWidget(
              hintText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                ),
              ),
            ),
            const Gap(15),
            TextFormFieldWidget(
              hintText: 'Confirm Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscureConfirm = !isObscureConfirm;
                  });
                },
                icon: Icon(
                  isObscureConfirm
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                ),
              ),
            ),
            const Gap(30),
            CustomButton(
              text: 'Register',
              onPressed: () {},
              width: double.infinity,
            ),
            const Gap(34),
            const DividerView(
              text: 'Or Register with',
            ),
            const Gap(21),
            const SignApps(),
          ],
        ),
      ),
      bottomNavigationBar: BottomInfo(
        text: 'Already have an account?',
        textButton: 'Login Now',
        onpressed: () {
          pushReplacement(context, const LoginView());
        },
      ),
    );
  }
}
