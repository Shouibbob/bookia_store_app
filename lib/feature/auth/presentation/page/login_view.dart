import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/function/dialogs.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/back_card_widget.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_store_app/feature/auth/data/models/request/login_params.dart';
import 'package:bookia_store_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_store_app/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bookia_store_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_store_app/feature/auth/presentation/page/register_view.dart';
import 'package:bookia_store_app/feature/auth/presentation/widgets/bottom_info.dart';
import 'package:bookia_store_app/feature/auth/presentation/widgets/social_btn_card.dart';
import 'package:bookia_store_app/core/widgets/text_form_field_widget.dart';
import 'package:bookia_store_app/feature/auth/presentation/page/forgot_password.dart';
import 'package:bookia_store_app/feature/auth/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscure = true;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pop(context);

          pushAndRemoveUntil(context, const NavBarWidget());
        } else if (state is LoginErrorState) {
          Navigator.pop(context);

          showErrorDialog(context, state.error);
        } else if (state is LoginLoadingState) {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Row(
            children: [BackCardWidget()],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(22),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back! Glad to see you, Again!',
                  style: getHeadLineTextStyle(context),
                ),
                const Gap(32),
                TextFormFieldWidget(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                ),
                const Gap(15),
                TextFormFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  controller: passwordController,
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
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(LoginEvent(LoginParams(
                              email: emailController.text,
                              password: passwordController.text,
                            )));
                      }
                    }),
                const Gap(30),
                const DividerView(
                  text: 'Or Login with',
                ),
                const Gap(20),
                const SocialButtonsCard(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomInfo(
          text: 'Don’t have an account?',
          textButton: 'Sign Up',
          onpressed: () {
            pushReplacement(context, const RegisterView());
          },
        ),
      ),
    );
  }
}
