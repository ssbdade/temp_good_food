
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
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
      backgroundColor: HexColor('#E5E5E5'),
      body: Padding(
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
            SwitchButton(

            ),
            SizedBox(
              height: 50,
            ),
            Container(
              color: AppColors.white,
              height: 192.h,
              width: 327.w,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: HexColor('#DFE3F2'),
                      dashArray: [5, 3],
                    ),
                  ),
                  maxY: 21,
                  minY: -1,
                  groupsSpace: 20,
                  barTouchData: BarTouchData(
                    enabled: true,
                  ),
                  barGroups: barGroups,
                  borderData: FlBorderData(show: false),
                  titlesData: titlesData,
                  alignment: BarChartAlignment.spaceAround,
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<BarChartGroupData> get barGroups => [
  BarChartGroupData(
    x: 0,
    barRods: [
      BarChartRodData(
        toY: 8,
        color: HexColor('#FF5959'),
      )
    ],

  ),
  BarChartGroupData(
    x: 1,
    barRods: [
      BarChartRodData(
        toY: 10,
        color: HexColor('#FF5959'),
      )
    ],

  ),
  BarChartGroupData(
    x: 2,
    barRods: [
      BarChartRodData(
        toY: 14,
        color: HexColor('#FF5959'),
      )
    ],

  ),
  BarChartGroupData(
    x: 3,
    barRods: [
      BarChartRodData(
        toY: 15,
        color: HexColor('#FF5959'),
      )
    ],
  ),
  BarChartGroupData(
    x: 4,
    barRods: [
      BarChartRodData(
        toY: 13,
        color: HexColor('#FF5959'),
      )
    ],
  ),
  BarChartGroupData(
    x: 5,
    barRods: [
      BarChartRodData(
        toY: 10,
        color: HexColor('#FF5959'),
      )
    ],
  ),
  BarChartGroupData(
    x: 6,
    barRods: [
      BarChartRodData(
        toY: 16,
        color: HexColor('#FF5959'),
      )
    ],
  ),
];


FlTitlesData get titlesData => FlTitlesData(
  show: true,
  bottomTitles: AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 30,
      getTitlesWidget: getTitles,
    ),
  ),
  leftTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: true,
    getTitlesWidget: getVerticalTitles,
      reservedSize: 30,
    ),
  ),
  topTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  ),
  rightTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  ),
);

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.normal,
    fontSize: 11,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'Apr 1';
      break;
    case 1:
      text = 'Apr 2';
      break;
    case 2:
      text = 'Apr 3';
      break;
    case 3:
      text = 'Apr 4';
      break;
    case 4:
      text = 'Apr 5';
      break;
    case 5:
      text = 'Apr 6';
      break;
    case 6:
      text = 'Apr 7';
      break;
    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}

Widget getVerticalTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.normal,
    fontSize: 11,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0';
      break;
    case 5:
      text = '5k';
      break;
    case 10:
      text = '10k';
      break;
    case 15:
      text = '15k';
      break;
    case 20:
      text = '20k';
      break;
    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}