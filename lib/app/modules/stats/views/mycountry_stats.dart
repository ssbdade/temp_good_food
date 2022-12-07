import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/stats/views/stats_view.dart';
import 'package:temp_good_food/app/modules/widgets/stat_container.dart';
import 'package:temp_good_food/app/modules/widgets/text_tab.dart';
import 'package:temp_good_food/app/utils/common/common.dart';
import 'package:temp_good_food/app/utils/constants/text_const.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

import '../controllers/stats_controller.dart';

class CountryStatsView extends GetView<StatsController> {
  const CountryStatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(StatsController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.h,
        ),
        TextTab(
          tab: tab,
        ),
        SizedBox(
          height: 24.h,
        ),
        Row(
          children: [
            Expanded(
              child: statsContainer(
                  context: context,
                  color: AppColors.yellow,
                  title: KeyConst.affected,
                  amount: controller.formatter.format(controller.countryCase.affectedAmount),
                  amountStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: AppColors.white,
                    fontSize: size(24),
                    fontWeight: FontWeight.w600,
                  )
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(child: statsContainer(
                context: context,
                color: AppColors.red,
                title: KeyConst.death,
                amount: controller.formatter.format(controller.countryCase.deathAmount),
                amountStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: AppColors.white,
                  fontSize: size(24),
                  fontWeight: FontWeight.w600,
                )
            ),),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            Expanded(
              child: statsContainer(
                context: context,
                color: AppColors.green,
                title: KeyConst.recovered,
                amount: controller.formatter.format(controller.countryCase.recoveredAmount),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: statsContainer(
                context: context,
                color: AppColors.blueAccent,
                title: KeyConst.active,
                amount: controller.formatter.format(controller.countryCase.activeAmount),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(child: statsContainer(
              context: context,
              color: AppColors.purple,
              title: KeyConst.serious,
              amount: controller.formatter.format(controller.countryCase.seriousAmount),
            ),),
          ],
        ),
      ],
    );
  }
}


