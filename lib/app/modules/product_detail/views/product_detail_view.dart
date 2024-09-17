import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageWithHeader(context),
                  _buildProductDetails(),
                  _buildExpandableSection(
                    title: 'Description',
                    content: const Text(
                        'This is the product description, providing details about the product.'),
                  ),
                  _buildExpandableSection(
                    title: 'Reviews',
                    content: _buildReviews(),
                  ),
                  _buildExpandableSection(
                    title: 'Similar Products',
                    content: _buildSimilarProducts(),
                  ),

                  const SizedBox(height: 120), // Space for fixed button
                ],
              ),
            ),

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
                    label: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
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
      ),
    );
  }

  // Header with back and favorite buttons over the image carousel
  Widget _buildImageWithHeader(BuildContext context) {
    return Stack(
      children: [
        _buildImageCarousel(context),
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Handle favorite action
            },
          ),
        ),
      ],
    );
  }

  // Image Carousel
  Widget _buildImageCarousel(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.4,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
      ),
      items: [1, 2, 3].map((i) {
        return Image.network(
          'https://via.placeholder.com/400x300',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        );
      }).toList(),
    );
  }

  // Product details: name, price, rating, color, size
  Widget _buildProductDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$199.99',
                style: TextStyle(fontSize: 22, color: Colors.green),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.star, color: Colors.lightBlue, size: 20),
              Icon(Icons.star, color: Colors.lightBlue, size: 20),
              Icon(Icons.star, color: Colors.lightBlue, size: 20),
              Icon(Icons.star, color: Colors.lightBlue, size: 20),
              Icon(Icons.star_border, size: 20),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildOptionRow('Select Color:', [
                _buildColorOption(Colors.red),
                _buildColorOption(Colors.blue),
                _buildColorOption(Colors.green),
              ]),
              const SizedBox(width: 20),
              _buildOptionRow('Select Size:', [
                _buildSizeOption('S'),
                _buildSizeOption('M'),
                _buildSizeOption('L'),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  // Helper for building color or size selection
  Widget _buildOptionRow(String title, List<Widget> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 8),
        Row(children: options),
      ],
    );
  }

  Widget _buildColorOption(Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildSizeOption(String size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(size),
    );
  }

  // Reviews Section with ListTile, Circular Image and Box Shadow
  Widget _buildReviews() {
    return Column(
      children: [
        _buildReviewTile('User123', 'This product is amazing!'),
        _buildReviewTile('User456', 'Could be better, but satisfied.'),
      ],
    );
  }

  // Build individual review tile with shadow and circular image
  Widget _buildReviewTile(String username, String review) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
        ),
        title: Text(username),
        subtitle: Text(review),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Similar products widget with horizontal scrolling
  Widget _buildSimilarProducts() {
    return SizedBox(
      height: 250, // Adjust based on your design requirements
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // You can modify the number of products
        itemBuilder: (context, index) {
          return Container(
            width: 150, // Adjust the width of each product card
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://via.placeholder.com/150',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                // Product title
                const Text(
                  'Product Title',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                // Product price
                const Text(
                  '\$199.99',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Expandable section for description, reviews, similar products
  Widget _buildExpandableSection({
    required String title,
    required Widget content,
  }) {
    return _ExpandableSection(
      title: title,
      content: content,
    );
  }
}

class _ExpandableSection extends StatefulWidget {
  final String title;
  final Widget content;

  const _ExpandableSection({
    required this.title,
    required this.content,
  });

  @override
  __ExpandableSectionState createState() => __ExpandableSectionState();
}

class __ExpandableSectionState extends State<_ExpandableSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.title),
      trailing: Icon(
        isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
        color: isExpanded ? Colors.black : Colors.black,
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          isExpanded = expanded;
        });
      },
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: widget.content,
        ),
      ],
    );
  }
}
