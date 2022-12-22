import 'package:get/get.dart';

import '../controllers/hc_report_manager_controller.dart';

class HcReportManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HcReportManagerController>(
      () => HcReportManagerController(),
    );
  }
}
