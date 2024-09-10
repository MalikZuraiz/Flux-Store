import 'package:flutter/material.dart';
import 'package:fluxstore/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:fluxstore/widgets/customized_textfield.dart';
import 'package:get/get.dart';

class SignInView extends GetView<SignInController> {
  // Replace with actual controller
  const SignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            _buildHeading(),
            const SizedBox(height: 30),
            const CustomTextField(label: 'Enter your Email'),
            const SizedBox(height: 20),
            const CustomTextField(
                label: 'Enter your Password', isPassword: true),
            const SizedBox(height: 30),
            _buildCustomButton('Log In', () {
              // Add login logic here
            }),
            const SizedBox(height: 20),
            _buildOrSignInWithText(),
            const Spacer(),
            _buildSignUpText(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Method to create the heading
  Widget _buildHeading() {
    return const Text(
      'Welcome Back',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Method to create a custom button
  Widget _buildCustomButton(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.blueAccent],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  // Method to create the "or log in with" text
  Widget _buildOrSignInWithText() {
    return const Center(
      child: Text('or log in with'),
    );
  }

  // Method to create "Don't have an account? Sign Up" text
  Widget _buildSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: () {
            // Add Sign-Up navigation logic here
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
