import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/custom_loading_animation.dart';
import 'package:news_app/components/custom_profile_list_tile.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/auth_provider/email_auth_provider.dart';
import 'package:news_app/provider/auth_provider/google_auth_provider.dart';
import 'package:news_app/screens/profile_sub_screen/terms_conditions_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Current user
    final user = FirebaseAuth.instance.currentUser;

    // Google and email authentication providers
    final googleAuthProvider =
        Provider.of<GoogleAuthenticationProvider>(context);
    final emailAuthProvider = Provider.of<EmailAuthenticationProvider>(context);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
          top: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: AppColors.titleTextColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                // Profile image
                user?.photoURL == null
                    ? const SizedBox()
                    : Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: user!.photoURL!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                      ),
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Person name
                    Text(
                      user?.displayName ?? "No name found",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.titleTextColor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Person email address
                    Text(
                      user?.email ?? "No email address found",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.subTitleTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 50),

            CustomProfileListTile(
              titleText: "Terms & Conditions",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsConditionsScreen(),
                  ),
                );
              },
              iconData: Icons.arrow_forward_ios,
            ),

            const SizedBox(height: 20),

            user?.email?.isEmpty ?? true
                ? emailAuthProvider.isLoading
                    ? const CustomLoadingAnimation(
                        loadingColor: AppColors.primaryColor,
                        loadingSize: 22,
                      )
                    : CustomProfileListTile(
                        titleText: "Sign Out",
                        onTap: () {
                          emailAuthProvider.signOutWithEmail(context);
                        },
                        iconData: Icons.logout,
                      )
                : googleAuthProvider.isLoading
                    ? const CustomLoadingAnimation(
                        loadingColor: AppColors.primaryColor,
                        loadingSize: 22,
                      )
                    : CustomProfileListTile(
                        titleText: "Sign Out",
                        onTap: () {
                          googleAuthProvider.signOut(context);
                        },
                        iconData: Icons.logout,
                      ),
          ],
        ),
      ),
    );
  }
}
