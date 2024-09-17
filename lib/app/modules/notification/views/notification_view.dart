import 'package:flutter/material.dart';
import 'package:fluxstore/config/app_colors.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the controller via GetX
    final NotificationController controller = Get.put(NotificationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Obx(
              () => _buildSwitchListTile(
                title: 'Show notifications',
                subtitle: 'Receive push notifications for new messages',
                value: controller.showNotifications.value,
                onChanged: (value) {
                  controller.toggleShowNotifications(value);
                },
              ),
            ),
            Obx(
              () => _buildSwitchListTile(
                title: 'Notification sounds',
                subtitle: 'Play sound for new messages',
                value: controller.notificationSounds.value,
                onChanged: (value) {
                  controller.toggleNotificationSounds(value);
                },
              ),
            ),
            Obx(
              () => _buildSwitchListTile(
                title: 'Lock screen notifications',
                subtitle: 'Allow notification on the lock screen',
                value: controller.lockScreenNotifications.value,
                onChanged: (value) {
                  controller.toggleLockScreenNotifications(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      activeColor: AppColors.WHITE_COLOR,
      activeTrackColor: AppColors.DARK_LIGHTER_WHITE_COLOR,
      contentPadding: const EdgeInsets.all(10),
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          )),
      subtitle: Text(subtitle,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
          )),
      value: value,
      onChanged: onChanged,
    );
  }
}
