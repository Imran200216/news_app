import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/password_visibility_provider.dart';
import 'package:provider/provider.dart';

class CustomPasswordTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String fieldKey;

  const CustomPasswordTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.keyboardType,
    required this.fieldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVisibilityProvider>(
      builder: (
        context,
        passwordVisibilityProvider,
        child,
      ) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: TextField(
            obscureText: passwordVisibilityProvider.isObscure(fieldKey),
            // Toggles password visibility
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
                onPressed: () {
                  // Toggles the visibility when pressed
                  passwordVisibilityProvider.toggleVisibility(fieldKey);
                },
                icon: Icon(
                  passwordVisibilityProvider.isObscure(fieldKey)
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: passwordVisibilityProvider.isObscure(fieldKey)
                      ? AppColors.subTitleTextColor
                      : AppColors.primaryColor,
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
      },
    );
  }
}
