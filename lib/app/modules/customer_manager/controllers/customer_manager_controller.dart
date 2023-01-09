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
  final data = List<CustomerModel>.empty(growable: true).obs;
  // List<CustomerModel> data = <CustomerModel>[].obs;

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await getUser();
    isLoading.value = false;
  }

  TextEditingController fullNameController = TextEditingController();
  TextEditingController sortNameController = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
      data.value = customerModelFromJson(response.data!);
    }
  }

  Future<void> addCustomer() async {
    final response = await AddCustomerRepo.instance.addCustomerRequest(
      data: {
        "customerId": 1,
        "customerName": sortNameController.text,
        "address": addressCtrl.text,
        "telephone": phoneController.text,
        "email": emailController.text,
        "representative": "Nam",
        "description": noteController.text,
        "fullname": fullNameController.text,
        "active": isActive.value
      },
    );
    if (response.data == null) {
    } else {
      // data = List<CustomerModel>.from(response.data!["content"].map((x) => CustomerModel.fromJson(x)));

    }
  }

  Future<void> removeCustomer(int index) async {
    print('object');
    data.removeAt(index);
    data.refresh();
  }
}
