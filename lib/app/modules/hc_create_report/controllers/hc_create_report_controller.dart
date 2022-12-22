import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HcCreateReportController extends GetxController {
  //TODO: Implement HcCreateReportController

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

  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  RxString? selectedValue = ''.obs;

  RxString? selectedDataBase = ''.obs;

  RxBool? selectAll = false.obs;

  RxString startDate = 'Chọn ngày báo cáo'.obs;

  RxString endDate = 'Chọn ngày kết thúc'.obs;
}
