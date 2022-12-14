import 'package:get/get.dart';
import 'package:temp_good_food/app/data/customer_data.dart';

import '../../../models/services.dart';

class ServiceManagerController extends GetxController {
  //TODO: Implement ServiceManagerController

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

  List<Service> data = CustomersData.customers[0].services;

}