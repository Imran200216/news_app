import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon; // Optional suffix icon
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon, // Not required
    this.controller,
    required this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: AppColors.primaryColor,
        ),
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textFieldBgColor,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: AppColors.hintTextFieldColor,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.hintTextFieldColor,
          ),
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  color: AppColors.hintTextFieldColor,
                )
              : null,
          // Only show suffix icon if provided
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 10.0,
          ),
        ),
      ),
    );
  }
}
