import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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



          ],
        ),
      ),
    );
  }
}
