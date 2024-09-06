import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/feature/Welcom/welcom_view.dart';
import 'package:bookia_store_app/feature/auth/view/register_view.dart';
import 'package:bookia_store_app/feature/auth/widgets/bottom_info.dart';
import 'package:bookia_store_app/feature/auth/widgets/sign_apps_widget.dart';
import 'package:bookia_store_app/core/widgets/text_form_field_widget.dart';
import 'package:bookia_store_app/feature/auth/view/forgot_password.dart';
import 'package:bookia_store_app/feature/auth/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () => pushReplacement(context, const WelcomeView()),
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
              'Welcome back!Glad\nto see you, Again!',
              style: getTitleTextStyle(),
            ),
            const Gap(32),
            const TextFormFieldWidget(),
            const Gap(15),
            TextFormFieldWidget(
              hintText: 'Enter your password',
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
                  )),
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    pushReplacement(context, const ForfotPasswordView());
                  },
                  child: Text(
                    'Forgot Password?',
                    style: getBodyTextStyle(),
                  ),
                ),
              ],
            ),
            const Gap(30),
            CustomButton(
              text: 'Login',
              onPressed: () {},
              width: double.infinity,
            ),
            const Gap(34),
            const DividerView(),
            const Gap(21),
            const SignApps(),
          ],
        ),
      ),
      bottomNavigationBar: BottomInfo(
        text: 'Don’t have an account?',
        textButton: 'Register Now',
        onpressed: () {
          pushReplacement(context, const RegisterView());
        },
      ),
    );
  }
}
