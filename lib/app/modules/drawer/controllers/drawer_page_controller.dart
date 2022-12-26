import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/customer_page/views/customer_page_view.dart';
import 'package:temp_good_food/app/modules/database_page/views/database_page_view.dart';
import 'package:temp_good_food/app/modules/drawer/views/drawer_view.dart';
import 'package:temp_good_food/app/routes/app_pages.dart';

class DrawerPageController extends GetxController {
  //TODO: Implement DrawerController

  RxInt index = 0.obs;
  onTapDrawerItem(int pageIndex) {
    index.value = pageIndex;
    // Get.back();
  }

  RxInt tileIndex = 0.obs;

  List<Widget> pages = [
    const CustomerPageView(),
    const DatabasePageView(),
  ];

  RxInt selectedIndex = (-1).obs;

  RxList<int> selected = [-1, -1].obs;
}
