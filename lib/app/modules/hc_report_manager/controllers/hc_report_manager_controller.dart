import 'package:get/get.dart';
import 'package:temp_good_food/app/data/hc_report_data.dart';
import 'package:temp_good_food/app/models/hc_report.dart';

class HcReportManagerController extends GetxController {
  //TODO: Implement HcReportManagerController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  List<HealCheckReport> data = HealCheckReports.hcReports.obs;


}
