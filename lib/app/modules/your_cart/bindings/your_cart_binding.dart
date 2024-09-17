import 'package:get/get.dart';

import '../controllers/your_cart_controller.dart';

class YourCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourCartController>(
      () => YourCartController(),
    );
  }
}
