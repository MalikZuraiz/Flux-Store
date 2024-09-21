import 'package:flutter/material.dart';
import 'package:fluxstore/app/routes/app_pages.dart';
import 'package:fluxstore/config/app_colors.dart';
import 'package:fluxstore/config/app_images.dart';
import 'package:fluxstore/widgets/cutomized_drawer.dart';
import 'package:get/get.dart';
import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WishlistScreen();
  }
}

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(
        activeMenuItem: 'My Profile',
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Wishlist',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,

        // leading: IconButton(
        //   icon: const Icon(Icons.menu, color: Colors.black),
        //   onPressed: () {
        //     //scaffold is not working from here

        //     Scaffold.of(context).openDrawer();
        //   },
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Get.toNamed(Routes.NOTIFICATION);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Tabs Container
          Container(
            height: 35,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(2),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(0),
              ),
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              tabs: const [
                Tab(text: 'All Items'),
                Tab(text: 'Boards'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAllItemsTab(),
                _buildBoardsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Updated All Items Tab
  Widget _buildAllItemsTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.60, // Adjusted aspect ratio for taller images
      ),
      itemCount: 6, // number of items in the wishlist
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    image: const DecorationImage(
                      image: AssetImage(
                          AppImages.PLACEHOLDER_IMAGE), // Product image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: AppColors.WHITE_COLOR,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.favorite_sharp,
                          size: 18, color: Colors.red)),
                ),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Product Name',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('\$50.00',
                  style: TextStyle(
                      color: AppColors.BLACK_COLOR,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: AppColors.DARK_GREY_COLOR, size: 12),
                  Icon(Icons.star, color: AppColors.DARK_GREY_COLOR, size: 12),
                  Icon(Icons.star, color: AppColors.DARK_GREY_COLOR, size: 12),
                  Icon(Icons.star, color: AppColors.DARK_GREY_COLOR, size: 12),
                  Icon(Icons.star_border, size: 12),
                  SizedBox(width: 5),
                  Text('(4.5)',
                      style: TextStyle(
                          color: AppColors.DARK_GREY_COLOR, fontSize: 12)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

// Updated Boards Tab
  Widget _buildBoardsTab() {
    return ListView.builder(
      itemCount: 5, // number of boards
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align left
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    // 1st Column: Portrait Image
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        AppImages.BOARD_IMAGE1,
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                    const SizedBox(width: 4),
                    // 1st Column: Portrait Image
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        AppImages.BOARD_IMAGE1,
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                    const SizedBox(width: 4),
                    // 2nd Column: Two stacked images (upper image bigger)
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset(
                            AppImages.BOARD_IMAGE2,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 4),
                          Image.asset(
                            AppImages.BOARD_IMAGE3,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    // 3rd Column: Two stacked images (lower image bigger)
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset(
                            AppImages.BOARD_IMAGE3,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 4),
                          Image.asset(
                            AppImages.BOARD_IMAGE2,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Adjusting subtitle text alignment under title
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Going Out Outfits',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 5),
                      Text('36 Items',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      SizedBox(height: 5),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, size: 14),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(
                height: 2,
                thickness: 0.2,
                color: AppColors.DARK_LIGHTER_GREY_COLOR,
              )
            ],
          ),
        );
      },
    );
  }
}
