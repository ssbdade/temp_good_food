import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:temp_good_food/app/data/data_bases_data.dart';
import 'package:temp_good_food/app/models/database_model.dart';
import 'package:temp_good_food/app/modules/drawer/views/panl.dart';
import 'package:temp_good_food/app/modules/widgets/app_text_field.dart';
import 'package:temp_good_food/app/modules/database_page/views/data_table.dart';
import 'package:temp_good_food/app/utils/app_gap.dart';

import '../../../utils/app_style.dart';
import '../controllers/database_page_controller.dart';

class DatabasePageView extends GetView<DatabasePageController> {
  const DatabasePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DatabasePageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QUẢN LÝ DATABASES',
          style: titleStyle.copyWith(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: baseColor,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          controller.listCustomerSuggest.clear();
          inspect(controller.listData);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppGap.h16,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: TextFormField(
                  controller: controller.searchCtrl,
                  onChanged: (value) {
                    controller.onSearchCustomer.value = true;
                    controller.searchCustomer(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Nhap ten khach hang',
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blue.shade500,
                      ),
                    ),
                  ),
                ),
              ),
              AppGap.h8,
              Obx(
                () => controller.listCustomerSuggest.isNotEmpty
                    ? Wrap(
                        direction: Axis.vertical,
                        children: controller.listCustomerSuggest.value
                            .map(
                              (e) => InkWell(
                                onTap: () async {
                                  controller.searchCtrl.text = e.customerName ?? '';
                                  await controller.getListDatabase(customerId: e.customerId, page: 0, size: 20);
                                  controller.customerModel.value = e;
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  controller.listCustomerSuggest.clear();
                                  controller.listCustomerSuggest.value.clear();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(),
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Remix.user_3_fill,
                                            size: 14,
                                          ),
                                          AppGap.w16,
                                          Text(
                                            e.customerName ?? '',
                                            style: baseStyle.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Remix.mail_check_line,
                                            size: 14,
                                          ),
                                          AppGap.w16,
                                          Text(
                                            e.email ?? '',
                                            style: baseStyle.copyWith(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      )
                    : Container(),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 12),
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => controller.listData.isNotEmpty
                      ? DataTableView(
                          data: controller.listData.value,
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: const Text('Add Database'),
                  content: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          AppTextField(
                            hintText: 'DB Name:',
                            compulsory: true,
                            textEditingController: controller.dbNameController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            compulsory: true,
                            hintText: 'DB ID:',
                            textEditingController: controller.dbIdController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            compulsory: false,
                            textEditingController: controller.dbRoleController,
                            hintText: 'DB Role:',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            compulsory: false,
                            textEditingController: controller.dbVersionController,
                            hintText: 'DB Version:',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            compulsory: true,
                            textEditingController: controller.customerController,
                            hintText: 'Khách Hàng:',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            compulsory: false,
                            textEditingController: controller.asmDiskController,
                            hintText: 'Threshold Asm Disk Group:',
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            compulsory: false,
                            textEditingController: controller.fraController,
                            hintText: 'Threshold Fra:',
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            compulsory: false,
                            textEditingController: controller.mountPointController,
                            hintText: 'Threshold OS Mount Point:',
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            compulsory: false,
                            textEditingController: controller.tableSpaceController,
                            hintText: 'Threshold TableSpace:',
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            compulsory: false,
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
                                child: Text(
                                  'Trạng Thái:',
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
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          print(1);
                          DataBasesData.dataBasesData.add(DataBase(
                              id: (DataBasesData.dataBasesData.length + 1).toString(),
                              dbName: controller.dbNameController.text,
                              dbId: controller.dbIdController.text,
                              dbRole: controller.dbRoleController.text,
                              dbVersion: controller.dbVersionController.text,
                              customer: controller.customerController.text,
                              asmDisk: controller.asmDiskController.text.isEmpty
                                  ? 0
                                  : int.parse(controller.asmDiskController.text),
                              fra: controller.fraController.text.isEmpty ? 0 : int.parse(controller.fraController.text),
                              mountPoint: controller.mountPointController.text.isEmpty
                                  ? 0
                                  : int.parse(controller.mountPointController.text),
                              tableSpace: controller.tableSpaceController.text.isEmpty
                                  ? 0
                                  : int.parse(controller.tableSpaceController.text),
                              ghiChu: controller.noteController.text,
                              isActive: controller.isActive.value));
                          Get.back();
                          controller.clear();
                          controller.update();
                        }
                        print('add');
                        print(controller.isActive.value);
                      },
                      child: const Text(
                        'YES',
                        style: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Text(
                        'CANCEL',
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
