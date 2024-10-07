import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/function/navigation.dart';
import 'package:bookia_store_app/core/utils/text_style.dart';
import 'package:bookia_store_app/feature/home/presentation/widgets/best_seller_widget.dart';
import 'package:bookia_store_app/feature/home/presentation/widgets/home_banner.dart';
import 'package:bookia_store_app/feature/search/presentation/page/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

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
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: SvgPicture.asset(AssetsIcons.logoSvg, height: 30),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsIcons.notificationSvg),
          ),
          IconButton(
            onPressed: () {
              push(context, const SearchView());
            },
            icon: SvgPicture.asset(AssetsIcons.searchSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeBannerWidget(),
              const Gap(16),
              Text('Best Seller', style: getTitleTextStyle(context)),
              const BestSellerBooksWidget()
            ],
          ),
        ),
      ),
    );
  }
}
