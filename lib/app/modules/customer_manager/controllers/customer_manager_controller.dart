import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/customer_data.dart';
import 'package:temp_good_food/app/models/customer.dart';
import 'package:temp_good_food/app/modules/drawer/views/panl.dart';

class CustomerManagerController extends GetxController {
  //TODO: Implement CustomerManagerController
  List<Customer> data = CustomersData.customers.obs;


  TextEditingController sortNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController noteController = TextEditingController();


  RxBool isActive = true.obs;

  RxBool isExpanded = false.obs;

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
}
