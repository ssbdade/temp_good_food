import 'package:temp_good_food/app/utils/constants/app_image.dart';
import 'package:temp_good_food/app/utils/constants/text_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../utils/common/common.dart';
import '../../common/common.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
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
                  height: 250,
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
                            controller.toLogin();
                          },
                          child: Text(
                            KeyConst.logIn,
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
                  Text(KeyConst.signUpTitle,
                    style: TextStyle(
                      fontSize: size(26),
                      color: Theme.of(context).colorScheme.primary,
                    ),
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
                  SizedBox(
                    height: height(20),
                  ),
                  AppButton(
                    height: height(12),
                    buttonTitle: KeyConst.createAccount,
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
