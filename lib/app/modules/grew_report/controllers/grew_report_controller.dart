import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GrewReportController extends GetxController {
  //TODO: Implement GrewReportController

  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  RxString? selectedCustomer = ''.obs;

  RxString? selectedInstance = ''.obs;

  RxString? selectedStats = ''.obs;

  RxString? selectedRange = ''.obs;

  RxString? selectedDataBase = ''.obs;

  RxString startDate = 'Chọn ngày báo cáo'.obs;

  RxString endDate = 'Chọn ngày kết thúc'.obs;
}
