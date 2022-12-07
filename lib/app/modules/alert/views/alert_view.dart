import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/alert_controller.dart';

class AlertView extends GetView<AlertController> {
  const AlertView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AlertView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
