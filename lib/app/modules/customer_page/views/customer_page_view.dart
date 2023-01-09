import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:temp_good_food/app/models/user_model.dart';
import 'package:temp_good_food/app/modules/customer_page/views/user_table.dart';
import 'package:temp_good_food/app/modules/widgets/app_text_field.dart';

import '../../../utils/app_gap.dart';
import '../../../utils/app_style.dart';
import '../controllers/customer_page_controller.dart';

class CustomerPageView extends GetView<CustomerPageController> {
  const CustomerPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CustomerPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QUẢN LÝ NGƯỜI DÙNG',
          style: titleStyle.copyWith(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: baseColor,
        centerTitle: true,
      ),
      body: Container(
        child: Obx(
          () => controller.listUserResponse.value.content != null &&
                  controller.listUserResponse.value.content!.isNotEmpty
              ? Column(
                  children: [
                    AppGap.h16,
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listUserResponse.value.content?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black38,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                    border: Border(top: BorderSide(color: Colors.black.withOpacity(0.1), width: 1))),
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  const TextSpan(
                                    text: 'Tên người dùng: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: controller.listUserResponse.value.content?[index].fullName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  )
                                ]),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  const TextSpan(
                                    text: 'Role: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: controller.listUserResponse.value.content?[index].role,
                                    style: TextStyle(
                                      color: baseColor,
                                      fontSize: 14,
                                    ),
                                  )
                                ]),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Trạng thái: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Spacer(),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                        value: controller.listUserResponse.value.content?[index].active ?? false,
                                        onChanged: (onChanged) {
                                          controller.listUserResponse.value.content?[index].active = onChanged;
                                          controller.listUserResponse.refresh();
                                        }),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Thao tác: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      // widget.callBack();
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                )
              : Container(),
        ),
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
                                  child: Text(
                                    'Role:',
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
                                          .map((item) => DropdownMenuItem<String>(
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
                            isActive: controller.isActive.value,
                          ));
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
