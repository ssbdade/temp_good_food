import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
                  onTap: () {
                    controller.onSearchCustomer.value = true;
                    controller.searchCustomer(controller.searchCtrl.text);
                  },
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
                                  await controller.getListDatabase(customerId: e.customerId!, page: 0, size: 20);
                                  controller.customerModel.value = e;
                                  controller.listCustomerSuggest.value.clear();
                                  controller.listCustomerSuggest.clear();
                                  controller.listCustomerSuggest.refresh();
                                  FocusManager.instance.primaryFocus?.unfocus();
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
                padding: EdgeInsets.only(bottom: 48),
                child: Obx(
                  () => controller.listData.isNotEmpty
                      ? DataTableView(
                          isExpanded: true,
                          updateStatus: (database, index) {
                            controller.updateStatusDatabase(database);
                          },
                          callBack: (dataBase, index) {
                            showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Material(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 48,
                                        horizontal: 16,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Cảnh báo',
                                            style: titleStyle.copyWith(fontSize: 20),
                                          ),
                                          AppGap.h16,
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Bạn có chắc muốn xóa Database: ',
                                                  style: baseStyle.copyWith(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '${dataBase.dbName} ',
                                                  style: baseStyle.copyWith(
                                                    fontSize: 18,
                                                    color: Color(0xff03A9F4),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'ra khỏi hệ thống giám sát ?',
                                                  style: baseStyle.copyWith(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          AppGap.h16,
                                          Text(
                                            'Lưu ý: hành động này sẽ không thể hoàn tác',
                                            style: titleStyle.copyWith(fontSize: 14),
                                          ),
                                          AppGap.h16,
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    "Hủy thao tác",
                                                    style: titleStyle.copyWith(
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              AppGap.w24,
                                              Expanded(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    controller.deleteDatabase(dataBase, index);
                                                  },
                                                  child: Text("Xóa"),
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          data: controller.listData.value,
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => controller.customerModel.value.customerId == null
            ? Container()
            : FloatingActionButton(
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
                                  SizedBox(
                                    height: 16,
                                  ),
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
                                    textInputType: TextInputType.number,
                                    textEditingController: controller.dbIdController,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                    compulsory: true,
                                    hintText: 'DB TYPE:',
                                    textEditingController: controller.dbTypeController,
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
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Khách hàng',
                                          style: baseStyle.copyWith(fontSize: 16),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            color: Color(0xffDDDDDD),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            '${controller.customerModel.value.customerName}',
                                            style: baseStyle,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                    compulsory: false,
                                    textEditingController: controller.asmDiskController,
                                    hintText: 'Threshold Asm Disk Group: ',
                                    textInputType: TextInputType.number,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                    compulsory: false,
                                    textEditingController: controller.fraController,
                                    hintText: 'Threshold Fra: ',
                                    textInputType: TextInputType.number,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                    compulsory: false,
                                    textEditingController: controller.mountPointController,
                                    hintText: 'Threshold OS Mount Point: ',
                                    textInputType: TextInputType.number,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                    compulsory: false,
                                    textEditingController: controller.tableSpaceController,
                                    hintText: 'Threshold TableSpace: ',
                                    textInputType: TextInputType.number,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(
                                    () => CheckboxListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      checkColor: Colors.white,
                                      activeColor: Colors.blue,
                                      title: Text(
                                        'Cluster',
                                        style: baseStyle.copyWith(fontSize: 16),
                                      ),
                                      value: controller.isClustered.value,
                                      onChanged: (value) {
                                        controller.isClustered.value = value ?? false;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(
                                    () => CheckboxListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      checkColor: Colors.white,
                                      activeColor: Colors.blue,
                                      title: Text(
                                        'Standby',
                                        style: baseStyle.copyWith(fontSize: 16),
                                      ),
                                      value: controller.hasStandby.value,
                                      onChanged: (value) {
                                        controller.hasStandby.value = value ?? false;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AppTextField(
                                    compulsory: false,
                                    hintText: 'Ghi chú: ',
                                    textEditingController: controller.noteController,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            GestureDetector(
                              onTap: () {
                                if (controller.formKey.currentState!.validate()) {
                                  controller.addNewDatabase();
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
      ),
    );
  }
}
