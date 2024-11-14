import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/bottom_nav_provider.dart';
import 'package:news_app/screens/bottom_nav_screens/category_screen.dart';
import 'package:news_app/screens/bottom_nav_screens/home_screen.dart';
import 'package:news_app/screens/bottom_nav_screens/profile_screen.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  /// Bottom navigation bar screens
  final List<Widget> widgetList = [
    const HomeScreen(),
    const CategoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<BottomNavProvider>(
      builder: (context, bottomNavProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            if (bottomNavProvider.currentIndex != 0) {
              bottomNavProvider.setIndex(0);
              return false;
            } else {
              return true;
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.secondaryColor,

            /// Bottom navigation bar
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                bottomNavProvider.setIndex(index);
              },
              backgroundColor: AppColors.secondaryColor,
              currentIndex: bottomNavProvider.currentIndex,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.subTitleTextColor,
              showSelectedLabels: false,
              // Hide selected labels
              showUnselectedLabels: false,
              // Hide unselected labels
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/svg/home-icon.svg',
                    color: bottomNavProvider.currentIndex == 0
                        ? AppColors.primaryColor
                        : AppColors.subTitleTextColor,
                    height: 24,
                    width: 24,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/svg/category-icon.svg',
                    color: bottomNavProvider.currentIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.subTitleTextColor,
                    height: 24,
                    width: 24,
                  ),
                  label: 'Headline',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/svg/profile-icon.svg',
                    color: bottomNavProvider.currentIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.subTitleTextColor,
                    height: 24,
                    width: 24,
                  ),
                  label: 'Profile',
                ),
              ],
            ),

            body: IndexedStack(
              index: bottomNavProvider.currentIndex,
              children: widgetList,
            ),
          ),
        );
      },
    );
  }
}
