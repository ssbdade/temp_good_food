import 'package:get/get.dart';

import '../modules/alert/bindings/alert_binding.dart';
import '../modules/alert/views/alert_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/modules.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final List<GetPage> routes = [
    GetPage(
      name: INITIAL,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePageView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.STATS,
        page: () => const StatsView(),
        binding: StatsBinding()),
    GetPage(
      name: _Paths.NEWS,
      page: () => NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.ALERT,
      page: () => const AlertView(),
      binding: AlertBinding(),
    ),

  ];
}
