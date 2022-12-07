import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/widgets/bar_chart.dart';
import 'package:temp_good_food/app/modules/widgets/switch_button.dart';
import 'package:temp_good_food/app/utils/constants/app_image.dart';
import 'package:temp_good_food/app/utils/constants/text_const.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

import '../controllers/stats_controller.dart';

class StatsView extends GetView<StatsController> {
  const StatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, top: 48.h, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppImage.menu),
                  SvgPicture.asset(AppImage.bell),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                KeyConst.statistics,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),





              const SwitchButton(),

              SizedBox(
                height: 40.h,
              ),
              Text(
                KeyConst.dailyNewCases,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w500,

                ),
              ),









              //Chart
              SizedBox(
                height: 24.h,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor('#AEA1E5').withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 100,
                        offset: const Offset(0, 50), // changes position of shadow
                      ),
                    ]
                  ),
                  child: const AppBarChart()),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}



List<String> tab = [
  'Total',
  'Today',
  'Yesterday',
];

