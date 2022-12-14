import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/service_manager/views/service_tile.dart';

import '../controllers/service_manager_controller.dart';

class ServiceManagerView extends GetView<ServiceManagerController> {
  const ServiceManagerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: const Text('ServiceManagerView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: List.generate(controller.data.length, (index) => ServiceTile(
            id: controller.data[index].id,
            name: controller.data[index].name,
            description: controller.data[index].description,
            status: controller.data[index].status,
            callBack: () {  },
            isExpanded: true,

          )),
        ),
      )
    );
  }
}
