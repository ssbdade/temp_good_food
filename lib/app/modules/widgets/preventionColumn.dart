import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget preventionColumn({
  String? title,
  Widget? image,
  BuildContext? context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      image!,
      SizedBox(
        height: 12.h,
      ),
      SizedBox(
        width: 90.w,
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: Theme.of(context!).textTheme.subtitle2!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}