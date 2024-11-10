import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class CustomPasswordTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const CustomPasswordTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: TextField(
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
          prefixIcon: const Icon(
            Icons.password,
            color: AppColors.hintTextFieldColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.visibility,
              color: AppColors.hintTextFieldColor,
            ),
          ),
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
