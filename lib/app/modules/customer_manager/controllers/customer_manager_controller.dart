import 'package:get/get.dart';
import 'package:temp_good_food/app/data/customer_data.dart';
import 'package:temp_good_food/app/models/customer.dart';

class CustomerManagerController extends GetxController {
  //TODO: Implement CustomerManagerController
  List<Customer> data = CustomersData.customers.obs;
}
