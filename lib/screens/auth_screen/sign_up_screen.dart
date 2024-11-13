import 'package:flutter/material.dart';
import 'package:news_app/components/custom_btn.dart';
import 'package:news_app/components/custom_loading_animation.dart';
import 'package:news_app/components/custom_password_text_field.dart';
import 'package:news_app/components/custom_text_btn.dart';
import 'package:news_app/components/custom_text_field.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/auth_provider/email_auth_provider.dart';
import 'package:news_app/screens/auth_screen/sign_in_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// email auth provider
    final emailAuthProvider = Provider.of<EmailAuthenticationProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome to Shout 👋",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.titleTextColor,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Hello, I guess you are new around here. You can start using the application after sign up.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.subTitleTextColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: emailAuthProvider.nameController,
                  hintText: "Username",
                  prefixIcon: Icons.person_outlined,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: emailAuthProvider.registerEmailController,
                  hintText: "Email Address",
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                CustomPasswordTextField(
                  controller: emailAuthProvider.registerPasswordController,
                  hintText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 20),
                CustomPasswordTextField(
                  controller:
                      emailAuthProvider.registerConfirmPasswordController,
                  hintText: "Confirm Password",
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 40),

                emailAuthProvider.isLoading
                    ? const Center(
                        child: CustomLoadingAnimation(
                          loadingColor: AppColors.primaryColor,
                          loadingSize: 22,
                        ),
                      )
                    : CustomBtn(
                        btnText: "Sign Up",
                        onTap: () {
                          emailAuthProvider.registerWithEmailPassword(context);
                        },
                      ),
                const SizedBox(height: 20),
                // Added spacing here instead of Spacer
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        },
                      ),
                    ],
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
