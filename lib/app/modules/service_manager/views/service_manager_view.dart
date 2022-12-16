import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/models/services.dart';
import 'package:temp_good_food/app/models/user_model.dart';
import 'package:temp_good_food/app/modules/service_manager/views/service_tile.dart';
import 'package:temp_good_food/app/modules/widgets/app_text_field.dart';

import '../controllers/service_manager_controller.dart';

class ServiceManagerView extends GetView<ServiceManagerController> {
  const ServiceManagerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: const Text('ServiceManagerView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: GetBuilder<ServiceManagerController>(
          builder: (_) => Column(
              children: List.generate(controller.data.length, (index) => ServiceTile(
                id: controller.data[index].id,
                name: controller.data[index].name,
                description: controller.data[index].description,
                status: controller.data[index].status,
                callBack: () {
                  controller.data.removeAt(index);
                  controller.update();
                },
                isExpanded: true,
              ),
              )),
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
                            hintText: 'Tên dịch vụ:',
                            compulsory: true,
                            textEditingController: controller.serviceName,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppTextField(
                            compulsory: false,
                            hintText: 'Descriptions:',
                            textEditingController: controller.description,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                  flex: 2,
                                  child: Text('Trạng thái:',
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
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          print(1);
                          controller.data.add(Service(
                            id: '${int.parse(controller.data.last.id)+1}',
                              name: controller.serviceName.text,
                            description: controller.description.text,
                            status: controller.selectedValue!.value,
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

List<String> items = [
  'Hoạt động',
  'Tạm dừng'
];
