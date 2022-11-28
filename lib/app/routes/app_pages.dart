import 'package:temp_good_food/app/modules/auth/views/auth_views.dart';
import 'package:temp_good_food/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:temp_good_food/app/modules/dashboard/views/dashboard_view.dart';
import 'package:temp_good_food/app/modules/modules.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final List<GetPage> routes = [
    GetPage(
      name: INITIAL,
      page: () => const SplashView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding(),),
    GetPage(name: Routes.SIGNUP,
        page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}