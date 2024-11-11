import 'package:flutter/material.dart';
import 'package:news_app/provider/category_chip_provider.dart';
import 'package:provider/provider.dart';
import 'package:news_app/constants/colors.dart';

class CustomCategoryChip extends StatelessWidget {
  final String label;

  const CustomCategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<CategoryChipProvider>(context, listen: false)
            .toggleChipSelection(label);
      },
      child: Consumer<CategoryChipProvider>(
        builder: (context, chipProvider, child) {
          final isSelected = chipProvider.isSelected(label);
          return Chip(
            label: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AppColors.secondaryColor
                    : AppColors.categoryHomeChipTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: isSelected
                ? AppColors.primaryColor
                : AppColors.categoryHomeChipBgColor,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          );
        },
      ),
    );
  }
}
