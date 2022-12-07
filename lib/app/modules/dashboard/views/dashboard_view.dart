import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/utils/constants/app_image.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>  controller.pages[controller.pageIndex.value]),
      bottomNavigationBar: SizedBox(
        height: 64.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx( () =>
              GestureDetector(
                onTap: () {
                  controller.pageIndex.value = 0;
                },
                child: Container(
                  height: 52.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    color: controller.pageIndex.value == 0 ?
                        AppColors.blue : null,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.w, top: 6.h, right: 6.w, bottom: 22.h),
                    child: SvgPicture.asset(AppImage.homeIcon,
                      color: controller.pageIndex.value == 0 ?
                          AppColors.white : AppColors.grayBottomNav,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.pageIndex.value = 1;
                },
                child: Container(
                  height: 52.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    color: controller.pageIndex.value == 1 ?
                    AppColors.blue : null,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.w, top: 6.h, right: 6.w, bottom: 22.h),
                    child: SvgPicture.asset(AppImage.statsIcon,
                      color: controller.pageIndex.value == 1 ?
                      AppColors.white : AppColors.grayBottomNav,
                    ),
                  ),
                ),
              ),
            ),
            Obx(() =>  GestureDetector(
                onTap: () {
                  controller.pageIndex.value = 2;
                },
                child: Container(
                  height: 52.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    color: controller.pageIndex.value == 2 ?
                    AppColors.blue : null,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.w, top: 6.h, right: 6.w, bottom: 22.h),
                    child: SvgPicture.asset(AppImage.news,
                      color: controller.pageIndex.value == 2 ?
                      AppColors.white : AppColors.grayBottomNav,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
                  () => GestureDetector(
                onTap: () {
                  controller.pageIndex.value = 3;
                  controller.update();
                },
                child: Container(
                  height: 52.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    color: controller.pageIndex.value == 3 ?
                    AppColors.blue : null,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.w, top: 6.h, right: 6.w, bottom: 22.h),
                    child: SvgPicture.asset(AppImage.alert,
                      color: controller.pageIndex.value == 3 ?
                      AppColors.white : AppColors.grayBottomNav,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
