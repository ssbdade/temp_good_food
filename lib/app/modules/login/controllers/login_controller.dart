import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/repository/header.dart';
import 'package:temp_good_food/app/data/repository/login/login_repository.dart';
import 'package:temp_good_food/app/data/repository/request.dart';
import 'package:temp_good_food/app/utils/app_gap.dart';
import 'package:temp_good_food/app/utils/app_style.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> login() async {
    final response = await LoginRepository.instance.loginRequest(
      data: {
        "password": passwordCtrl.text,
        "username": userNameCtrl.text,
      },
      // data: {
      //   "password": "12345678",
      //   "username": "admin",
      // },
    );
    if (response.data == null) {
      Get.dialog(
        Material(
          type: MaterialType.transparency,
          child: Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Tài khoản mật khẩu không đúng, vui lòng kiểm tra lại",
                    style: titleStyle,
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 24,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      AppToken.uniqueToken = response.data?['authorization'][0];
      logger.e(response.data);
      logger.e(AppToken.uniqueToken);
      Get.toNamed(Routes.DRAWER);
    }
  }
}
