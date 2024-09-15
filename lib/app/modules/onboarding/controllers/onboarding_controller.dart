import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  // Headings and subheadings for the slides
  final List<String> headings = [
    "Discover something new",
    "Update trendy outfit",
    "Explore your true style",
  ];

  final List<String> subheadings = [
    "Special new arrivals just for you",
    "Favorite brands and hottest trends",
    "Relax and let us bring the style to you",
  ];

  // Update the index when a new page is swiped
  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
