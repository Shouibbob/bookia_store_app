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

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  bool isObscure = true;
  bool isObscureConfirm = true;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var conformationPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      // listenWhen: (previous, current) =>
      //     current is UpdateProfileSuccessState ||
      //     current is UpdateProfileLoadingState,
      listener: (context, state) {
        if (state is UpdateProfileSuccessState) {
          Navigator.pop(context);
          pushAndRemoveUntil(context, const NavBarWidget());
        } else if (state is ProfileErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, 'Something went wrong');
        } else if (state is UpdateProfileLoadingState) {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Row(
            children: [
              BackCardWidget(),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(22),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Update Profile',
                  style: getHeadLineTextStyle(context),
                ),
                const Gap(36),
                TextFormFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: nameController,
                  hintText: 'Username',
                ),
                const Gap(15),
                TextFormFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  controller: emailController,
                  hintText: 'Email',
                ),
                const Gap(15),
                TextFormFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: isObscure,
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
                      return 'Please enter your confirm Password';
                    }
                    return null;
                  },
                  controller: conformationPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: isObscureConfirm,
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
                  text: 'Update Profile',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<ProfileBloc>().add(UpdateProfileEvent(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword:
                              conformationPasswordController.text));
                      showSuccessSnackDialog(context, 'successful');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
