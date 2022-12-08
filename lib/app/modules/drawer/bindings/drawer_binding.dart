import 'package:get/get.dart';

import '../controllers/drawer_page_controller.dart';

class DrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerPageController>(
      () => DrawerPageController(),
    );
  }
}
