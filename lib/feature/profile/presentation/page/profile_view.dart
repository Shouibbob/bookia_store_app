import 'dart:developer';

import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/services/local_storage.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/feature/intro/welcom_view.dart';
import 'package:bookia_store_app/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:bookia_store_app/feature/profile/presentation/bloc/profile_event.dart';
import 'package:bookia_store_app/feature/profile/presentation/bloc/profile_state.dart';
import 'package:bookia_store_app/feature/profile/presentation/page/edit_profile_view.dart';
import 'package:bookia_store_app/feature/profile/presentation/page/order_view.dart';
import 'package:bookia_store_app/feature/profile/presentation/page/update_password_view.dart';
import 'package:bookia_store_app/feature/profile/presentation/widgets/profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ShowProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileLoadedState) {
            var data = context.read<ProfileBloc>().profileResponseModel?.data;
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 70,
                title: Text(
                  'Profile',
                  style: getTitleTextStyle(context),
                ),
                actions: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            log('hamada');
                            // AppLocalStorage.removeData(
                            //     key: AppLocalStorage.token);
                            // pushAndRemoveUntil(context, const WelcomeView());

                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                    'Are you sure you want to log out?',
                                    style: getBodyTextStyle(
                                      context,
                                      fontFamily: 'NunitoSans',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text(
                                        'No',
                                        style: getBodyTextStyle(
                                          context,
                                          fontFamily: 'NunitoSans',
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        'Yes',
                                        style: getBodyTextStyle(
                                          context,
                                          fontFamily: 'NunitoSans',
                                        ),
                                      ),
                                      onPressed: () {
                                        AppLocalStorage.removeData(
                                            key: AppLocalStorage.token);
                                        pushAndRemoveUntil(
                                            context, const WelcomeView());
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(AssetsIcons.logoutSvg)),
                      const Gap(17.5),
                    ],
                  )
                ],
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 24, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(data?.image ?? ''),
                          ),
                          const Gap(13),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data?.name ?? '',
                                style: getTitleTextStyle(context,
                                    fontFamily: 'NunitoSans',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24),
                              ),
                              Text(
                                data?.email ?? '',
                                style: getSmallTextStyle(context,
                                    fontFamily: 'NunitoSans',
                                    fontSize: 17,
                                    color: AppColors.greyColor),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Gap(35),
                      GestureDetector(
                        onTap: () {
                          push(context, const OrderView());
                        },
                        child: const ProfileItemWidget(
                          text: 'My Orders',
                        ),
                      ),
                      const Gap(10),
                      GestureDetector(
                        onTap: () {
                          push(context, const EditProfileView());
                        },
                        child: const ProfileItemWidget(
                          text: 'Edit Profile',
                        ),
                      ),
                      const Gap(10),
                      GestureDetector(
                        onTap: () {
                          push(context, const UpdatePasswordView());
                        },
                        child: const ProfileItemWidget(
                          text: 'Reset Password',
                        ),
                      ),
                      const Gap(10),
                      const ProfileItemWidget(
                        text: 'FAQ',
                      ),
                      const Gap(10),
                      const ProfileItemWidget(
                        text: 'Contact Us',
                      ),
                      const Gap(10),
                      const ProfileItemWidget(
                        text: 'Privacy & Terms',
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {}
          return const Center(child: CircularProgressIndicator());
        });
  }
}
