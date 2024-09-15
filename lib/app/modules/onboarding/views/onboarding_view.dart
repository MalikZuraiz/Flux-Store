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
          // Bottom black background (40% of the screen)
          _buildBottomBlackContainer(screenHeight),

          // Top white section (60% of the screen)
          _buildTopWhiteSection(screenHeight),

          // Main content with carousel, dots, and button
          _buildMainContent(screenHeight),
        ],
      ),
    );
  }

  Positioned _buildBottomBlackContainer(double screenHeight) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: screenHeight * 0.4,
      child: Container(
        color: const Color(0xFF464447),
      ),
    );
  }

  Positioned _buildTopWhiteSection(double screenHeight) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: screenHeight * 0.6,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.12),
            Obx(() {
              return Column(
                children: [
                  Text(
                    controller.headings[controller.currentIndex.value],
                    style: AppTextStyles.labelLargeMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: AppColors.BLACK_COLOR,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.subheadings[controller.currentIndex.value],
                    style: AppTextStyles.labelSmallRegular.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.BLACK_COLOR,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Positioned _buildMainContent(double screenHeight) {
    return Positioned.fill(
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.25), // Spacer for top section
          Expanded(
            child: PageView.builder(
              onPageChanged: controller.updateIndex,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Container(
                    height: screenHeight * 0.6,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7E8E9),
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
          _buildDotsIndicator(),
          const SizedBox(height: 20),
          _buildShoppingNowButton(),
          SizedBox(height: screenHeight * 0.1), // 20% space below the button
        ],
      ),
    );
  }

  Obx _buildDotsIndicator() {
    return Obx(() {
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
    });
  }

  CustomButton _buildShoppingNowButton() {
    return CustomButton(
      text: 'Shopping now',
      borderWidth: 2.0,
      onTap: () {
        Get.offAllNamed(Routes.SIGN_UP);
      },
    );
  }
}
