import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/components/custom_btn.dart';
import 'package:news_app/components/custom_loading_animation.dart';
import 'package:news_app/components/custom_text_field.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/auth_provider/email_auth_provider.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Consumer<EmailAuthenticationProvider>(
          builder: (
            context,
            emailAuthProvider,
            child,
          ) {
            return Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/svg/news-forget.svg",
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    controller: emailAuthProvider.forgetPasswordEmailController,
                    hintText: "Email Address",
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  emailAuthProvider.isLoading
                      ? const Center(
                          child: CustomLoadingAnimation(
                            loadingColor: AppColors.primaryColor,
                            loadingSize: 22,
                          ),
                        )
                      : CustomBtn(
                          btnText: "Send link",
                          onTap: () {
                            emailAuthProvider.resetPassword(context);
                          },
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
