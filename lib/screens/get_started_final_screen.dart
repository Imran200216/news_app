import 'package:flutter/material.dart';
import 'package:news_app/components/custom_btn.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/screens/auth_screen/sign_in_screen.dart';

class GetStartedFinalScreen extends StatelessWidget {
  const GetStartedFinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      bottomSheet: Container(
        color: AppColors.secondaryColor,
        padding: const EdgeInsets.all(16.0),
        child: CustomBtn(
          btnText: "Get Started",
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const SignInScreen();
              },
            ));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// image
            Image.asset(
              "assets/images/png/3d-illustration.png",
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            /// subtitle text
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                textAlign: TextAlign.center,
                "All news in one place, be\nthe first to know last news",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.subTitleTextColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
