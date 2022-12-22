import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temp_good_food/app/routes/app_pages.dart';
import 'package:temp_good_food/app/utils/app_gap.dart';
import 'package:temp_good_food/app/utils/app_style.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGap.h48,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'DATABASE',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.racingSansOne(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      'ADMINISTRATOR',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.racingSansOne(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  AppGap.h48,
                  Text(
                    'Tên đăng nhập',
                    style: baseStyle,
                  ),
                  AppGap.h12,
                  TextFormField(
                    controller: controller.userNameCtrl,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.blue.shade200,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.blue.shade500,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (value) {},
                  ),
                  AppGap.h18,
                  Text(
                    'Mật khẩu',
                    style: baseStyle,
                  ),
                  AppGap.h12,
                  TextFormField(
                    controller: controller.passwordCtrl,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.blue.shade200,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.blue.shade500,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (value) {},
                  ),
                  AppGap.h32,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.DRAWER);
                      },
                      child: const Text(
                        'Đăng nhập',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff203E8E),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        textStyle: baseStyle.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  AppGap.h16,
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: baseColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Đăng ký',
                        style: baseStyle.copyWith(
                          color: baseColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  AppGap.h16,
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Quên mật khẩu',
                        style: baseStyle.copyWith(
                          color: baseColor,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
