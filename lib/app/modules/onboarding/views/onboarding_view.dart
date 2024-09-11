import 'package:flutter/material.dart';
import 'package:fluxstore/app/routes/app_pages.dart';
import 'package:fluxstore/config/app_colors.dart';
import 'package:fluxstore/config/app_images.dart';
import 'package:fluxstore/config/app_text_style.dart';
import 'package:fluxstore/widgets/customized_reuse_button.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({super.key});

  @override
  final OnboardingController controller = Get.put(OnboardingController());

  // List of images from the AppImages file
  final List<String> images = [
    AppImages.ONBOARD1_IMAGE,
    AppImages.ONBOARD2_IMAGE,
    AppImages.ONBOARD3_IMAGE,
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Bottom background container with black color (#464447)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.4, // 40% height for the black section
            child: Container(
              color: const Color(0xFF464447),
            ),
          ),

          // Upper white part of the screen (60%)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.6, // 60% height for the white section
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() {
                    return Column(
                      children: [
                        SizedBox(height: screenHeight * 0.12),
                        Text(
                          controller.headings[controller.currentIndex.value],
                          style: AppTextStyles.labelLargeMedium.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: AppColors.BLACK_COLOR),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller.subheadings[controller.currentIndex.value],
                          style: AppTextStyles.labelSmallRegular.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.BLACK_COLOR),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),

          // Main content container for carousel, dots, and button
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.25), // Spacer for upper part

                // Carousel with custom height (70% on white, 30% on black)
                Expanded(
                  child: PageView.builder(
                    onPageChanged: controller.updateIndex,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40.0),
                        child: Container(
                          height:
                              screenHeight * 0.6, // Adjust height for carousel
                          decoration: BoxDecoration(
                            color: const Color(
                                0xFFE7E8E9), // Carousel background color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 40),

                // Dots indicator
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(images.length, (index) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentIndex.value == index
                              ? Colors.white
                              : Colors.grey,
                        ),
                      );
                    }),
                  );
                }),

                const SizedBox(height: 20),

                // Custom Button for "Shopping now"
                CustomButton(
                  text: 'Shopping now',
                  onTap: () {
                    Get.offAllNamed(Routes.SIGN_UP);
                  },
                ),

                SizedBox(
                    height: screenHeight * 0.1), // 20% space below the button
              ],
            ),
          ),
        ],
      ),
    );
  }
}
