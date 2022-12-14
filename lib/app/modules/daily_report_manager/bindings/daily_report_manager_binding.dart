import 'package:get/get.dart';

import '../controllers/daily_report_manager_controller.dart';

class DailyReportManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyReportManagerController>(
      () => DailyReportManagerController(),
    );
  }
}
