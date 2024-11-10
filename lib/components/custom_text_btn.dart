import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class CustomTextBtn extends StatelessWidget {
  final String btnTitle;
  final VoidCallback onTap;

  const CustomTextBtn({
    super.key,
    required this.btnTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        btnTitle,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
