import 'package:flutter/material.dart';
import 'package:fluxstore/app/modules/cart/views/cart_view.dart';
import 'package:fluxstore/app/modules/discover/views/discover_view.dart';
import 'package:fluxstore/app/modules/homepage/views/homepage_view.dart';
import 'package:fluxstore/app/modules/profile/views/profile_view.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  _LandingPageViewState createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  int _selectedIndex = 0;

  // Define a list of pages for navigation
  final List<Widget> _pages = [
    const HomepageView(), // Corresponding screens for navigation
    DiscoverView(),
    const CartView(),
    const ProfileView(),
  ];

  // Method to handle bottom navigation index change
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Load the selected page based on index
      // Add the bottom navigation bar with shadow and padding
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 12), // Padding from top
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, -2), // Shadow position
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.white, // Background of the navbar
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black, // Active state color
            unselectedItemColor: Colors.grey[400], // Inactive state color
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 30,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
