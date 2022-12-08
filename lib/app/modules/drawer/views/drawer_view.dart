import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/drawer/controllers/drawer_page_controller.dart';

class DrawerView extends GetView<DrawerPageController> {
  const DrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.pages[controller.index.value].toString())),
        centerTitle: true,
      ),
      drawer: Drawer(
        child:  ListView(
          children: [
            ListTile(
              title: const Text(
                'Customer page',
              ),
              onTap: () {
                controller.onTapDrawerItem(0);
              },
            ),
            ListTile(
              title: const Text(
                'Database page',
              ),
              onTap: () {
                controller.onTapDrawerItem(1);
              },
            ),
          ],
        ),
      ),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
