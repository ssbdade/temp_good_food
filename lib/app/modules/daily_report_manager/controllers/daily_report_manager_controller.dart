import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/daily_report_data.dart';
import 'package:temp_good_food/app/models/dailycheck_report.dart';
import 'package:temp_good_food/app/modules/drawer/views/panl.dart';

class DailyReportManagerController extends GetxController {
  //TODO: Implement DailyReportManagerController

  List<DailyReport> data = DailyReports.dailyReports.obs;

}
