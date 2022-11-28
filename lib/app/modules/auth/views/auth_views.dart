import 'package:temp_good_food/app/modules/common/common.dart';
import 'package:temp_good_food/app/utils/constants/app_image.dart';
import 'package:temp_good_food/app/utils/constants/text_const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Get.isDarkMode ? const AssetImage(AppImage.darkBg) : const AssetImage(AppImage.vanillaCake),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 300,
            decoration: BoxDecoration (
              color: Theme.of(context).colorScheme.background.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImage.chefIcon,
                    scale: 8,
                    color: Theme.of(context).copyWith().colorScheme.primary,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    KeyConst.goodFood,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).copyWith().colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      KeyConst.authDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   AppButton(
                     onTap: () {
                       controller.toSignUpPage();
                     },
                    buttonTitle: KeyConst.createAccount,
                    height: 12,
                    width: 230,
                     borderRadius: BorderRadius.circular(50),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Text(
                        KeyConst.alreadyHaveAccount,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      AppTextButton(
                        onTap: () {
                          controller.toLoginPage();
                        },
                        buttonTitle: KeyConst.logIn,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
