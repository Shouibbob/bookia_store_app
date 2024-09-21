import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/function/dialogs.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/back_card_widget.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_store_app/core/widgets/text_form_field_widget.dart';
import 'package:bookia_store_app/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:bookia_store_app/feature/profile/presentation/bloc/profile_event.dart';
import 'package:bookia_store_app/feature/profile/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class UpdatePasswordView extends StatefulWidget {
  const UpdatePasswordView({super.key});

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var newConfirmPasswordController2 = TextEditingController();
  bool isObscure = true;
  bool isObscure2 = true;
  bool isObscure3 = true;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            BackCardWidget(),
          ],
        ),
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            Navigator.pop(context);
            pushAndRemoveUntil(context, const NavBarWidget());
          } else if (state is ProfileErrorState) {
            Navigator.pop(context);
            showErrorDialog(context, 'Something went wrong');
          } else if (state is ChangePasswordLoadingState) {
            showLoadingDialog(context);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(22),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New Password',
                        style: getHeadLineTextStyle(context),
                      ),
                    ],
                  ),
                  const Gap(32),
                  TextFormFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    controller: currentPasswordController,
                    obscureText: isObscure,
                    hintText: 'Current Password',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    controller: newPasswordController,
                    obscureText: isObscure2,
                    hintText: 'New Password',
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isObscure2 = !isObscure2;
                            });
                          },
                          child: SvgPicture.asset(AssetsIcons.eyeSvg),
                        ),
                      ],
                    ),
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
                    controller: newConfirmPasswordController2,
                    obscureText: isObscure3,
                    hintText: 'Confirm password',
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isObscure3 = !isObscure3;
                            });
                          },
                          child: SvgPicture.asset(AssetsIcons.eyeSvg),
                        ),
                      ],
                    ),
                  ),
                  const Gap(30),
                  CustomButton(
                      text: 'Update Password',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<ProfileBloc>().add(ChangePasswordEvent(
                              currentPassword: currentPasswordController.text,
                              newPassword: newPasswordController.text,
                              newConfirmPassword:
                                  newConfirmPasswordController2.text));
                          showSuccessDialog(context);
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
