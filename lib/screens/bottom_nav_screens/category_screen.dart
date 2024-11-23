import 'package:flutter/material.dart';
import 'package:news_app/components/custom_headline_card.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/screens/news_description_screen/news_description_screen.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// headlines provider
    final newsProvider = Provider.of<NewsProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today's Headline news",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.titleTextColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 12),

              // Wrap GridView.builder with an Expanded widget to fix overflow
              Expanded(
                child: GridView.builder(
                  // GridView.builder will automatically handle scrolls
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Adjust this for the number of columns
                    crossAxisSpacing: 10, // Space between columns
                    mainAxisSpacing: 10, // Space between rows
                    childAspectRatio:
                        0.7, // Adjust the aspect ratio of each item
                  ),
                  itemCount: newsProvider.posts.length,
                  itemBuilder: (context, index) {
                    return CustomHeadlineCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NewsDescriptionScreen(
                                newsChip: newsProvider.posts[index]['source']['name'],
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
