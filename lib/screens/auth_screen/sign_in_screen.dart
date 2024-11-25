import 'package:flutter/material.dart';
import 'package:news_app/components/custom_btn.dart';
import 'package:news_app/components/custom_loading_animation.dart';
import 'package:news_app/components/custom_password_text_field.dart';
import 'package:news_app/components/custom_text_btn.dart';
import 'package:news_app/components/custom_text_field.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/auth_provider/email_auth_provider.dart';
import 'package:news_app/provider/auth_provider/google_auth_provider.dart';
import 'package:news_app/screens/auth_screen/forget_password_screen.dart';
import 'package:news_app/screens/auth_screen/sign_up_screen.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// auth provider (google auth provider)
    final googleAuthProvider =
        Provider.of<GoogleAuthenticationProvider>(context);

    /// email auth provider
    final emailAuthProvider = Provider.of<EmailAuthenticationProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SingleChildScrollView(
          child: Container(
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
                CustomTextField(
                  controller: emailAuthProvider.loginEmailController,
                  hintText: "Email Address",
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(
                  height: 20,
                ),

                /// password text field
                CustomPasswordTextField(
                  fieldKey: "loginPassword",
                  controller: emailAuthProvider.loginPasswordController,
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
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ForgetPasswordScreen();
                        },
                      ));
                    },
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                /// sign in btn email auth
                emailAuthProvider.isLoading
                    ? const Center(
                        child: CustomLoadingAnimation(
                          loadingColor: AppColors.primaryColor,
                          loadingSize: 22,
                        ),
                      )
                    : CustomBtn(
                        btnText: "Sign In",
                        onTap: () {
                          emailAuthProvider.loginWithEmailPassword(context);
                        },
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
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpScreen();
                        }));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
