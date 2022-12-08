import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/alert/views/alert_view.dart';
import 'package:temp_good_food/app/modules/modules.dart';
import 'package:temp_good_food/app/modules/news/views/news_view.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  var pageIndex = 0.obs;

  final List pages = [
    const HomePageView(),
    const StatsView(),
    const NewsView(),
    const AlertView(),
  ];


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

  void onUpdate() {
    super.update();
  }



}
