import 'package:flutter/material.dart';
import 'package:fluxstore/widgets/cutomized_drawer.dart';

import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      drawer: const CustomDrawer(activeMenuItem: 'Homepage'),
      body: const Center(child: Text('Welcome to Homepage')),
    );
  }
}
