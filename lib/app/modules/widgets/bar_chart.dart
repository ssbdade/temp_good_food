import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

class AppBarChart extends StatelessWidget {
  const AppBarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, top: 16.h),
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
      ),
    );
  }
}

class Point {
  int x;
  double y;

  Point(this.x, this.y);

}

List<Point> data = [
  Point(0, 8.0),
  Point(1, 9.1),
  Point(2, 8.2),
  Point(3, 14.0),
  Point(4, 10.0),
  Point(5, 15.0),
];

List<BarChartGroupData> generateBarGroupData(List<Point> data) {
  List<BarChartGroupData> barGroupsGen = List.generate(data.length, (index) => BarChartGroupData(
    x: data[index].x,
    barRods: [
      BarChartRodData(
        toY: data[index].y,
        color: HexColor('#FF5959'),
      )
    ],
  ),);

  return barGroupsGen;
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
        toY: 9,
        color: HexColor('#FF5959'),
      )
    ],

  ),
  BarChartGroupData(
    x: 2,
    barRods: [
      BarChartRodData(
        toY: 8,
        color: HexColor('#FF5959'),
      )
    ],

  ),
  BarChartGroupData(
    x: 3,
    barRods: [
      BarChartRodData(
        toY: 14,
        color: HexColor('#FF5959'),
      )
    ],
  ),
  BarChartGroupData(
    x: 4,
    barRods: [
      BarChartRodData(
        toY: 10,
        color: HexColor('#FF5959'),
      )
    ],
  ),
  BarChartGroupData(
    x: 5,
    barRods: [
      BarChartRodData(
        toY: 15,
        color: HexColor('#FF5959'),
      )
    ],
  ),
  BarChartGroupData(
    x: 6,
    barRods: [
      BarChartRodData(
        toY: 17.57,
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
      reservedSize: 40.h,
      getTitlesWidget: getTitles,
    ),
  ),
  leftTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: true,
      getTitlesWidget: getVerticalTitles,
      reservedSize: 40.w,
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
    default:
      text = 'Apr ${value.toInt()}';
      break;
  }
  return SideTitleWidget(
    axisSide: AxisSide.bottom,
    space: 8.h,
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
  if (value.toInt() % 5 == 0) {
    text = '${value.toInt()}k';
  }
  else if (value.toInt() == 0) {
    text = '0';
  }
  else {
    text = '';
  }
  return SideTitleWidget(
    axisSide: AxisSide.right,
    space: 16.h,
    child: Text(text, style: style),
  );
}
