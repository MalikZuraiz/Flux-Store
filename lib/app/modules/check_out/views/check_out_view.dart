import 'package:flutter/material.dart';
import 'package:fluxstore/config/app_images.dart';
import 'package:fluxstore/config/app_text_style.dart';
import 'package:get/get.dart';
import '../controllers/check_out_controller.dart';

class CheckOutView extends GetView<CheckOutController> {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart',
            style: AppTextStyles.labelLargeMedium
                .copyWith(fontStyle: FontStyle.normal)),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Image below the app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Image.asset(
              AppImages.CHECK_STATUS_IMAGE, // Replace with your image asset
              width: double.infinity,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),

          // Heading for Order Completed
          const Text(
            'Order Completed',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),

          // Center section with another image and thank you message
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Another image in the center
                  Image.asset(
                    AppImages.CHECK_OUT_IMAGE, // Replace with your image asset
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),

                  // Thank you message
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Thank you for purchasing! Until the order is received at your location, feel free to do more shopping.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
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
                  label: const Text(
                    'Continue Shopping',
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
    );
  }
}
