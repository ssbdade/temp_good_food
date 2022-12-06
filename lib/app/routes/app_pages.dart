import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/modules.dart';
import 'package:temp_good_food/app/modules/stats/bindings/stats_binding.dart';
import 'package:temp_good_food/app/modules/stats/views/stats_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.STATS;

  static final List<GetPage> routes = [
    GetPage(
        name: INITIAL,
        page: () => const StatsView(),
    binding: StatsBinding())
  ];
}