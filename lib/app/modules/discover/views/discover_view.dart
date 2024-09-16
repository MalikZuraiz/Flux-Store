import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluxstore/app/modules/discover/controllers/discover_controller.dart';
import 'package:fluxstore/app/modules/found_results/views/found_results_view.dart';
import 'package:fluxstore/config/app_images.dart';
import 'package:fluxstore/config/app_text_style.dart';
import 'package:fluxstore/widgets/customized_search_field.dart';
import 'package:fluxstore/widgets/cutomized_drawer.dart';
import 'package:get/get.dart';



class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    // List of categories for the containers
    final List<String> categories = [
      'Clothes',
      'Accessories',
      'Shoes',
      'Collection',
      'Gadgets',
      'Beauty',
      'Home',
      'Books',
      'Toys',
      'Electronics'
    ];

    // Tracks which container is expanded
    final RxInt expandedIndex = (-1).obs;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover',
          style: AppTextStyles.labelLargeMedium.copyWith(
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset(
                AppImages.NOTIFICATION_ICON,
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset(
            AppImages.DRAWER,
            width: 30,
            height: 30,
          ),
        ),
      ),
      drawer: const CustomDrawer(activeMenuItem: 'Discover'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    controller: searchController,
                    hintText: 'Search for items',
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    // Add your edit action here
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.edit, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length, // Number of categories
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to FoundResultsView on tap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoundResultsView(
                              category: categories[index], // Pass selected category
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16,
                        ),
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.primaries[index % Colors.primaries.length],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                categories[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Image.asset(
                              AppImages.SHOES_IMAGE,
                              width: 150,
                              height: double.maxFinite,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Display ListTiles if the container is expanded
                    if (expandedIndex.value == index)
                      Column(
                        children: List.generate(5, (i) {
                          final randomItems = Random().nextInt(50) + 1; // Generate random item number
                          return ListTile(
                            title: Text('${categories[index]} Item ${i + 1}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('$randomItems items'),
                                const Icon(Icons.arrow_right),
                              ],
                            ),
                          );
                        }),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
