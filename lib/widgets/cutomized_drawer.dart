import 'package:flutter/material.dart';
import 'package:fluxstore/app/routes/app_pages.dart';
import 'package:fluxstore/config/app_images.dart';
import 'package:get/get.dart'; // For navigation

class CustomDrawer extends StatefulWidget {
  final String activeMenuItem; // Menu item to be active (passed from the page)

  const CustomDrawer({super.key, required this.activeMenuItem});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late String selectedMenuItem;
  bool isDarkTheme = false; // Tracks theme toggle

  @override
  void initState() {
    super.initState();
    selectedMenuItem =
        widget.activeMenuItem; // Set the active menu item on init
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8, // 75% width
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.all(8.0), // Margin between drawer and content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile section
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(AppImages
                          .AVATAR_ICON), // Use user's profile picture here
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe', // Replace with actual user name
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'john.doe@example.com', // Replace with actual user email
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Navigation options
              _buildMenuItem('Homepage', Icons.home_outlined, Routes.HOMEPAGE),
              _buildMenuItem(
                  'Discover', Icons.search_outlined, Routes.DISCOVER),
              _buildMenuItem(
                  'My Orders', Icons.shopping_bag_outlined, Routes.CART),
              _buildMenuItem(
                  'My Profile', Icons.person_outline, Routes.PROFILE),

              const SizedBox(height: 20), // Spacer before "Other" heading
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Other',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Other menu items
              _buildMenuItem(
                  'Settings', Icons.settings_outlined, Routes.APP_SETTING),
              _buildMenuItem('Support', Icons.mail_outlined, Routes.SUPPORT),
              _buildMenuItem('About Us', Icons.info_outline, Routes.ABOUT_US),

              const Spacer(),

              // Theme toggle
              _buildThemeToggle(),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build each menu item in drawer with GetX navigation
  Widget _buildMenuItem(String title, IconData icon, String routeName) {
    bool isSelected = selectedMenuItem == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMenuItem = title;
        });
        Get.toNamed(routeName); // Navigate to the appropriate route
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[200] : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.black : Colors.grey[400]),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.black : Colors.grey[500],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build theme toggle at the bottom
  Widget _buildThemeToggle() {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isDarkTheme = !isDarkTheme;
            });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Background color for toggle
                  borderRadius: BorderRadius.circular(30), // Rounded edges
                ),
                child: ToggleButtons(
                  borderRadius:
                      BorderRadius.circular(30), // Rounded corners for toggle
                  isSelected: [!isDarkTheme, isDarkTheme],
                  fillColor: Colors.white, // Fill color for the selected button
                  selectedColor: Colors.black, // Text color for selected state
                  color: Colors.grey, // Text color for unselected state
                  renderBorder: false, // Disable borders
                  onPressed: (int index) {
                    setState(() {
                      isDarkTheme = index == 1; // Switch theme based on index
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 0.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.wb_sunny_outlined,
                            size: 15,
                            color: !isDarkTheme
                                ? Colors.black
                                : Colors.grey, // Icon color for light theme
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Light',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: !isDarkTheme
                                  ? FontWeight.bold
                                  : FontWeight.normal, // Bold when active
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 0.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.nights_stay,
                            size: 15.0,
                            color: isDarkTheme
                                ? Colors.black
                                : Colors.grey, // Icon color for dark theme
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Dark',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: isDarkTheme
                                  ? FontWeight.bold
                                  : FontWeight.normal, // Bold when active
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
