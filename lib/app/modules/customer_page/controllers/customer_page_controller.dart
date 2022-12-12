import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/users_data.dart';
import 'package:temp_good_food/app/models/user_model.dart';

class CustomerPageController extends GetxController {
  //TODO: Implement CustomerPageController

  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController roleController = TextEditingController();


  RxBool isActive = true.obs;

  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  RxString? selectedValue = 'USER'.obs;


  List<User> data = UsersData.listUser;

  clear() {
    usernameController.clear();
    fullNameController.clear();
    roleController.clear();
  }


}
