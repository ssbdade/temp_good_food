import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

Widget buttonContainer({
  Color? color,
  String? title,
  String? icon,
  BuildContext? context,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
    decoration:
    BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.r)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(icon!),
        SizedBox(
          width: 16.w,
        ),
        Text(
          title!,
          textAlign: TextAlign.center,
          style: Theme.of(context!).textTheme.headline6!.copyWith(
            fontWeight: FontWeight.w500,
            color: white,
          ),
        ),
      ],
    ),
  );
}