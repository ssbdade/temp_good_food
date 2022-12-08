import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/data_bases_data.dart';


class DatabasePageController extends GetxController {
  //TODO: Implement DatabasePageController

  RxInt pageIndex = 0.obs;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
