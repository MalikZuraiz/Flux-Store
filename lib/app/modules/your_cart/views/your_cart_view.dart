import 'package:flutter/material.dart';
import 'package:fluxstore/config/app_text_style.dart';
import 'package:get/get.dart';
import '../controllers/your_cart_controller.dart';

class YourCartView extends GetView<YourCartController> {
  const YourCartView({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample products to simulate cart items
    final List<Map<String, dynamic>> cartItems = [
      {
        "image":
            null, // Placeholder for product image (null indicates no image available)
        "title": "Product 1",
        "rating": 4.5,
        "price": 29.99,
        "quantity": 2,
        "color": Colors.red,
        "size": "L"
      },
      {
        "image": null, // Placeholder for product image
        "title": "Product 2",
        "rating": 4.0,
        "price": 19.99,
        "quantity": 1,
        "color": Colors.blue,
        "size": "M"
      },
      {
        "image": null, // Placeholder for product image
        "title": "Product 3",
        "rating": 3.8,
        "price": 49.99,
        "quantity": 3,
        "color": Colors.green,
        "size": "XL"
      },
    ];

    // Placeholder network image URL
    const String placeholderImageUrl =
        'https://via.placeholder.com/140'; // 140x140 placeholder image

    // Calculate the total price of all items
    double totalPrice = cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart',
            style: AppTextStyles.labelLargeMedium
                .copyWith(fontStyle: FontStyle.normal)),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image (Using network placeholder for missing images)
                        Container(
                          width: 120,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: item['image'] == null
                              ? Image.network(
                                  placeholderImageUrl,
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  item['image'],
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(width: 15),
                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Text(
                                item['title'],
                                style: const TextStyle(
                                  fontSize:
                                      18, // Larger font size for the title
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Rating
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 18),
                                  const SizedBox(width: 5),
                                  Text(
                                    item['rating'].toString(),
                                    style: const TextStyle(
                                        fontSize: 16), // Larger rating font
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Size and Quantity
                              Text(
                                "Size: ${item['size']} | Quantity: ${item['quantity']}",
                                style: const TextStyle(
                                  fontSize:
                                      16, // Slightly larger font for size and quantity
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Selected Color
                              Row(
                                children: [
                                  const Text(
                                    "Color: ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: item['color'],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // Price in a separate row
                              Text(
                                "\$${item['price'].toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 20, // Bigger and bold for price
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Bottom Proceed Container without ElevatedButton
          // Fixed Add to Cart Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: 70,
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle Add to Cart action
                  },
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  label: Text(
                    'Proceed with \$$totalPrice',
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
