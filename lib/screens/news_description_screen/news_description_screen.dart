import 'package:flutter/material.dart';
import 'package:news_app/components/custom_cached_network_image.dart';
import 'package:news_app/constants/colors.dart';

class NewsDescriptionScreen extends StatelessWidget {
  final String newsImgUrl;
  final String newsTitle;
  final String newsDescription;
  final String newsByAuthor;
  final String newsContent;

  const NewsDescriptionScreen({
    super.key,
    required this.newsImgUrl,
    required this.newsTitle,
    required this.newsDescription,
    required this.newsByAuthor,
    required this.newsContent,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,

          /// back button
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
              color: AppColors.subTitleTextColor,
            ),
          ),
          actions: [
            /// share btn
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.share,
                size: 24,
                color: AppColors.subTitleTextColor,
              ),
            ),

            const SizedBox(
              width: 8,
            ),

            /// book mark icon button
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.bookmark_outline,
                size: 24,
                color: AppColors.subTitleTextColor,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// news image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomCachedImage(
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: newsImgUrl,
                    errorIconSize: 20,
                    errorIconColor: AppColors.primaryColor,
                    loadingIconColor: AppColors.primaryColor,
                    loadingIconSize: 20,
                  ),
                ),

                const SizedBox(height: 20), // Add space between image and chip

                /// Chip with background color and text color from AppColors
                const Chip(
                  label: Text(
                    'Politics', // Example category
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    side: BorderSide(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  backgroundColor: AppColors.primaryColor, // Background color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                ),
                const SizedBox(height: 20),

                // Title
                Text(
                  textAlign: TextAlign.start,
                  newsTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.titleTextColor,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Author - ",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.subTitleTextColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      newsByAuthor,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.titleTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                // Title
                Text(
                  textAlign: TextAlign.start,
                  newsDescription,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.titleTextColor,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // sub title
                Text(
                  textAlign: TextAlign.start,
                  newsContent,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.subTitleTextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
