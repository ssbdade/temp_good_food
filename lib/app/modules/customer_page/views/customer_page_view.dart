import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/models/user_model.dart';
import 'package:temp_good_food/app/modules/customer_page/views/user_table.dart';
import 'package:temp_good_food/app/modules/widgets/app_text_field.dart';

import '../controllers/customer_page_controller.dart';

class CustomerPageView extends GetView<CustomerPageController> {
  const CustomerPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CustomerPageController());
    return Scaffold(
      body:  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GetBuilder<CustomerPageController>(builder: (context) {
          return UserTable(data: controller.data);
        },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: const Text('Add Database'),
                  content: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          AppTextField(
                            hintText: 'Tên đăng nhập:',
                            compulsory: true,
                            textEditingController: controller.usernameController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            compulsory: true,
                            hintText: 'DB ID:',
                            textEditingController: controller.fullNameController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                flex: 2,
                                  child: Text('Role:',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  )),
                              Expanded(
                                flex: 3,
                                child: Obx(
                                  () => DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      buttonDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      items: items
                                          .map((item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                          .toList(),
                                      value: controller.selectedValue!.value,
                                      onChanged: (value) {
                                        controller.selectedValue!.value = value as String;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  'Trạng Thái:',
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Obx(() => CupertinoSwitch(
                                  value: controller.isActive.value,
                                  onChanged: (onChanged) {
                                    controller.isActive.value = onChanged;
                                  })),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          print(1);
                          controller.data.add(User(
                            username: controller.usernameController.text,
                            fullName: controller.fullNameController.text,
                            role: controller.selectedValue!.value,
                            isActive: controller.isActive.value, ));
                          Get.back();
                          controller.clear();
                          controller.update();
                        }
                        print('add');
                        print(controller.isActive.value);

                      },
                      child: const Text(
                        'YES',
                        style: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                      ),
                    ),
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

final List<String> items = [
  'USER',
  'ADMIN',
];