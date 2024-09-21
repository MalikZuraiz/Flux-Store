import 'package:flutter/material.dart';
import 'package:fluxstore/app/routes/app_pages.dart';
import 'package:fluxstore/config/app_images.dart';
import 'package:fluxstore/widgets/customized_reuse_button.dart';
import 'package:fluxstore/widgets/customized_textfield.dart';
import 'package:get/get.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                height: 50), // Adjust this if you need more space from the top
            _buildHeading(),
            const SizedBox(height: 30),
            const CustomTextField(label: 'Enter your name'),
            const SizedBox(height: 20),
            const CustomTextField(label: 'Enter your Email'),
            const SizedBox(height: 20),
            const CustomTextField(
                label: 'Enter your Password', isPassword: true),
            const SizedBox(height: 20),
            const CustomTextField(
                label: 'Enter your Confirm Password', isPassword: true),
            const SizedBox(height: 30),
            _buildGetStartedButton(),
            const SizedBox(height: 20),
            _buildOrSignInWithText(),
            const SizedBox(height: 20),
            _buildSocialIcons(),
            const SizedBox(height: 20),
            _buildSignInText(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Method to create the heading
  Widget _buildHeading() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'your account',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Method to create the "or sign in with" text
  Widget _buildOrSignInWithText() {
    return const Center(
      child: Text('or sign up with'),
    );
  }

  // Method to create social icons
  Widget _buildSocialIcons() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialIcon(AppImages.APPLE_ICON),
          const SizedBox(width: 20),
          _buildSocialIcon(AppImages.GOOGLE_ICON),
          const SizedBox(width: 20),
          _buildSocialIcon(AppImages.FB_ICON),
        ],
      ),
    );
  }

  // Method to create individual social icon
  Widget _buildSocialIcon(String assetPath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Image.asset(
          assetPath,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  // Method to create "Already have an account? Sign In" text
  Widget _buildSignInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account? "),
        GestureDetector(
          onTap: () {
            // Add Sign-In logic here
            Get.toNamed(Routes.SIGN_IN);
          },
          child: const Text(
            'Sign In',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGetStartedButton() {
    return Center(
      child: CustomButton(
        text: 'Sign Up',
        onTap: () {
          Get.offAllNamed(Routes.LANDING_PAGE);
        },
        backgroundColor: Colors.black, // Set the background color to black
        width: 300, // Set a specific width for the button (optional)
      ),
    );
  }
}
