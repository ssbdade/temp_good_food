import 'package:temp_good_food/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController

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

  toLogin() {
    Routes.toNamed(Routes.LOGIN);
  }
}
