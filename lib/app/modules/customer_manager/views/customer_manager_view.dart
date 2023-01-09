import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/models/customer.dart';
import 'package:temp_good_food/app/models/services.dart';
import 'package:temp_good_food/app/modules/widgets/app_text_field.dart';
import 'package:temp_good_food/app/utils/app_style.dart';

import '../controllers/customer_manager_controller.dart';
import 'expand_tile.dart';

class CustomerManagerView extends GetView<CustomerManagerController> {
  CustomerManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        backgroundColor: Color(0xFFE5E5E5),
        appBar: AppBar(
          title: Text(
            'Quản lý khách hàng',
            style: titleStyle.copyWith(
              fontSize: 16,
              color: Colors.white,
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          backgroundColor: baseColor,
          centerTitle: true,
        ),
        body: controller.isLoading.value
            ? Center(
                child: const CupertinoActivityIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(18),
                    child: Obx(
                      () => Column(
                        children: List.generate(
                          controller.data.length,
                          (index) => ExpandTile(
                              callBack: () {
                                print('object');
                                controller.data.removeAt(index);
                              },
                              isExpanded: controller.isExpanded.value,
                              id: controller.data[index].customerId.toString(),
                              name: controller.data[index].fullname ?? '',
                              sortName: controller.data[index].customerName ?? '',
                              email: controller.data[index].email!,
                              phone: controller.data[index].telephone!,
                              note: controller.data[index].description!,
                              isActive: controller.data[index].active!),
                        ),
                      ),
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: controller.data.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return ExpandTile(
                      //                   callBack: () {
                      //                     controller.data.removeAt(index);
                      //                   },
                      //                   isExpanded: controller.isExpanded.value,
                      //                     id: controller.data[index].id,
                      //                     name: controller.data[index].name,
                      //                     sortName: controller.data[index].sortName,
                      //                     email: controller.data[index].email,
                      //                     phone: controller.data[index].phone,
                      //                     note: controller.data[index].note,
                      //                     isActive: controller.data[index].isActive);
                      //   },
                      //
                      // )
                    )),
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
                              hintText: 'Tên Khách Hàng:',
                              compulsory: true,
                              textEditingController: controller.fullNameController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                              compulsory: false,
                              hintText: 'Tên ngắn gọn:',
                              textEditingController: controller.sortNameController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                              compulsory: true,
                              hintText: 'Email:',
                              textEditingController: controller.emailController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                              compulsory: true,
                              hintText: 'SĐT:',
                              textEditingController: controller.phoneController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                              compulsory: false,
                              hintText: 'Ghi chú:',
                              textEditingController: controller.noteController,
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
                          /// add customer
                          if (controller.formKey.currentState!.validate()) {
                            controller.addCustomer();
                            // controller.data.add(Customer(
                            //     services: <Service>[],
                            //     id: (int.parse(controller.data.last.id) + 1).toString(),
                            //     name: controller.fullNameController.text,
                            //     sortName: controller.sortNameController.text,
                            //     email: controller.emailController.text,
                            //     phone: controller.phoneController.text,
                            //     note: controller.noteController.text,
                            //     isActive: controller.isActive.value));
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
      ),
    );
  }
}
