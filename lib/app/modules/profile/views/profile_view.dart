import 'package:flutter/material.dart';
import 'package:fluxstore/app/routes/app_pages.dart';
import 'package:fluxstore/config/app_colors.dart';
import 'package:fluxstore/config/app_images.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      AppImages.AVATAR_ICON), // Use user's profile picture here
                ),
                const SizedBox(width: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe', // Replace with actual user name
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'john.doe@example.com', // Replace with actual user email
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.SETTING);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(0, 2), // Shadow position
                  ),
                ],
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  _buildProfileOption(
                      title: 'Address',
                      iconData: Icons.location_on_outlined,
                      callback: () {
                        Get.toNamed('/address');
                      }),
                  _buildDivider(),
                  _buildProfileOption(
                      title: 'Payment method',
                      iconData: Icons.payment_outlined,
                      callback: () {
                        Get.toNamed('/payment');
                      }),
                  _buildDivider(),
                  _buildProfileOption(
                      title: 'Voucher',
                      iconData: Icons.card_giftcard_outlined,
                      callback: () {
                        Get.toNamed('/voucher');
                      }),
                  _buildDivider(),
                  _buildProfileOption(
                      title: 'My Wishlist',
                      iconData: Icons.favorite_border,
                      callback: () {
                        Get.toNamed(Routes.WISHLIST);
                      }),
                  _buildDivider(),
                  _buildProfileOption(
                      title: 'Rate this app',
                      iconData: Icons.star_outline,
                      callback: () {
                        // Rate app action
                      }),
                  _buildDivider(),
                  _buildProfileOption(
                      title: 'Log out',
                      iconData: Icons.logout,
                      callback: () {
                        // Log out action
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption({
    required String title,
    IconData? iconData,
    required VoidCallback callback,
  }) {
    return ListTile(
      leading: iconData != null ? Icon(iconData, color: Colors.grey) : null,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        size: 18,
        color: AppColors.DARK_LIGHTER_GREY_COLOR,
      ),
      onTap: callback,
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Colors.grey,
      height: 0.8,
      thickness: 0.1,
    );
  }
}
