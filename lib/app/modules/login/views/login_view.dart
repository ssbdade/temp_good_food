import 'package:temp_good_food/app/modules/common/common.dart';
import 'package:temp_good_food/app/utils/constants/app_image.dart';
import 'package:temp_good_food/app/utils/constants/text_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../utils/common/common.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                  height: height(250),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          AppImage.veganForest,
                        ),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width(12)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                            child: SvgPicture.asset(AppImage.chevronBack,
                              height: 24,
                              color: Theme.of(context).colorScheme.background,
                            ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            controller.toSignUp();
                          },
                          child: Text(
                            KeyConst.signUp,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(40), vertical: height(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(KeyConst.welcomeBack,
                    style: TextStyle(
                      fontSize: size(26),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(KeyConst.goodFood,
                      style: TextStyle(
                        fontSize: size(26),
                        color: Theme.of(context).colorScheme.primary,
                      )
                  ),
                  SizedBox(
                    height: height(30),
                  ),
                  const AppTextField(
                    hintText: KeyConst.yourEmail,
                  ),
                  SizedBox(
                    height: height(10),
                  ),
                  const AppTextField(
                    hintText: KeyConst.password,
                  ),
                  SizedBox(
                    height: height(15),
                  ),
                  Row(
                    children: [
                      Obx(() => Transform.scale(
                        scale: 0.85,
                        child: CupertinoSwitch(
                            value: controller.remember.value,
                            onChanged: (onchange) {
                              controller.onChangeSwitch();
                            },
                          activeColor: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      const Text(
                        KeyConst.remember,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        KeyConst.forgot,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  AppButton(
                    onTap: () {
                      controller.logIn();
                    },
                    height: height(12),
                    buttonTitle: KeyConst.logIn,
                    borderRadius: BorderRadius.circular(radius(24)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
