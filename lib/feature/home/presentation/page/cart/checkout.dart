import 'dart:developer';

import 'package:bookia_store_app/core/function/dialogs.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/core/widgets/text_form_field_widget.dart';
import 'package:bookia_store_app/feature/home/presentation/page/cart/succes.dart';
import 'package:bookia_store_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var governorateController = TextEditingController();
  String? values;
  List listItem = ["item1", "item2", "item3"];
  var data = [];
  int _value = 1;
  @override
  // void initState() {
  //   super.initState();
  //   context.read<HomeBloc>().add(GovernoratesEvent());
  //   //data = context.read<HomeBloc>().governoratesResponseModel?.data ?? [];
  //   log('data ${context.read<HomeBloc>().governoratesResponseModel?.data}');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(
            right: 41,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 41,
                  height: 41,
                  padding: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.whiteColor,
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                'Checkout',
                style: getTitleTextStyle(context),
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state is SubmitOrderLoadedState ||
            state is GovernoratesLoadedState) {
          //Navigator.pop(context);
        } else if (state is HomeErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, "Something went wrong");
          pushAndRemoveUntil(context, const SuccessView());
        } else if (state is SubmitOrderLoadingState ||
            state is GovernoratesLoadingState) {
          showLoadingDialog(context);
        }
      }, builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormFieldWidget(
                    controller: fullNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    hintText: 'Full Name',
                  ),
                  const Gap(12),
                  TextFormFieldWidget(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    hintText: 'Email',
                  ),
                  const Gap(12),
                  TextFormFieldWidget(
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone';
                      }
                      return null;
                    },
                    hintText: 'Phone',
                  ),
                  const Gap(12),
                  Container(
                    padding: const EdgeInsets.only(left: 11, right: 11),
                    decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      border:
                          Border.all(color: AppColors.borderColor, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(8),
                      style: getSmallTextStyle(context),
                      dropdownColor: AppColors.borderColor,
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.greyColor,
                      ),
                      iconSize: 24,
                      hint: const Text(
                        "Select Item",
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                      value: _value,
                      onChanged: (newValue) {
                        _value = newValue as int;
                        setState(() {});
                      },
                      items: data.map((e) {
                        return DropdownMenuItem(
                          value: e["id"],
                          child: Text(e["governorate_name_en"]),
                        );
                      }).toList()
                      // listItem.map((valueItem) {
                      //   return DropdownMenuItem(
                      //     value: valueItem,
                      //     child: Text(valueItem),
                      //   );
                      // }).toList()
                      ,
                    ),
                  ),
                  const Gap(12),
                  TextFormFieldWidget(
                    controller: addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    isNOte: true,
                    height: 150,
                    hintText: 'address',
                  ),
                  const Gap(152.89),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Gap(19),
                      CustomButton(
                        onPressed: () {
                          // pushReplacement(context, const SuccessView());
                          if (formKey.currentState!.validate()) {
                            context.read<HomeBloc>().add(SubmitOrderEvent(
                                  name: fullNameController.text,
                                  governorateId: governorateController.text,
                                  phone: phoneController.text,
                                  address: addressController.text,
                                  email: emailController.text,
                                ));
                          }
                        },
                        text: 'Submit Order',
                        textStyle: getBodyTextStyle(
                          context,
                          fontSize: 20,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
