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
    await getListDatabase(page: page, size: 10);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  TextEditingController dbNameController = TextEditingController();
  TextEditingController dbIdController = TextEditingController();
  TextEditingController dbRoleController = TextEditingController();
  TextEditingController dbVersionController = TextEditingController();
  TextEditingController customerController = TextEditingController();
  TextEditingController asmDiskController = TextEditingController();
  TextEditingController fraController = TextEditingController();
  TextEditingController mountPointController = TextEditingController();
  TextEditingController tableSpaceController = TextEditingController();
  TextEditingController noteController = TextEditingController();

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

  Future<void> getListDatabase({int? customerId, required int page, required int size}) async {
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
}
