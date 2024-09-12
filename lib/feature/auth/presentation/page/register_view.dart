import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_store_app/feature/auth/presentation/page/login_view.dart';
import 'package:bookia_store_app/feature/auth/presentation/widgets/bottom_info.dart';
import 'package:bookia_store_app/feature/auth/presentation/widgets/social_btn_card.dart';
import 'package:bookia_store_app/core/widgets/text_form_field_widget.dart';
import 'package:bookia_store_app/feature/auth/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isObscure = false;
  bool isObscureConfirm = false;
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
              'Hello! Register to get started',
              style: getHeadLineTextStyle(context),
            ),
            const Gap(32),
            const TextFormFieldWidget(
              hintText: 'Username',
            ),
            const Gap(15),
            const TextFormFieldWidget(
              hintText: 'Email',
            ),
            const Gap(15),
            TextFormFieldWidget(
              obscureText: isObscure,
              hintText: 'Password',
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
            const Gap(15),
            TextFormFieldWidget(
              obscureText: isObscure,
              hintText: 'Confirm Password',
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isObscureConfirm = !isObscureConfirm;
                      });
                    },
                    child: SvgPicture.asset(AssetsIcons.eyeSvg),
                  ),
                ],
              ),
            ),
            const Gap(30),
            CustomButton(
              text: 'Register',
              onPressed: () {
                pushAndRemoveUntil(context, const NavBarWidget());
              },
            ),
            const Gap(30),
            const DividerView(
              text: 'Or Register with',
            ),
            const Gap(20),
            const SocialButtonsCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomInfo(
        text: 'Already have an account? ',
        textButton: 'Login Now',
        onpressed: () => pushReplacement(context, const LoginView()),
      ),
    );
  }
}
