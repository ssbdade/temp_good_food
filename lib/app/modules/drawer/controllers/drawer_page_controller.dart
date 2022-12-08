import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/customer_page/views/customer_page_view.dart';
import 'package:temp_good_food/app/modules/database_page/views/database_page_view.dart';

class DrawerPageController extends GetxController {
  //TODO: Implement DrawerController

  RxInt index = 0.obs;

  onTapDrawerItem(int pageIndex) {
    index.value = pageIndex;
    Get.back();
  }

  List<Widget> pages = [
    const CustomerPageView(),
    const DatabasePageView(),
  ];


}
