import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/modules/widgets/app_button.dart';
import 'package:temp_good_food/app/modules/widgets/preventionColumn.dart';
import 'package:temp_good_food/app/utils/common/common.dart';
import 'package:temp_good_food/app/utils/constants/app_image.dart';
import 'package:temp_good_food/app/utils/constants/text_const.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

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
                  KeyConst.covid19,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Obx(() => DropdownButton2(
                  value: controller.dropdownValue.value,
                    icon: SvgPicture.asset(AppImage.dropdown),
                  buttonPadding: EdgeInsets.only(right: 16.w, left: 8.w),
                  buttonHeight: 40.h,
                    buttonWidth: 116.w,
                    buttonDecoration: BoxDecoration(
                      color: AppColors.gray,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    items: listItem.map((item) =>
                        DropdownMenuItem<MenuItem>(
                          value: item,
                          child: MenuItems.buildItem(item),
                        ))
                        .toList(),
                    onChanged: (MenuItem? value) {
                      print(value?.text);
                      controller.dropdownValue.value = value!;
                    }),),
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
                      gradient: LinearGradient(
                          begin: const Alignment(1, 1),
                          end: const Alignment(-1.7, 0),
                          colors: [AppColors.darkPurple, AppColors.lightPurple])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        KeyConst.doYourOwnTest,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        KeyConst.followInstruction,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: white,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
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
              KeyConst.feelingSick,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              KeyConst.help,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonContainer(
                  color: AppColors.red,
                  title: KeyConst.callNow,
                  icon: AppImage.phone,
                  context: context,
                ),
                buttonContainer(
                  color: AppColors.blue,
                  title: KeyConst.sendSMS,
                  icon: AppImage.message,
                  context: context,
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              KeyConst.prevention,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.w600,
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
                  context: context,
                  image: Image.asset(
                    AppImage.img1,
                    height: 90.h,
                  ),
                  title: KeyConst.avoidClose,
                ),
                preventionColumn(
                  context: context,
                  image: Image.asset(
                    AppImage.img2,
                    height: 90.h,
                  ),
                  title: KeyConst.cleanHand,
                ),
                preventionColumn(
                  context: context,
                  image: Image.asset(
                    AppImage.img3,
                    height: 90.h,
                  ),
                  title: KeyConst.wearMask,
                ),
              ],
            ),
            SizedBox(
              height: 34.h,
            ),
          ],
        ),
      ),
    );
  }
}

List<MenuItem> listItem = [usa, jap, fran, spn];

MenuItem usa = MenuItem(text: 'USA', icon: AppImage.usa);
MenuItem jap = MenuItem(text: 'JAP', icon: AppImage.usa);
MenuItem fran = MenuItem(text: 'FRA', icon: AppImage.usa);
MenuItem spn = MenuItem(text: 'SPN', icon: AppImage.usa);


class MenuItem {
  final String text;
  final String icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Image.asset(item.icon,
          height: 24.h,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          item.text,
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

}




