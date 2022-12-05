import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/modules.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final List<GetPage> routes = [
    GetPage(
        name: INITIAL,
        page: () => const HomePageView(),
    binding: HomeBinding())
  ];
}