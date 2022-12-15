import 'package:get/get.dart';

import '../controllers/daily_create_report_controller.dart';

class DailyCreateReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyCreateReportController>(
      () => DailyCreateReportController(),
    );
  }
}
