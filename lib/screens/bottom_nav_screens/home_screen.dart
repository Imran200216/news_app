import 'package:flutter/material.dart';
import 'package:news_app/components/custom_news_card.dart';
import 'package:news_app/components/custom_text_field.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/all_news_provider.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/screens/news_description_screen/news_description_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextEditingController for search input
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// headlines provider
    final newsProvider = Provider.of<NewsProvider>(context);

    /// all news provider
    final allNewsProvider = Provider.of<AllNewsProvider>(context);

    // Filter the news articles based on search query
    List filteredNews = allNewsProvider.posts.where((article) {
      return article['title']
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()) ||
          article['description']
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
    }).toList();

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
              CustomTextField(
                controller: _searchController,
                hintText: "Search",
                prefixIcon: Icons.search,
                keyboardType: TextInputType.text,
                onChanged: (query) {
                  setState(() {}); // Refresh the UI when search text changes
                },
              ),

              const SizedBox(height: 30),

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
                  : filteredNews.isEmpty
                      ? const Center(child: Text("No results found"))
                      : ListView.builder(
                          itemCount: filteredNews.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomINewsCard(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return NewsDescriptionScreen(
                                      newsChip: filteredNews[index]['source']
                                              ['name'] ??
                                          "No chip",
                                      newsImgUrl: filteredNews[index]
                                              ["urlToImage"] ??
                                          "No image",
                                      newsTitle: filteredNews[index]['title'] ??
                                          "No title",
                                      newsDescription: filteredNews[index]
                                              ['description'] ??
                                          "No Description",
                                      newsByAuthor: filteredNews[index]
                                              ['author'] ??
                                          "No author",
                                      newsContent: filteredNews[index]
                                              ['content'] ??
                                          "No content",
                                    );
                                  },
                                ));
                              },
                              title: filteredNews[index]['title'] ?? "No Title",
                              subtitle: filteredNews[index]['description'] ??
                                  "No Description",
                              imageUrl: filteredNews[index]['urlToImage'] ??
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
