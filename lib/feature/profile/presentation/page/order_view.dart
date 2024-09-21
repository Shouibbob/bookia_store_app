import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 21,
            right: 19,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(34),
              Container(
                padding: const EdgeInsets.only(left: 21, right: 15),
                width: double.infinity,
                height: 65,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: AppColors.borderColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Text('Order No238562312',
                            style: getBodyTextStyle(context,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w600))),
                    Text('20/3/2020',
                        style: getBodyTextStyle(context,
                            fontFamily: 'NunitoSans',
                            fontSize: 17,
                            color: AppColors.greyColor)),
                  ],
                ),
              ),
              const Gap(2),
              Container(
                padding: const EdgeInsets.only(top: 15, right: 13),
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: AppColors.borderColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Total Amount:',
                            style: getBodyTextStyle(context,
                                fontFamily: 'NunitoSans',
                                fontSize: 17,
                                color: AppColors.greyColor)),
                        Text(' \$150',
                            style: getBodyTextStyle(context,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w600))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
