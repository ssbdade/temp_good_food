import 'package:get/get.dart';

import '../controllers/customer_page_controller.dart';

class CustomerPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CustomerPageController());
  }
}
