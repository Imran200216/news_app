import 'package:flutter/material.dart';
import 'package:news_app/components/cusotm_category_chip.dart';
import 'package:news_app/components/custom_cached_network_image.dart';
import 'package:news_app/components/custom_news_card.dart';
import 'package:news_app/components/custom_text_field.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/screens/news_description_screen/news_description_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Access provider
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Subtitle
              const Text(
                "Browse",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.titleTextColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Discover things of this world",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.subTitleTextColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),

              // Search TextField
              const CustomTextField(
                hintText: "Search",
                prefixIcon: Icons.search,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),

              // Categories Chips
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
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
              const SizedBox(height: 20),

              // Featured News Carousel
              SizedBox(
                height: 257,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: SizedBox(
                        width: 257,
                        child: Stack(
                          children: [
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
                            Container(
                              height: 257,
                              width: 257,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.4),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 6,
                              right: 6,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark_border_outlined,
                                  size: 32,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                            ),
                            const Positioned(
                              bottom: 50,
                              left: 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "POLITICS",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      wordSpacing: 4,
                                      color: AppColors.secondaryColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Politics",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      wordSpacing: 4,
                                      color: AppColors.secondaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),

              // Recommended News
              const Text(
                "Recommended for you",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.titleTextColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),

              // News Cards List
              newsProvider.posts.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : ListView.builder(
                      itemCount: newsProvider.posts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomINewsCard(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const NewsDescriptionScreen();
                              },
                            ));
                          },
                          title: newsProvider.posts[index]['title'],
                          subtitle: newsProvider.posts[index]['description'],
                          imageUrl: newsProvider.posts[index]['urlToImage'] ??
                              "No image",
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
