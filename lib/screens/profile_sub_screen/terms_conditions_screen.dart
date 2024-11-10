import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.profileListTileTextColor,
            ),
          ),
          title: const Text("Terms & Conditions"),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.titleTextColor,
            fontSize: 20,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 20,
            ),
            child: const Column(
              children: [
                Text(
                  "Welcome to Shout! By downloading, accessing, or using Shout, you agree to comply with these Terms and Conditions. Shout is designed to help users connect, communicate, and express themselves openly within the boundaries of respectful and lawful conduct. By using this app, you agree to refrain from any actions that could harm, harass, or otherwise negatively impact other users or the app itself. You must also agree to follow all applicable laws and regulations while using Shout, including restrictions related to content sharing, intellectual property, and personal privacy.",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.subTitleTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16), // Space between paragraphs
                Text(
                  "Shout reserves the right to update or modify these Terms and Conditions at any time. Users will be notified of any significant changes, and continued use of the app after such modifications will signify acceptance of the updated terms. Shout is committed to user privacy and data security; however, it is your responsibility to protect your account details and ensure that all communications are lawful and in line with community guidelines. Violation of these terms may result in suspension or termination of your access to the app.",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.subTitleTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16), // Space between paragraphs
                Text(
                  "Please note that Shout is not liable for any content shared by users on the platform. Users are solely responsible for the information, images, and messages they share. Shout reserves the right to remove any content deemed inappropriate, offensive, or harmful. Users should use caution when sharing personal information and interact with others respectfully and responsibly within the platform.",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.subTitleTextColor,
                    fontWeight: FontWeight.w500,
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
