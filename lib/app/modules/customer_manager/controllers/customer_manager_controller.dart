import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/customer_data.dart';
import 'package:temp_good_food/app/data/repository/customer_repo/add_customer_repo.dart';
import 'package:temp_good_food/app/models/customer.dart';
import 'package:temp_good_food/app/modules/drawer/views/panl.dart';

import '../../../data/repository/customer_repo/customer_repo.dart';

class CustomerManagerController extends GetxController {
  //TODO: Implement CustomerManagerController
  List<CustomerModel> data = <CustomerModel>[].obs;

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await getUser();
    isLoading.value = false;
  }

  TextEditingController sortNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  RxBool isLoading = true.obs;

  RxBool isActive = true.obs;

  RxBool isExpanded = true.obs;

  final _formKey = GlobalKey<FormState>();

  final expansionTile = GlobalKey<AppExpansionTileState>();

  get formKey => _formKey;

  RxString? selectedValue = 'USER'.obs;

  clear() {
    sortNameController.clear();
    fullNameController.clear();
    emailController.clear();
    phoneController.clear();
    noteController.clear();
  }

  Future<void> getUser() async {
    final response = await CustomerRepo.instance.userRequest(
      data: {
        "page": 0,
        "size": 10,
      },
    );
    if (response.data == null) {
    } else {
      // data = List<CustomerModel>.from(response.data!["content"].map((x) => CustomerModel.fromJson(x)));
      data = customerModelFromJson(response.data!);
    }
  }

  Future<void> addCustomer() async {
    final response = await AddCustomerRepo.instance.addCustomerRequest(
      data: {
        "customerId": 1,
        "customerName": "DDee",
        "address": "Hưng Yên",
        "telephone": "0912345678",
        "email": "Lehoan04072001@gmail.com",
        "representative": "DDee",
        "description": "Test tạo user",
        "fullname": "Lê Việt Hoàn",
        "active": true
      },
    );
    if (response.data == null) {
    } else {
      // data = List<CustomerModel>.from(response.data!["content"].map((x) => CustomerModel.fromJson(x)));

    }
  }
}
