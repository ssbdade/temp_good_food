import 'package:get/get.dart';

import '../controllers/database_page_controller.dart';

class DatabasePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatabasePageController>(
      () => DatabasePageController(),
    );
  }
}
