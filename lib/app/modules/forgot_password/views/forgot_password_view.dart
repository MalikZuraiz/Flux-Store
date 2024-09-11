import 'package:flutter/material.dart';
import 'package:fluxstore/widgets/customized_textfield.dart';
import 'package:get/get.dart';
import 'package:fluxstore/widgets/customized_reuse_button.dart'; // Assuming this is the custom button widget

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top left back button
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Circular shape for the button
                border: Border.all(color: Colors.grey, width: 0),
              ),
              child: IconButton(
                onPressed: () {
                  Get.back(); // Navigate back
                },
                icon: const Icon(Icons.arrow_back),
                padding: const EdgeInsets.all(8),
                iconSize: 20,
              ),
            ),
            const SizedBox(height: 20),

            // Forgot Password Heading
            const Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // Description Text
            const Text(
              'Enter Email Associated With Your Account and\n'
              'We\'ll send an Email with Instructions to \n'
              'Reset Your Password',
              style: TextStyle(
                  fontSize: 15, height: 1.5, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 50),
            const CustomTextField(label: 'Enter your Email Here'),
            const SizedBox(height: 80),

            // Custom rounded button for "Reset Password"
            Center(
              child: CustomButton(
                text: 'Reset Password',
                onTap: () {
                  // Add your reset password logic here
                },
                backgroundColor: Colors.black, // Button color
                width: 300, // Adjust width of the button as required
              ),
            ),
          ],
        ),
      ),
    );
  }
}
