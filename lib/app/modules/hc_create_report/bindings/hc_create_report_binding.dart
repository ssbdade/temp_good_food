import 'package:get/get.dart';

import '../controllers/hc_create_report_controller.dart';

class HcCreateReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HcCreateReportController>(
      () => HcCreateReportController(),
    );
  }
}
