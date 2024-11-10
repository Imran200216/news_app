import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/screens/get_started_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.zero,
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const GetStartedScreen();
              }));
            },
            child: const Text(
              "News",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.secondaryColor,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
