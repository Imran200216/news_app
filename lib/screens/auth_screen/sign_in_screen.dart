import 'package:flutter/material.dart';
import 'package:news_app/components/custom_btn.dart';
import 'package:news_app/components/custom_outlined_btn.dart';
import 'package:news_app/components/custom_password_text_field.dart';
import 'package:news_app/components/custom_text_btn.dart';
import 'package:news_app/components/custom_text_field.dart';
import 'package:news_app/constants/colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
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
                "Welcome Back 👋",
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
                "I am happy to see you again. You can continue where you left off by logging in!",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.subTitleTextColor,
                  fontSize: 16,
                ),
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

              const CustomPasswordTextField(
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
              ),

              const SizedBox(
                height: 20,
              ),

              Align(
                alignment: Alignment.topRight,
                child: CustomTextBtn(
                  btnTitle: "Forget Password?",
                  onTap: () {},
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              /// sign in btn
              CustomBtn(
                btnText: "Sign In",
                onTap: () {},
              ),

              const SizedBox(
                height: 22,
              ),

              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.2,
                      color: AppColors.subTitleTextColor,
                    ),
                  ),

                  SizedBox(
                    width: 6,
                  ),

                  /// sub title
                  Text(
                    textAlign: TextAlign.center,
                    "Or",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.subTitleTextColor,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.2,
                      color: AppColors.subTitleTextColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 22,
              ),

              CustomOutlinedBtn(
                iconName: "google-logo",
                btnText: "Sign in with Google",
                onTap: () {},
              ),

              const SizedBox(
                height: 22,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    "Don't have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.subTitleTextColor,
                      fontSize: 16,
                    ),
                  ),
                  CustomTextBtn(
                    btnTitle: "Sign Up",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
