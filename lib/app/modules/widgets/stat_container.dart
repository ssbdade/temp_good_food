import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

import '../../utils/common/screen_util.dart';

Widget statsContainer(
    {
      String? title,
      String? amount,
      double? radius,
      double? height,
      Color? color,
      TextStyle? titleStyle,
      TextStyle? amountStyle,
      BuildContext? context,
    }

    ) {
  title = title ?? " ";
  height = height ?? 100.h;
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
