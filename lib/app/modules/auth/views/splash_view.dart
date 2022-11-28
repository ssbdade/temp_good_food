import 'package:temp_good_food/app/utils/constants/app_image.dart';
import 'package:temp_good_food/app/modules/common/app_button.dart';
import 'package:temp_good_food/app/utils/constants/text_const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/common/common.dart';
import '../controllers/auth_controller.dart';

class SplashView extends GetView<AuthController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Get.isDarkMode
                ? const AssetImage(AppImage.darkSplashBg)
                : const AssetImage(AppImage.lightSplashBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(
              flex: 5,
            ),
            Center(
              child: Text(
                KeyConst.goodFood,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              KeyConst.deliciouslySimple,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const Spacer(
              flex: 18,
            ),
            AppButton(
              onTap: () {
                controller.toAuthPage();
              },
              buttonTitle: KeyConst.startCooking,
              width: 275,
              height: height(15),
              borderRadius: BorderRadius.circular(24),
              buttonColor: Theme.of(context).colorScheme.primary,
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
