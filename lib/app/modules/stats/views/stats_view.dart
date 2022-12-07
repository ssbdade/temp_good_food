import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/widgets/bar_chart.dart';
import 'package:temp_good_food/app/modules/widgets/switch_button.dart';
import 'package:temp_good_food/app/modules/widgets/text_tab.dart';
import 'package:temp_good_food/app/utils/common/common.dart';
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
                height: 24.h,
              ),
              TextTab(
                tab: tab,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statsContainer(
                    context: context,
                    color: AppColors.yellow,
                    title: KeyConst.affected,
                    amount: '336,851',
                      amountStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: AppColors.white,
                    fontSize: size(24),
                    fontWeight: FontWeight.w600,
                  )
                  ),
                  statsContainer(
                    context: context,
                    color: AppColors.red,
                    title: KeyConst.death,
                    amount: '9,620',
                    amountStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: AppColors.white,
                      fontSize: size(24),
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statsContainer(
                    width: 98.w,
                    context: context,
                    color: AppColors.green,
                    title: KeyConst.recovered,
                    amount: '17,977',
                  ),
                  statsContainer(
                    width: 98.w,
                    context: context,
                    color: AppColors.blueAccent,
                    title: KeyConst.active,
                    amount: '301,251',
                  ),
                  statsContainer(
                    width: 98.w,
                    context: context,
                    color: AppColors.purple,
                    title: KeyConst.serious,
                    amount: '8,702',
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                KeyConst.dailyNewCases,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w500,

                ),
              ),
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

Widget statsContainer(
{
  String? title,
  String? amount,
  double? radius,
  double? height,
  double? width,
  Color? color,
  TextStyle? titleStyle,
  TextStyle? amountStyle,
  BuildContext? context,
}

    ) {
  title = title ?? " ";
  height = height ?? 100.h;
  width = width ?? 155.w;
  radius = radius ?? 8.r;
  color = color ?? white;
  titleStyle = titleStyle ?? Theme.of(context!).textTheme.subtitle2!.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );
  amountStyle = amountStyle ?? Theme.of(context!).textTheme.subtitle2!.copyWith(
    color: AppColors.white,
    fontSize: size(20),
    fontWeight: FontWeight.w600,
  );


  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color,
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 12.w, top: 16.h, bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Text(
            amount ?? "0",
            style: amountStyle,
          )
        ],
      ),
    ),
  );
}





List<String> tab = [
  'Total',
  'Today',
  'Yesterday',
];

