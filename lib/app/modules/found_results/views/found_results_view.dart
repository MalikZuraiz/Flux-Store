import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluxstore/app/routes/app_pages.dart';
import 'package:fluxstore/config/app_text_style.dart';
import 'package:get/get.dart';
import '../controllers/found_results_controller.dart';

class FoundResultsView extends GetView<FoundResultsController> {
  final String? category;

  const FoundResultsView({super.key, this.category = 'Category'});

  @override
  Widget build(BuildContext context) {
    // Sample data for grid items with random prices and ratings
    final List<Map<String, dynamic>> items = List.generate(
      20,
      (index) => {
        "title": "$category Dress ${index + 1}",
        "image":
            "assets/images/dress_${(index % 5) + 1}.png", // Sample image paths
        "price":
            Random().nextDouble() * 100 + 10, // Random price between 10 and 110
        "rating": Random().nextInt(5) + 1, // Random rating between 1 and 5
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '120 Results Found',
          style: AppTextStyles.labelLargeMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            childAspectRatio: 0.7, // 70% height for the image
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: items.length, // 20 items
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                // Handle the item tap here
                Get.toNamed(Routes.PRODUCT_DETAIL);
              },
              child: GridTile(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Image container with 70% height
                        Expanded(
                          flex: 7, // 70% height for the image
                          child: Stack(
                            children: [
                              Container(
                                height: 200,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://via.placeholder.com/140x140'), // Replace with product image URL
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Like button in the top-right corner
                              Positioned(
                                right: 2,
                                top: 0,
                                child: IconButton(
                                  icon: const Icon(Icons.favorite_border),
                                  color: Colors.black,
                                  onPressed: () {
                                    // Handle the "like" button press here
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Title and rating of the item (Dress)
                        Expanded(
                          flex: 4, // 30% for the title, rating, and price
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["title"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                // Star Rating
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(5, (starIndex) {
                                    return Icon(
                                      Icons.star,
                                      color: starIndex < item["rating"]
                                          ? Colors.amber
                                          : Colors.grey,
                                      size: 16,
                                    );
                                  }),
                                ),
                                const SizedBox(height: 4),
                                // Display random price
                                Text(
                                  '\$${item["price"].toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
