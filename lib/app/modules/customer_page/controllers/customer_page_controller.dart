import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/repository/customer_repo/customer_repo.dart';
import 'package:temp_good_food/app/data/users_data.dart';
import 'package:temp_good_food/app/models/user_model.dart';

import '../../../data/repository/user_repository/user_repository.dart';

class CustomerPageController extends GetxController {
  //TODO: Implement CustomerPageController

  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  final listUserResponse = ListUserResponse().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await getListUser();
    super.onReady();
  }

  RxBool isActive = true.obs;

  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  RxString? selectedValue = 'USER'.obs;

  List<User> data = UsersData.listUser;
  Future<void> getListUser() async {
    final response = await UserRepository.instance.getUser(page: 0, size: 20);
    if (response.errorModel != null) {
      print('loi');
    } else {
      listUserResponse.value = response.data ?? ListUserResponse();
    }
  }

  clear() {
    usernameController.clear();
    fullNameController.clear();
    roleController.clear();
  }
}
