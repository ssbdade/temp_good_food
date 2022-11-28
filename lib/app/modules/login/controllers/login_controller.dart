import 'package:temp_good_food/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool remember = false.obs;

  onChangeSwitch() {
    remember.value = !remember.value;
  }

  toSignUp() {
    Routes.toNamed(Routes.SIGNUP);
  }

  logIn() {
    Routes.toNamed(Routes.DASHBOARD);
  }
}
