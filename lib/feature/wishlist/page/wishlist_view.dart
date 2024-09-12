import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Favorites Books',
          style: getTitleTextStyle(context),
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
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
                                          color: AppColors.greyColor, context),
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
                            const Gap(26),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  onPressed: () {},
                                  text: 'Add To Cart',
                                  textStyle: getSmallTextStyle(
                                      color: AppColors.whiteColor,
                                      context,
                                      fontSize: 14),
                                  width: 181.78,
                                  height: 40,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                const Divider(
                  color: AppColors.secondryColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
