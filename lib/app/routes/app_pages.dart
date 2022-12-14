import 'package:get/get.dart';

import '../modules/customer_manager/bindings/customer_manager_binding.dart';
import '../modules/customer_manager/views/customer_manager_view.dart';
import '../modules/customer_page/bindings/customer_page_binding.dart';
import '../modules/customer_page/views/customer_page_view.dart';
import '../modules/daily_report_manager/bindings/daily_report_manager_binding.dart';
import '../modules/daily_report_manager/views/daily_report_manager_view.dart';
import '../modules/database_page/bindings/database_page_binding.dart';
import '../modules/database_page/views/database_page_view.dart';
import '../modules/drawer/bindings/drawer_binding.dart';
import '../modules/drawer/views/drawer_view.dart';
import '../modules/service_manager/bindings/service_manager_binding.dart';
import '../modules/service_manager/views/service_manager_view.dart';
import '../modules/stats/bindings/stats_binding.dart';
import '../modules/stats/views/stats_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DRAWER;

  static final List<GetPage> routes = [
    GetPage(
      name: INITIAL,
      page: () => const DrawerView(),
      binding: DrawerBinding(),
    ),
    GetPage(
      name: Routes.DATABASE,
      page: () => const DatabasePageView(),
      binding: DatabasePageBinding(),
    ),
    GetPage(
      name: Routes.CUSTOMER,
      page: () => const CustomerPageView(),
      binding: CustomerPageBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_MANAGER,
      page: () => CustomerManagerView(),
      binding: CustomerManagerBinding(),
    ),
    GetPage(
      name: _Paths.STATS,
      page: () => const StatsView(),
      binding: StatsBinding(),
    ),
    GetPage(
      name: _Paths.DAILY_REPORT_MANAGER,
      page: () => const DailyReportManagerView(),
      binding: DailyReportManagerBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE_MANAGER,
      page: () => const ServiceManagerView(),
      binding: ServiceManagerBinding(),
    ),
  ];
}
