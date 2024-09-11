import 'package:flutter/material.dart';
import 'package:fluxstore/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:fluxstore/app/routes/app_pages.dart';
import 'package:fluxstore/config/app_colors.dart';
import 'package:fluxstore/config/app_images.dart';
import 'package:fluxstore/widgets/customized_reuse_button.dart';
import 'package:fluxstore/widgets/customized_textfield.dart';
import 'package:get/get.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

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
            const CustomTextField(label: 'Enter your Email'),
            const SizedBox(height: 20),
            _buildPasswordFieldWithForgotPassword(),
            const SizedBox(height: 30),
            _buildGetStartedButton(),
            const SizedBox(height: 20),
            _buildOrSignInWithText(),
            const SizedBox(height: 20),
            _buildSocialIcons(),
            const Spacer(), // Push the sign-up text to the bottom
            Container(
              margin: const EdgeInsets.only(bottom: 20), // 5% of screen height
              child: _buildSignUpText(),
            ),
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
          'Log into',
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

  // Method to create the "Forgot Password?" text
  Widget _buildPasswordFieldWithForgotPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextField(
          label: 'Enter your Password',
          isPassword: true,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Get.toNamed(Routes.FORGOT_PASSWORD);
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: AppColors.BLACK_COLOR,
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Method to create the "or log in with" text
  Widget _buildOrSignInWithText() {
    return const Center(
      child: Text('or log in with'),
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

  // Method to create "Don't have an account? Sign Up" text
  Widget _buildSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.SIGN_UP);
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

  Widget _buildGetStartedButton() {
    return CustomButton(
      text: 'Log In',
      onTap: () {
        Get.offAllNamed(Routes.HOME);
      },
      backgroundColor: Colors.black, // Set the background color to black
      width: 300, // Set a specific width for the button (optional)
    );
  }
}
