import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/utils/common/common.dart';
import 'package:temp_good_food/app/utils/constants/app_image.dart';

import '../controllers/home_controller.dart';

class HomePageView extends GetView<HomeController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Covid-19',
                  style: TextStyle(
                    fontSize: size(24),
                    color: Color(0xff0D1333),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: 40.h,
                  width: 116.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: const Color(0xffEBF1FF),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 136.w, top: 16.h),
                  height: 104.h,
                  width: 327.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      gradient: const LinearGradient(
                          begin: Alignment(1, 1),
                          end: Alignment(-1.7, 0),
                          colors: [Color(0xff56549E), Color(0xffAEA1E5)])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Do your own test!',
                        style: TextStyle(
                          fontSize: size(18),
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Follow the instructions to do your own test.',
                        style: TextStyle(
                          fontSize: size(14),
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: -12.h,
                    left: 8.w,
                    child: Image.asset(
                      AppImage.girl,
                      height: 116.h,
                    )),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Are you feeling sick?',
              style: TextStyle(
                fontSize: size(24),
                color: const Color(0xff0D1333),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.',
              style: TextStyle(
                fontSize: size(14),
                color: const Color(0xff61688B),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonContainer(
                  color: Colors.red,
                  title: 'Call Now',
                  icon: AppImage.phone,
                ),
                buttonContainer(
                  color: Colors.blue,
                  title: 'Send SMS',
                  icon: AppImage.message,
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Prevention',
              style: TextStyle(
                fontSize: size(20),
                color: const Color(0xff0D1333),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                preventionColumn(
                  image: Image.asset(
                    AppImage.img1,
                    height: 90.h,
                  ),
                  title: 'Avoid close contact',
                ),
                preventionColumn(
                  image: Image.asset(
                    AppImage.img2,
                    height: 90.h,
                  ),
                  title: 'Clean your hands often',
                ),
                preventionColumn(
                  image: Image.asset(
                    AppImage.img3,
                    height: 90.h,
                  ),
                  title: 'Wear a facemask',
                ),
              ],
            ),
            SizedBox(
              height: 34.h,
            ),
            bottomNavBar(),
          ],
        ),
      ),
    );
  }
}

Widget buttonContainer({
  Color? color,
  String? title,
  String? icon,
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
          width: width(16),
        ),
        Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: size(16),
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget preventionColumn({
  String? title,
  Widget? image,
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
          style: TextStyle(
            fontSize: size(14),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}

Widget bottomNavBar() {
  int selectedItem = 0;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () {
          selectedItem = 0;
        },
        child: Container(
          height: 52.h,
          width: 36.h,
          decoration: BoxDecoration(
              color: selectedItem == 0 ? Color(0xff4C79FF) : Colors.white,
              borderRadius: BorderRadius.circular(50.r)
          ),
        ),
      ),
      InkWell(
        onTap: () {
          selectedItem = 1;
        },
        child: Container(
          height: 52.h,
          width: 36.h,
          decoration: BoxDecoration(
              color: selectedItem == 1 ? Color(0xff4C79FF) : Colors.white,
              borderRadius: BorderRadius.circular(50.r)
          ),
        ),
      ),
      InkWell(
        onTap: () {
          selectedItem = 2;
        },
        child: Container(
          height: 52.h,
          width: 36.h,
          decoration: BoxDecoration(
              color: selectedItem == 2 ? Color(0xff4C79FF) : Colors.white,
              borderRadius: BorderRadius.circular(50.r)
          ),
        ),
      ),
      InkWell(
        onTap: () {
          selectedItem = 3;
        },
        child: Container(
          height: 52.h,
          width: 36.h,
          decoration: BoxDecoration(
              color: selectedItem == 3 ? Color(0xff4C79FF) : Colors.white,
              borderRadius: BorderRadius.circular(50.r)
          ),
        ),
      ),
    ],
  );
}
