import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/screens/get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer of 5 seconds to navigate to the GetStartedScreen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const GetStartedScreen();
        }),
      );
    });
  }

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
        child: const Center(
          child: Text(
            "News",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.secondaryColor,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
