import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class CustomProfileListTile extends StatelessWidget {
  final String titleText;
  final VoidCallback onTap;
  final IconData iconData;

  const CustomProfileListTile({
    super.key,
    required this.titleText,
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.profileListTileColor,
        ),
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                titleText,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.profileListTileTextColor,
                ),
              ),
              const Spacer(),
              Icon(
                iconData,
                color: AppColors.profileListTileTextColor,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
