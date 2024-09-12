import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/core/widgets/custom_button_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedBanner = 0;
  int currentPageIndex = 0;
  List<int> pages = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SvgPicture.asset(AssetsIcons.logoSvg, height: 30),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsIcons.notificationSvg),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsIcons.searchSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CarouselSlider.builder(
              carouselController: CarouselSliderController(),
              itemCount: 4,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/banner.png',
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              options: CarouselOptions(
                height: 150,
                viewportFraction: 1,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                onPageChanged: (value, reason) {
                  setState(() {
                    selectedBanner = value;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            const Gap(16),
            SmoothPageIndicator(
                controller: PageController(
                  initialPage: selectedBanner,
                ), // PageController
                count: 4,
                effect: const ExpandingDotsEffect(
                  dotHeight: 7,
                  radius: 7,
                  expansionFactor: 7,
                  dotWidth: 7,
                  dotColor: AppColors.borderColor,
                  activeDotColor: AppColors.primaryColor,
                ), // your preferred effect
                onDotClicked: (index) {}),
            const Gap(31),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Popular Books',
                  style: getHeadLineTextStyle(context),
                ),
              ],
            ),
            const Gap(15),
            Expanded(
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 11.96, horizontal: 10.98),
                            height: 281,
                            width: 163,
                            decoration: BoxDecoration(
                              color: AppColors.secondryColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/book_image.png',
                                      width: 140,
                                      height: 175,
                                    ),
                                  ),
                                  const Gap(5.67),
                                  Text(
                                    'The Republic',
                                    style: getBodyTextStyle(context),
                                  ),
                                  const Gap(15.67),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '₹285',
                                          style: getSmallTextStyle(context),
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                          onPressed: () {},
                                          color: AppColors.textColor,
                                          text: 'Buy',
                                          textStyle: getSmallTextStyle(
                                              fontSize: 14,
                                              context,
                                              color: AppColors.whiteColor),
                                          width: 71.78,
                                          height: 27.9,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(11),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 11.96, horizontal: 10.98),
                            height: 281,
                            width: 163,
                            decoration: BoxDecoration(
                              color: AppColors.secondryColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/book_image.png',
                                      width: 140,
                                      height: 175,
                                    ),
                                  ),
                                  const Gap(5.67),
                                  Text(
                                    'The Republic',
                                    style: getBodyTextStyle(context),
                                  ),
                                  const Gap(15.67),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '₹285',
                                          style: getSmallTextStyle(context),
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                          onPressed: () {},
                                          color: AppColors.textColor,
                                          text: 'Buy',
                                          textStyle: getSmallTextStyle(
                                              fontSize: 14,
                                              context,
                                              color: AppColors.whiteColor),
                                          width: 71.78,
                                          height: 27.9,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
