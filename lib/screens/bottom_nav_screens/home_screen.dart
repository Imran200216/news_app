import 'package:flutter/material.dart';
import 'package:news_app/components/cusotm_category_chip.dart';
import 'package:news_app/components/custom_headline_card.dart';
import 'package:news_app/components/custom_news_card.dart';
import 'package:news_app/components/custom_text_field.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/all_news_provider.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/screens/news_description_screen/news_description_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// headlines provider
    final newsProvider = Provider.of<NewsProvider>(context);

    /// all news provider
    final allNewsProvider = Provider.of<AllNewsProvider>(context);

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
              Container(
                clipBehavior: Clip.none,
                height: 257,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: newsProvider.posts.length,
                  itemBuilder: (context, index) {
                    /// headline card
                    return CustomHeadlineCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) { 
                              return NewsDescriptionScreen(
                                newsImgUrl: newsProvider.posts[index]
                                        ['urlToImage'] ??
                                    "No image",
                                newsTitle: newsProvider.posts[index]['title'] ??
                                    "No title",
                                newsDescription: newsProvider.posts[index]
                                        ['description'] ??
                                    "No description",
                                newsByAuthor: newsProvider.posts[index]
                                        ['author'] ??
                                    "No author",
                                newsContent: newsProvider.posts[index]
                                        ['content'] ??
                                    "No content",
                              );
                            },
                          ),
                        );
                      },
                      imageUrl:
                          newsProvider.posts[index]["urlToImage"] ?? "No image",
                      chipLabel: newsProvider.posts[index]["source"]["name"] ??
                          "No chips",
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 20,
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
                      itemCount: allNewsProvider.posts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomINewsCard(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return NewsDescriptionScreen(
                                  newsImgUrl: allNewsProvider.posts[index]
                                          ["urlToImage"] ??
                                      "No image",
                                  newsTitle: allNewsProvider.posts[index]
                                          ['title'] ??
                                      "No title",
                                  newsDescription: allNewsProvider.posts[index]
                                          ['description'] ??
                                      "No Description",
                                  newsByAuthor: allNewsProvider.posts[index]
                                          ['author'] ??
                                      "No author",
                                  newsContent: allNewsProvider.posts[index]
                                          ['content'] ??
                                      "No content",
                                );
                              },
                            ));
                          },
                          title: allNewsProvider.posts[index]['title'] ??
                              "No Title",
                          subtitle: allNewsProvider.posts[index]
                                  ['description'] ??
                              "No Description",
                          imageUrl: allNewsProvider.posts[index]
                                  ['urlToImage'] ??
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
