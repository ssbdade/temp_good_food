import 'package:get/get.dart';
import 'package:temp_good_food/app/models/country_cases.dart';
import 'package:temp_good_food/app/models/global_case.dart';
import 'package:intl/intl.dart';

class StatsController extends GetxController {
  //TODO: Implement StatsController

  RxBool switchValue = false.obs;

  CountryCase countryCase = CountryCase(
    affectedAmount: 33685,
    deathAmount: 962,
    recoveredAmount: 1797,
    activeAmount: 30125,
    seriousAmount: 870,
  );

  GlobalCase globalCase = GlobalCase(
    affectedAmount: 336851,
    deathAmount: 9620,
    recoveredAmount: 17977,
    activeAmount: 301251,
    seriousAmount: 8702,
  );

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


  var formatter = NumberFormat('###,000');
}
