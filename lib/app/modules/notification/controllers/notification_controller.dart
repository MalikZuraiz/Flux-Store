import 'package:get/get.dart';

class NotificationController extends GetxController {
  // Reactive state variables
  RxBool showNotifications = true.obs;
  RxBool notificationSounds = true.obs;
  RxBool lockScreenNotifications = false.obs;

  // You can add any additional logic for these variables, e.g., saving to preferences
  void toggleShowNotifications(bool value) {
    showNotifications.value = value;
  }

  void toggleNotificationSounds(bool value) {
    notificationSounds.value = value;
  }

  void toggleLockScreenNotifications(bool value) {
    lockScreenNotifications.value = value;
  }
}
