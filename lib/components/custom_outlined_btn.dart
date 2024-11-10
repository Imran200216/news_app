import 'package:flutter/material.dart';
import 'package:news_app/constants/colors.dart';

class CustomOutlinedBtn extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  final String iconName;

  const CustomOutlinedBtn({
    super.key,
    required this.btnText,
    required this.onTap,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Transparent background
          elevation: 0, // Removes shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: const BorderSide(
              color: Color(0xFFF2F4F7), // Border color
              width: 1.0, // Border width
            ),
          ),
        ),
        onPressed: onTap,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/png/$iconName.png",
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Text(
                btnText,
                style: const TextStyle(
                  color: Color(0xFF666C8E), // Text color
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
