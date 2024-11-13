import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/constants/colors.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              "Bookmarks",
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
              "Saved articles to the library",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.subTitleTextColor,
                fontSize: 16,
              ),
            ),

            const Spacer(),

            /// no book mark icon
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/svg/no-bookmark-icon.svg",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 54,
                      right: 54,
                    ),
                    child: const Text(
                      textAlign: TextAlign.center,
                      "You haven't saved any articles yet. Start reading and bookmarking them now",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.titleTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
