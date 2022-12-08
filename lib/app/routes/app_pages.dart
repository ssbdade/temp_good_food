import 'package:get/get.dart';

import '../modules/customer_page/bindings/customer_page_binding.dart';
import '../modules/customer_page/views/customer_page_view.dart';
import '../modules/database_page/bindings/database_page_binding.dart';
import '../modules/database_page/views/database_page_view.dart';
import '../modules/drawer/bindings/drawer_binding.dart';
import '../modules/drawer/views/drawer_view.dart';

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
  ];
}
