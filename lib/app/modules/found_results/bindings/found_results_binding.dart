import 'package:get/get.dart';

import '../controllers/found_results_controller.dart';

class FoundResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoundResultsController>(
      () => FoundResultsController(),
    );
  }
}
