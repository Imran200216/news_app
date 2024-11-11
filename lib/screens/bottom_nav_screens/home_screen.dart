import 'package:flutter/material.dart';
import 'package:news_app/components/cusotm_category_chip.dart';
import 'package:news_app/components/custom_cached_network_image.dart';
import 'package:news_app/components/custom_text_field.dart';
import 'package:news_app/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title
              const Text(
                "Browse",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.titleTextColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              /// sub title
              const Text(
                textAlign: TextAlign.start,
                "Discover things of this world",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.subTitleTextColor,
                  fontSize: 16,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              /// search text field
              CustomTextField(
                hintText: "Search",
                prefixIcon: Icons.search,
                keyboardType: TextInputType.text,
              ),

              const SizedBox(
                height: 20,
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CustomCategoryChip(label: "Sports"),
                    SizedBox(width: 8),
                    CustomCategoryChip(label: "Nation"),
                    SizedBox(width: 8),
                    CustomCategoryChip(label: "Gaming"),
                    SizedBox(width: 8),
                    CustomCategoryChip(label: "Politics"),
                    SizedBox(width: 8),
                    CustomCategoryChip(label: "Technology"),
                    SizedBox(width: 8),
                    CustomCategoryChip(label: "Entertainment"),
                    SizedBox(width: 8),
                    CustomCategoryChip(label: "Health"),
                    SizedBox(width: 8),
                    CustomCategoryChip(label: "Science"),
                    SizedBox(width: 8),
                    CustomCategoryChip(label: "Business"),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // Container(
              //   height: 257,
              //   width: 257,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //     image: const DecorationImage(
              //       image: NetworkImage(
              //         "https://plus.unsplash.com/premium_photo-1672423154405-5fd922c11af2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              //       ),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const CustomCachedImage(
                  height: 257,
                  width: 257,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://plus.unsplash.com/premium_photo-1672423154405-5fd922c11af2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  errorIconSize: 20,
                  errorIconColor: AppColors.primaryColor,
                  loadingIconColor: AppColors.primaryColor,
                  loadingIconSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
