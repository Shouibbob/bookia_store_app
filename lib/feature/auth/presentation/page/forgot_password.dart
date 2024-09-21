import 'package:bookia_store_app/core/function/dialogs.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/core/widgets/text_form_field_widget.dart';
import 'package:bookia_store_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_store_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_store_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_store_app/feature/auth/presentation/page/login_view.dart';
import 'package:bookia_store_app/feature/auth/presentation/page/otp_verification.dart';
import 'package:bookia_store_app/feature/auth/presentation/widgets/bottom_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  bool isObscure = true;
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SendForgetPasswordSuccessState) {
          Navigator.pop(context);
          pushReplacement(context, const OtpVerificationView());
        } else if (state is SendForgetPasswordErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, state.error);
        } else {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => pushReplacement(context, const LoginView()),
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
          padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password?',
                  style: getHeadLineTextStyle(context),
                ),
                const Gap(10),
                Text(
                  'Don\'t worry! It occurs. Please enter the email address linked with your account',
                  style: getSmallTextStyle(
                    context,
                    color: AppColors.greyColor,
                  ),
                ),
                const Gap(32),
                TextFormFieldWidget(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your Email';
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter your email',
                ),
                const Gap(30),
                CustomButton(
                  text: 'Send Code',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            SendForgetPasswordEvent(
                              email: emailController.text,
                            ),
                          );
                    }
                  },
                  width: double.infinity,
                ),
                const Gap(54),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomInfo(
          text: 'Remember password?',
          textButton: 'Login',
          onpressed: () {
            pushReplacement(context, const LoginView());
          },
        ),
      ),
    );
  }
}
