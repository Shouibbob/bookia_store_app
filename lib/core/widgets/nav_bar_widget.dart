import 'package:bookia_store_app/core/constants/assets_icons.dart';
import 'package:bookia_store_app/core/utils/colors.dart';
import 'package:bookia_store_app/feature/cart/page/cart_view.dart';
import 'package:bookia_store_app/feature/home/presentation/page/home_view.dart';
import 'package:bookia_store_app/feature/profile/page/profile_view.dart';
import 'package:bookia_store_app/feature/wishlist/page/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const HomeView(),
    const WishlistView(),
    const CartView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsIcons.homeSvg),
            activeIcon: SvgPicture.asset(
              AssetsIcons.homeSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsIcons.wishListSvg),
              activeIcon: SvgPicture.asset(
                AssetsIcons.wishListSvg,
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
              label: 'Favorates'),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsIcons.cartSvg),
            activeIcon: SvgPicture.asset(
              AssetsIcons.cartSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsIcons.profileSvg),
            activeIcon: SvgPicture.asset(
              AssetsIcons.profileSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
