import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/custom_profile_list_tile.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/screens/profile_sub_screen/terms_conditions_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// title
            const Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: AppColors.titleTextColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            Row(
              children: [
                /// profile image
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        "https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
                const SizedBox(
                  width: 30,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// person name
                    Text(
                      "Dev P",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.titleTextColor,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    /// person email address
                    Text(
                      "dev@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.subTitleTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 50,
            ),

            CustomProfileListTile(
              titleText: "Terms & Conditions",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const TermsConditionsScreen();
                    },
                  ),
                );
              },
              iconData: Icons.arrow_forward_ios,
            ),

            const SizedBox(
              height: 20,
            ),

            CustomProfileListTile(
              titleText: "Sign Out",
              onTap: () {},
              iconData: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
