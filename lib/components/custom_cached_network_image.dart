import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/custom_loading_animation.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final Color loadingIconColor;
  final double loadingIconSize;
  final BoxFit fit;
  final double errorIconSize;
  final Color errorIconColor;
  final double? height;
  final double? width;

  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    required this.errorIconSize,
    required this.errorIconColor,
    required this.loadingIconColor,
    required this.loadingIconSize,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, url) => Center(
          child: CustomLoadingAnimation(
            loadingColor: loadingIconColor,
            loadingSize: loadingIconSize,
          ),
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          size: errorIconSize,
          color: errorIconColor,
        ), // Error widget
      ),
    );
  }
}
