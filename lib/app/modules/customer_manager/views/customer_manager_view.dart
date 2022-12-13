import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/data/customer_data.dart';

import '../controllers/customer_manager_controller.dart';
import 'expand_tile.dart';

class CustomerManagerView extends GetView<CustomerManagerController> {
  const CustomerManagerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: const Text('CustomerManagerView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Obx(() =>
             Column(
              children: List.generate(controller.data.length, (index) =>
                  ExpandTile(
                      onTap: () {
                        print(controller.data.length);
                        controller.data.removeAt(index);
                        print(controller.data.length);
                        controller.update();
                      },
                        id: controller.data[index].id,
                        name: controller.data[index].name,
                        sortName: controller.data[index].sortName,
                        email: controller.data[index].email,
                        phone: controller.data[index].phone,
                        note: controller.data[index].note,
                        isActive: controller.data[index].isActive),
              ),
            ),
          )
        ),
      )
    );
  }
}
