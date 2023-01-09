import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/data_bases_data.dart';
import 'package:temp_good_food/app/data/repository/database_repository/database_repository.dart';
import 'package:temp_good_food/app/data/repository/database_repository/database_response.dart';
import 'package:temp_good_food/app/data/repository/request.dart';
import 'package:temp_good_food/app/models/database_model.dart';

import '../../../data/repository/customer_repo/customer_repo.dart';
import '../../../models/customer.dart';

class DatabasePageController extends GetxController {
  //TODO: Implement DatabasePageController
  TextEditingController searchCtrl = TextEditingController();

  RxInt pageIndex = 0.obs;

  RxBool isActive = true.obs;

  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;
  // call API
  int page = 0;
  final listDatabase = List<Content>.empty(growable: true).obs;
  final listData = List<DataBase>.empty(growable: true).obs;
  final listCustomerSuggest = List<CustomerModel>.empty(growable: true).obs;
  final customerModel = CustomerModel().obs;
  final onSearchCustomer = false.obs;
  Timer? delaySearch;
  final text = ''.obs;
  @override
  void onInit() async {
    // await getListDatabase(page: page, size: 10);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  TextEditingController dbNameController = TextEditingController();
  TextEditingController dbIdController = TextEditingController();
  TextEditingController dbTypeController = TextEditingController();
  TextEditingController dbRoleController = TextEditingController();
  TextEditingController dbVersionController = TextEditingController();
  TextEditingController customerController = TextEditingController();
  TextEditingController asmDiskController = TextEditingController();
  TextEditingController fraController = TextEditingController();
  TextEditingController mountPointController = TextEditingController();
  TextEditingController tableSpaceController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  final isClustered = false.obs;
  final hasStandby = false.obs;
  // List<DataBase> data = DataBasesData.dataBasesData;

  clear() {
    dbNameController.clear();
    dbIdController.clear();
    dbRoleController.clear();
    dbVersionController.clear();
    customerController.clear();
    asmDiskController.clear();
    fraController.clear();
    mountPointController.clear();
    tableSpaceController.clear();
    noteController.clear();
  }

  Future<void> getListDatabase({required int customerId, required int page, required int size}) async {
    final response = await DatabaseRepository.instance.getListDatabase(
      customerId: customerId,
      page: page,
      size: size,
    );
    listDatabase.value = response.data?.content ?? [];

    listData.clear();
    listData.value.clear();
    listDatabase.forEach(
      (element) {
        listData.add(
          DataBase(
              id: element.databaseId.toString(),
              dbName: element.dbName ?? '',
              dbId: element.dbId.toString(),
              dbRole: element.dbRole.toString(),
              dbVersion: element.dbVersion.toString(),
              customer: element.customer?.customerName ?? '',
              asmDisk: element.thresholdAsmDiskGroup!.toInt(),
              fra: element.thresholdFra!.toInt(),
              mountPoint: element.thresholdOSMountPoint!.toInt(),
              tableSpace: element.thresholdTablespace!.toInt(),
              ghiChu: element.description ?? '',
              isActive: element.active!),
        );
      },
    );
    inspect(listData.value);
  }

  Future<void> searchCustomer(String name) async {
    if (delaySearch?.isActive ?? false) delaySearch?.cancel();
    delaySearch = Timer(Duration(milliseconds: 500), () {
      getUser(name: name);
    });
  }

  Future<void> getUser({String? name}) async {
    final response = await CustomerRepo.instance.userRequest(
      data: {
        'keyword': name,
        "page": 0,
        "size": 30,
      },
    );
    if (response.data == null) {
    } else {
      // data = List<CustomerModel>.from(response.data!["content"].map((x) => CustomerModel.fromJson(x)));
      logger.d(response.data);
      listCustomerSuggest.value = customerModelFromJson(response.data!);
    }
  }

  Future<void> updateStatusDatabase(DataBase dataBase) async {
    final response = await DatabaseRepository.instance.updateStatusDB(
      int.parse(dataBase.id),
      dataBase.isActive,
    );
    if (response.errorModel == null) {
      Get.defaultDialog(
        titlePadding: EdgeInsets.symmetric(vertical: 8),
        title: "Thông báo",
        middleText: "Cập nhật trạng thái thành công",
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.black),
        middleTextStyle: TextStyle(color: Colors.black),
      );
    }
  }

  Future<void> deleteDatabase(DataBase dataBase, int index) async {
    final response = await DatabaseRepository.instance.deleteDatabase(
      int.parse(dataBase.id),
    );
    if (response.errorModel == null) {
      listData.removeAt(index);
      listData.refresh();
      Get.back();
      Get.defaultDialog(
        titlePadding: EdgeInsets.symmetric(vertical: 8),
        title: "Thông báo",
        middleText: "Xóa database thành công",
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.black),
        middleTextStyle: TextStyle(color: Colors.red),
      );
    }
  }

  Future<void> addNewDatabase() async {
    Map<String, dynamic> data = {
      "customerId": customerModel.value.customerId,
      "dbId": int.parse(dbIdController.text.trim()),
      "dbName": dbNameController.text,
      "dbRole": dbRoleController.text,
      "dbType": dbTypeController.text,
      "dbVersion": dbVersionController.text,
      "description": noteController.text,
      "hasStandby": hasStandby.value,
      "isClustered": isClustered.value,
      "thresholdAsmDiskGroup": asmDiskController.text == '' ? 0 : int.parse(asmDiskController.text),
      "thresholdFra": fraController.text == '' ? 0 : int.parse(fraController.text),
      "thresholdOSMountPoint": mountPointController.text == '' ? 0 : int.parse(mountPointController.text),
      "thresholdTablespace": tableSpaceController.text == '' ? 0 : int.parse(tableSpaceController.text),
    };
    final response = await DatabaseRepository.instance.addDatabase(data);
    if (response.errorModel == null) {
      Get.back();
      await getListDatabase(
        customerId: customerModel.value.customerId!,
        page: page,
        size: 50,
      );
      Get.defaultDialog(
        titlePadding: EdgeInsets.symmetric(vertical: 8),
        title: "Thông báo",
        middleText: "Thêm database thành công",
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.black),
        middleTextStyle: TextStyle(color: Colors.blue),
      );
    }
  }
}
