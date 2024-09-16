import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final double? width; // Optional width provided by the user
  final TextEditingController controller;
  final String hintText;

  const SearchTextField({
    Key? key,
    this.width,
    required this.controller,
    this.hintText = 'Search',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ??
          MediaQuery.of(context).size.width *
              0.8, // Optional width or default to 80% of screen width
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white, // White background
        borderRadius: BorderRadius.circular(8), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Light grey shadow
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none, // No border
          icon: const Icon(Icons.search), // Leading search icon
        ),
      ),
    );
  }
}
