import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/feature/auth/presentation/page/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PasswordChangedView extends StatefulWidget {
  const PasswordChangedView({super.key});

  @override
  State<PasswordChangedView> createState() => _PasswordChangedViewState();
}

class _PasswordChangedViewState extends State<PasswordChangedView> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(22),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/done.svg',
                width: 100,
                height: 100,
              ),
              const Gap(35),
              Text(
                'Password Changed!',
                style: getTitleTextStyle(context),
              ),
              const Gap(10),
              Text(
                'Your password has been changed\nsuccessfully.',
                textAlign: TextAlign.center,
                style: getBodyTextStyle(context),
              ),
              const Gap(40),
              CustomButton(
                text: 'Back to Login',
                onPressed: () {
                  pushReplacement(context, const LoginView());
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
