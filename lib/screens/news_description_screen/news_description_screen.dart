import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class NewsDescriptionScreen extends StatelessWidget {
  const NewsDescriptionScreen({super.key});

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
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1731329152944-6581e0e707b5?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      fit: BoxFit.cover,
                    ),
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
                const Text(
                  textAlign: TextAlign.start,
                  "Title",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.titleTextColor,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    /// profile image
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            "https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// person name
                        Text(
                          "Dev P",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: AppColors.titleTextColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),

                        /// person email address
                        Text(
                          "Designer",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.subTitleTextColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                // Title
                const Text(
                  textAlign: TextAlign.start,
                  "Results",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.titleTextColor,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // sub title
                const Text(
                  textAlign: TextAlign.start,
                  '''The NewsDescriptionScreen in the app is designed to provide users with a clean and visually appealing interface to view news details. It features a full-width image at the top, presented within rounded corners to maintain a polished look. Directly below the image, a category chip—styled with a primary color background and contrasting secondary color text—adds context to the article’s theme, enhancing navigation and readability. The app bar includes intuitive icons for navigation, sharing, and bookmarking, allowing users to interact seamlessly with the news content. The overall layout is spacious, modern, and optimized for an engaging reading experience.''',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.subTitleTextColor,
                    fontSize: 16,
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
