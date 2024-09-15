import 'package:flutter/material.dart';
import 'package:fluxstore/widgets/cutomized_drawer.dart';

import 'package:get/get.dart';

import '../controllers/discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  const DiscoverView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiscoverView'),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(activeMenuItem: 'Discover'),
      body: const Center(
        child: Text(
          'DiscoverView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
