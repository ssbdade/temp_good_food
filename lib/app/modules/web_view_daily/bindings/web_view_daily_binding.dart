import 'package:get/get.dart';

import '../controllers/web_view_daily_controller.dart';

class WebViewDailyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebViewDailyController>(
      () => WebViewDailyController(),
    );
  }
}
