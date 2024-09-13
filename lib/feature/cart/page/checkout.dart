import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/core/widgets/text_form_field_widget.dart';
import 'package:bookia_store_app/feature/cart/page/succes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
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
      body: Container(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TextFormFieldWidget(
                hintText: 'Full Name',
              ),
              const Gap(12),
              const TextFormFieldWidget(
                hintText: 'Email',
              ),
              const Gap(12),
              const TextFormFieldWidget(
                hintText: 'Address',
              ),
              const Gap(12),
              const TextFormFieldWidget(
                hintText: 'Phone',
                keyboardType: TextInputType.phone,
              ),
              const Gap(12),
              const TextFormFieldWidget(
                isNOte: true,
                height: 150,
                hintText: 'Note',
              ),
              // TextField(
              //   keyboardType: TextInputType.multiline,
              //   maxLines: null,
              //   decoration: const InputDecoration(

              //     hintText: 'Note',
              //     border: InputBorder.none,
              //   ),
              //   style: getBodyTextStyle(
              //     context,
              //     fontSize: 20,
              //     color: AppColors.textColor,
              //   ),
              // ),
              const Gap(152.89),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: getBodyTextStyle(
                          context,
                          fontSize: 20,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w700,
                          color: AppColors.greyColor,
                        ),
                      ),
                      Text(
                        '\$ 95.00',
                        style: getBodyTextStyle(
                          context,
                          fontSize: 20,
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  const Gap(19),
                  CustomButton(
                    onPressed: () {
                      pushReplacement(context, const SuccessView());
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
  }
}
