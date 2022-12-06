import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

class AppBarChart extends StatelessWidget {
  const AppBarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 192.h,
      width: 327.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          reverse: true,
          itemCount: 5,
            itemBuilder: (_, int index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${index*5}k',
                    style: Theme.of(context).textTheme.caption!.copyWith(

                    ),
                  ),
                ],
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 15.h,
            );
        },
        ),
      ),
    );
  }
}
