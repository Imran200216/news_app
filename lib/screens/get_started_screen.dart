import 'package:flutter/material.dart';
import 'package:news_app/components/custom_btn.dart';
import 'package:news_app/components/custom_cached_network_image.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/screens/get_started_final_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      bottomSheet: Container(
        color: AppColors.secondaryColor,
        padding: const EdgeInsets.all(16.0),
        child: CustomBtn(
          btnText: "Next",
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const GetStartedFinalScreen();
            }));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// cached network image slider
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: const CustomCachedImage(
                height: 300,
                width: 300,
                imageUrl:
                    "https://images.unsplash.com/photo-1523995462485-3d171b5c8fa9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                errorIconSize: 24,
                errorIconColor: AppColors.primaryColor,
                loadingIconColor: AppColors.primaryColor,
                loadingIconSize: 24,
              ),
            ),

            const SizedBox(
              height: 80,
            ),

            /// title text
            const Text(
              textAlign: TextAlign.center,
              "First to know",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.titleTextColor,
                fontSize: 24,
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            /// subtitle text
            const Text(
              textAlign: TextAlign.center,
              "All news in one place, be\nthe first to know last news",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.subTitleTextColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
