import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:bookia_store_app/feature/cart/page/checkout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int item = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: getTitleTextStyle(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/book.png',
                            width: 100,
                            height: 118,
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'The Republic',
                                          style: getBodyTextStyle(
                                              color: AppColors.greyColor,
                                              context),
                                        ),
                                      ],
                                    ),
                                    const Gap(83),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.cancel_outlined,
                                          size: 24,
                                        )),
                                  ],
                                ),
                                Text(
                                  '₹285',
                                  style: getSmallTextStyle(context),
                                ),
                                const Gap(18),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        style: IconButton.styleFrom(
                                          backgroundColor:
                                              AppColors.accentColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            item++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          size: 20,
                                        )),
                                    const Gap(10),
                                    Text(
                                      item.toString(),
                                      style: getBodyTextStyle(context,
                                          fontFamily: 'NunitoSans',
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Gap(10),
                                    IconButton(
                                        style: IconButton.styleFrom(
                                          backgroundColor:
                                              AppColors.accentColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (item > 0) {
                                            setState(() {
                                              item--;
                                            });
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 20,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    const Divider(
                      color: AppColors.secondryColor,
                    ),
                  ],
                );
              },
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
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
                      const Spacer(),
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
                      push(context, const CheckoutView());
                    },
                    text: 'Checkout',
                    textStyle: getBodyTextStyle(
                      context,
                      fontSize: 20,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
