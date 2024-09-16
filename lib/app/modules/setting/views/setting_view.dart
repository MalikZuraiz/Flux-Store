import 'package:flutter/material.dart';
import 'package:fluxstore/app/routes/app_pages.dart';
import 'package:fluxstore/config/app_colors.dart';
import 'package:fluxstore/config/app_images.dart';
import 'package:fluxstore/widgets/customized_reuse_button.dart';
import 'package:fluxstore/widgets/customized_textfield.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
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
                    const SizedBox(width: 30),
                    const Text(
                      'Profile Setting',
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Avatar with edit icon
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(AppImages
                          .AVATAR_ICON), // Add your profile image asset here
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.BLACK_COLOR,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: AppColors.WHITE_COLOR,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                // First Name and Last Name Fields using CustomTextField
                const Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: 'First Name',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: CustomTextField(
                        label: 'Last Name',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Email Field
                const CustomTextField(
                  label: 'Email',
                ),

                const SizedBox(height: 16),

                // Gender and Phone Number Fields using CustomTextField
                const Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: 'Gender',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: CustomTextField(
                        label: 'Phone',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                // Save Changes Button
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: CustomButton(
                      text: 'Save Change',
                      onTap: () {
                        Get.toNamed(Routes.CREATE_NEW_PASSWORD);
                      },
                      backgroundColor: Colors.black, // Button color
                      width: 300, // Adjust width of the button as required
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
