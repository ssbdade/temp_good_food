import 'package:temp_good_food/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement SplashController
  toAuthPage() async {
    Routes.off(Routes.AUTH, arguments: []);
  }

  toLoginPage() async {
    Routes.toNamed(Routes.LOGIN, arguments: []);
  }
  toSignUpPage() {
    Routes.toNamed(Routes.SIGNUP);
  }

}
