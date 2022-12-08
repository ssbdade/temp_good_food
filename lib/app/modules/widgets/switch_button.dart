import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temp_good_food/app/modules/stats/views/mycountry_stats.dart';
import 'package:temp_good_food/app/modules/stats/views/stats_view.dart';
import 'package:temp_good_food/app/modules/widgets/text_tab.dart';
import 'package:temp_good_food/app/utils/common/common.dart';
import 'package:temp_good_food/app/utils/constants/text_const.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

import '../stats/views/global_stats.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({Key? key, this.page}) : super(key: key);

  final List<Widget>? page;


  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        ),

        value ? CountryStatsView() : GlobalStatsView(),
      ],
    );
  }
}
