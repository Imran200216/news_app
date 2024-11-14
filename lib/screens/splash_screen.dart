import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/screens/bottom_nav.dart';
import 'package:news_app/screens/get_started_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  Future<void> _checkUserStatus() async {
    // Retrieve the login status from SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // Delay for splash screen effect
    await Future.delayed(const Duration(seconds: 3));

    // Navigate based on login status
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStartedScreen()),
      );
    }
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
            "NewsHunt",
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
