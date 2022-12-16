import 'package:get/get.dart';

import '../modules/customer_manager/bindings/customer_manager_binding.dart';
import '../modules/customer_manager/views/customer_manager_view.dart';
import '../modules/customer_page/bindings/customer_page_binding.dart';
import '../modules/customer_page/views/customer_page_view.dart';
import '../modules/daily_create_report/bindings/daily_create_report_binding.dart';
import '../modules/daily_create_report/views/daily_create_report_view.dart';
import '../modules/daily_report_manager/bindings/daily_report_manager_binding.dart';
import '../modules/daily_report_manager/views/daily_report_manager_view.dart';
import '../modules/database_page/bindings/database_page_binding.dart';
import '../modules/database_page/views/database_page_view.dart';
import '../modules/drawer/bindings/drawer_binding.dart';
import '../modules/drawer/views/drawer_view.dart';
import '../modules/grew_report/bindings/grew_report_binding.dart';
import '../modules/grew_report/views/grew_report_view.dart';
import '../modules/hc_create_report/bindings/hc_create_report_binding.dart';
import '../modules/hc_create_report/views/hc_create_report_view.dart';
import '../modules/hc_report_manager/bindings/hc_report_manager_binding.dart';
import '../modules/hc_report_manager/views/hc_report_manager_view.dart';
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
    GetPage(
      name: _Paths.DAILY_CREATE_REPORT,
      page: () => const DailyCreateReportView(),
      binding: DailyCreateReportBinding(),
    ),
    GetPage(
      name: _Paths.HC_CREATE_REPORT,
      page: () => const HcCreateReportView(),
      binding: HcCreateReportBinding(),
    ),
    GetPage(
      name: _Paths.HC_REPORT_MANAGER,
      page: () => const HcReportManagerView(),
      binding: HcReportManagerBinding(),
    ),
    GetPage(
      name: _Paths.GREW_REPORT,
      page: () => const GrewReportView(),
      binding: GrewReportBinding(),
    ),
  ];
}
