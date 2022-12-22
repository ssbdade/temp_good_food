import 'package:get/get.dart';

import '../controllers/grew_report_controller.dart';

class GrewReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GrewReportController>(
      () => GrewReportController(),
    );
  }
}
