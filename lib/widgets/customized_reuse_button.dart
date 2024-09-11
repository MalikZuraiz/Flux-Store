import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluxstore/config/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double borderWidth; // Add this parameter to specify border width

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.borderWidth = 2.0, // Default border width
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60, // Fixed height
        padding:
            const EdgeInsets.symmetric(horizontal: 40), // Horizontal padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.WHITE_COLOR.withOpacity(0.3), // Blur effect
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.WHITE_COLOR.withOpacity(0.8),
                  width: borderWidth, // Set the border width here
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.WHITE_COLOR,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
