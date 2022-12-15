import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/hc_report_manager/views/heal_tile.dart';

import '../controllers/hc_report_manager_controller.dart';

class HcReportManagerView extends GetView<HcReportManagerController> {
  const HcReportManagerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: const Text('HcReportManagerView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Obx(
            () => Column(
              children: List.generate(controller.data.length, (index) => HealTile(
                createDate: controller.data[index].createTime,
                isExpanded: true,
                customerName: controller.data[index].name,
                databaseName: controller.data[index].dataBase,
                callBack: () {
                  controller.data.removeAt(index);
                },
                reportTime: controller.data[index].reportTime,
              ))
          ),
        ),
      ),
    );
  }
}
