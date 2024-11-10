import 'package:flutter/material.dart';
import 'package:news_app/components/custom_btn.dart';
import 'package:news_app/components/custom_password_text_field.dart';
import 'package:news_app/components/custom_text_btn.dart';
import 'package:news_app/components/custom_text_field.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/screens/auth_screen/sign_in_screen.dart';
import 'package:news_app/screens/favorite_topics_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title
              const Text(
                "Welcome to Shout 👋",
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
                "Hello, I guess you are new around here. You can start using the application after sign up.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.subTitleTextColor,
                  fontSize: 16,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              /// user name text field
              const CustomTextField(
                hintText: "Username",
                prefixIcon: Icons.person_outlined,
                keyboardType: TextInputType.name,
              ),

              const SizedBox(
                height: 20,
              ),

              /// email address text field
              const CustomTextField(
                hintText: "Email Address",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(
                height: 20,
              ),

              /// password
              const CustomPasswordTextField(
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
              ),

              const SizedBox(
                height: 20,
              ),

              /// confirm password
              const CustomPasswordTextField(
                hintText: "Confirm Password",
                keyboardType: TextInputType.visiblePassword,
              ),

              const SizedBox(
                height: 40,
              ),

              /// sign in btn
              CustomBtn(
                btnText: "Sign Up",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FavoriteTopicsScreen();
                  }));
                },
              ),

              const Spacer(),

              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      "Already have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.subTitleTextColor,
                        fontSize: 16,
                      ),
                    ),
                    CustomTextBtn(
                      btnTitle: "Sign In",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignInScreen();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
