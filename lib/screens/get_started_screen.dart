import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/custom_btn.dart';
import 'package:news_app/components/custom_cached_network_image.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/carousel_provider.dart';
import 'package:news_app/screens/get_started_final_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of image URLs for the carousel slider
    final List<String> imageUrls = [
      "https://images.unsplash.com/photo-1523995462485-3d171b5c8fa9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1604595704321-f24afaa2fa6e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1593789198777-f29bc259780e?q=80&w=2070&auto=format&fit=crop&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ];

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
            /// Carousel Slider
            Consumer<CarouselIndexProvider>(
              builder: (context, carouselProvider, child) {
                return CarouselSlider.builder(
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CustomCachedImage(
                        height: 300,
                        width: 300,
                        imageUrl: imageUrls[index],
                        errorIconSize: 24,
                        errorIconColor: AppColors.primaryColor,
                        loadingIconColor: AppColors.primaryColor,
                        loadingIconSize: 24,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    // Automatically move to the next image
                    autoPlayInterval: const Duration(seconds: 3),
                    // Set the interval time
                    enlargeCenterPage: true,
                    aspectRatio: 1.0,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      carouselProvider.setCurrentIndex(
                          index); // Update the index in the provider
                    },
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),

            /// Smooth Page Indicator
            Consumer<CarouselIndexProvider>(
              builder: (context, carouselProvider, child) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SmoothPageIndicator(
                    controller: PageController(
                        initialPage: carouselProvider.currentIndex),
                    count: imageUrls.length,
                    effect: const WormEffect(
                      dotColor: AppColors.hintTextFieldColor,
                      activeDotColor: AppColors.primaryColor,
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(
              height: 40,
            ),

            /// Title text
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

            /// Subtitle text
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
