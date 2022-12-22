import 'package:get/get.dart';

import '../controllers/service_manager_controller.dart';

class ServiceManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceManagerController>(
      () => ServiceManagerController(),
    );
  }
}
