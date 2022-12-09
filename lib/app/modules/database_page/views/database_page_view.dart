
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/data/data_bases_data.dart';
import 'package:temp_good_food/app/models/database_model.dart';
import 'package:temp_good_food/app/modules/widgets/app_text_field.dart';
import 'package:temp_good_food/app/modules/widgets/data_table.dart';

import '../controllers/database_page_controller.dart';

class DatabasePageView extends GetView<DatabasePageController> {
  const DatabasePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>DatabasePageController());
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GetBuilder<DatabasePageController>(
          builder: (context) {
            return DataTableView(
              data: controller.data,
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            showDialog(
                context: context, builder: (_) {
               return AlertDialog(
                 title: const Text('Add Database'),
                 content: SingleChildScrollView(
                   child: Column(
                     children: [
                       AppTextField(
                         hintText: 'DB Name:',
                         textEditingController: controller.dbNameController,
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       AppTextField(
                         hintText: 'DB ID:',
                         textEditingController: controller.dbIdController,
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       AppTextField(
                         textEditingController: controller.dbRoleController,
                         hintText: 'DB Role:',
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       AppTextField(
                         textEditingController: controller.dbVersionController,
                         hintText: 'DB Version:',
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       AppTextField(
                         textEditingController: controller.customerController,
                         hintText: 'Khách Hàng:',
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       AppTextField(
                         textEditingController: controller.asmDiskController,
                         hintText: 'Threshold Asm Disk Group:',
                         textInputType: TextInputType.number,
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       AppTextField(
                         textEditingController: controller.fraController,
                         hintText: 'Threshold Fra:',
                         textInputType: TextInputType.number,
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       AppTextField(
                         textEditingController: controller.mountPointController,
                         hintText: 'Threshold OS Mount Point:',
                         textInputType: TextInputType.number,
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       AppTextField(
                         textEditingController: controller.tableSpaceController,
                         hintText: 'Threshold TableSpace:',
                         textInputType: TextInputType.number,
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       AppTextField(
                         hintText: 'Ghi chú:',
                         textEditingController: controller.noteController,
                       ),
                       SizedBox(
                         height: 10,
                       ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const SizedBox(
                         width: 100,
                         child: Text('Trạng Thái:',
                           maxLines: 3,
                           style: TextStyle(
                             fontSize: 15,
                           ),
                         ),
                       ),
                       Obx(() => CupertinoSwitch(
                           value: controller.isActive.value,
                           onChanged: (onChanged) {
                             controller.isActive.value = onChanged;
                           })),
                     ],
                   ),
                     ],
                   ),
                 ),
                 actions: [
                   GestureDetector(
                     onTap: () {
                       DataBasesData.dataBasesData.add(
                         DataBase(
                             id: (DataBasesData.dataBasesData.length + 1).toString(),
                             dbName: controller.dbNameController.text,
                             dbId: controller.dbIdController.text,
                             dbRole: controller.dbRoleController.text,
                             dbVersion: controller.dbVersionController.text,
                             customer: controller.customerController.text,
                             asmDisk: int.parse(controller.asmDiskController.text),
                             fra: int.parse(controller.fraController.text),
                             mountPoint: int.parse(controller.mountPointController.text),
                             tableSpace: int.parse(controller.tableSpaceController.text),
                             ghiChu: controller.noteController.text,
                             isActive: controller.isActive.value)
                       );
                       print('add');
                       print(controller.isActive.value);
                       controller.clear();
                       controller.update();
                       Get.back();
                     },
                     child: const Text('YES',
                       style: TextStyle(
                         color: Color(0xFF6200EE),
                       ),
                     ),
                   ),
                   GestureDetector(
                     onTap: () {
                      Get.back();
                     },
                     child: const Text('CANCEL',
                       style: TextStyle(
                         color: Color(0xFF6200EE),
                       ),
                     ),
                   ),
                 ],
               );
            });
          },
          child: const Icon(
            Icons.add,
          ),
      ),
    );
  }
}






