import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/daily_report_manager_controller.dart';
import 'daily_tile.dart';

class DailyReportManagerView extends GetView<DailyReportManagerController> {
  const DailyReportManagerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: const Text('Lịch sử báo cáo Daily Check'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: List.generate(controller.data.length, (index) => DailyTile(
            createDate: controller.data[index].createTime,
            isExpanded: true,
            customerName: controller.data[index].name,
            callBack: () {

            },
            reportTime: controller.data[index].reportTime,
          ))
        ),
      ),
    );
  }
}






