import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_store_app/feature/auth/presentation/page/register_view.dart';
import 'package:bookia_store_app/feature/auth/presentation/widgets/bottom_info.dart';
import 'package:bookia_store_app/feature/auth/presentation/widgets/social_btn_card.dart';
import 'package:bookia_store_app/core/widgets/text_form_field_widget.dart';
import 'package:bookia_store_app/feature/auth/presentation/page/forgot_password.dart';
import 'package:bookia_store_app/feature/auth/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 41,
                height: 41,
                //margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor,
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
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back! Glad to see you, Again!',
              style: getHeadLineTextStyle(context),
            ),
            const Gap(32),
            const TextFormFieldWidget(),
            const Gap(15),
            TextFormFieldWidget(
              obscureText: isObscure,
              hintText: 'Enter your password',
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: SvgPicture.asset(AssetsIcons.eyeSvg),
                  ),
                ],
              ),
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    pushReplacement(context, const ForgotPasswordView());
                  },
                  child: Text(
                    'Forgot Password?',
                    style: getSmallTextStyle(context),
                  ),
                ),
              ],
            ),
            const Gap(30),
            CustomButton(
              text: 'Login',
              onPressed: () {
                pushAndRemoveUntil(context, const NavBarWidget());
              },
            ),
            const Gap(30),
            const DividerView(
              text: 'Or Login with',
            ),
            const Gap(20),
            const SocialButtonsCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomInfo(
        text: 'Don’t have an account?',
        textButton: 'Sign Up',
        onpressed: () {
          push(context, const RegisterView());
        },
      ),
    );
  }
}
