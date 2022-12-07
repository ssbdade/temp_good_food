import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({Key? key}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 327.w,
      decoration: BoxDecoration(
          color: AppColors.switchBg,
          borderRadius: BorderRadius.circular(50.r)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  value = true;
                  setState(() {

                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: value ? AppColors.white : null,
                  ),
                  child: const Center(
                    child: Text(
                        'My Country'
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  value = false;
                  setState(() {

                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: value ? null : AppColors.white,
                  ),
                  child: const Center(
                    child: Text(
                        'Global'
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
