import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_page_controller.dart';

class CustomerPageView extends GetView<CustomerPageController> {
  const CustomerPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomerPageView'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CustomerPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
