import 'package:flutter/material.dart';
import 'package:fluxstore/app/routes/app_pages.dart';
import 'package:fluxstore/config/app_colors.dart';
import 'package:fluxstore/widgets/cutomized_drawer.dart';

import 'package:get/get.dart';

import '../controllers/app_setting_controller.dart';

class AppSettingView extends GetView<AppSettingController> {
  const AppSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(activeMenuItem: 'Settings'),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          _buildSettingsItem(
            context,
            title: 'Language',
            icon: Icons.language,
            onTap: () {},
          ),
          _buildSettingsItem(
            context,
            title: 'Notification',
            icon: Icons.notifications_outlined,
            onTap: () {
              Get.toNamed(Routes.NOTIFICATION);
            },
          ),
          _buildSettingsItem(
            context,
            title: 'Terms of Use',
            icon: Icons.description_outlined,
            onTap: () {},
          ),
          _buildSettingsItem(
            context,
            title: 'Privacy Policy',
            icon: Icons.privacy_tip_outlined,
            onTap: () {},
          ),
          _buildSettingsItem(
            context,
            title: 'Chat Support',
            icon: Icons.support_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading:
              Icon(icon, size: 20, color: AppColors.DARK_LIGHTER_GREY_COLOR),
          title: Text(title,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: AppColors.BLACK_COLOR,
              )),
          trailing: const Icon(Icons.arrow_forward_ios,
              size: 14, color: AppColors.LIGHT_BLACK_COLOR),
          onTap: onTap,
        ),
        const Divider(
          height: 0.2,
          thickness: 0.2,
          color: AppColors.DARK_LIGHTER_GREY_COLOR,
        ),
      ],
    );
  }
}
