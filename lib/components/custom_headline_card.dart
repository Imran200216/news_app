import 'package:flutter/material.dart';
import 'package:news_app/components/custom_cached_network_image.dart';
import 'package:news_app/constants/colors.dart';

class CustomHeadlineCard extends StatelessWidget {
  final String imageUrl;
  final String chipLabel;
  final double height;
  final double width;
  final double borderRadius;
  final VoidCallback onTap;

  const CustomHeadlineCard({
    super.key,
    required this.imageUrl,
    required this.chipLabel,
    this.height = 240,
    this.width = 200,
    this.borderRadius = 20,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          /// headlines image
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: CustomCachedImage(
              height: height,
              width: width,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              errorIconSize: 20,
              errorIconColor: AppColors.primaryColor,
              loadingIconColor: AppColors.primaryColor,
              loadingIconSize: 20,
            ),
          ),

          /// linear gradient
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7), // Smokey black at the bottom
                ],
              ),
            ),
          ),

          /// chip at the bottom start
          Positioned(
            bottom: 22,
            left: 8,
            child: Chip(
              label: Text(
                chipLabel,
                style: const TextStyle(color: AppColors.secondaryColor),
              ),
              backgroundColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
