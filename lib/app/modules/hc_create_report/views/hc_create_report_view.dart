import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:temp_good_food/app/data/customer_data.dart';
import 'package:temp_good_food/app/data/databases_list.dart';
import 'package:temp_good_food/app/data/hc_report_data.dart';
import 'package:temp_good_food/app/models/hc_report.dart';
import 'package:temp_good_food/app/modules/widgets/dropdownfield.dart';

import '../controllers/hc_create_report_controller.dart';

class HcCreateReportView extends GetView<HcCreateReportController> {
  const HcCreateReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HcCreateReportView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              DropDownField(
                  hint: 'Tên Khách Hàng',
                  items: users,
                  dropdownValue: controller.selectedValue!.value == ""
                      ? null
                      : controller.selectedValue!.value,
                  validate: (value) =>
                      value == null ? 'Xin hãy chọn khách hàng' : null),
              SizedBox(
                height: 20,
              ),
              DropDownField(
                  hint: 'Database',
                  items: dataBases,
                  dropdownValue: controller.selectedValue!.value == ""
                      ? null
                      : controller.selectedValue!.value,
                  validate: (value) =>
                      value == null ? 'Xin hãy chọn Database' : null),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Container(
                  height: 60,
                  decoration: BoxDecoration(
                    // border: Border.all(BorderSide(
                    //   color: Colors.black,
                    //   width: 1.w,
                    // ),)
                    border: Border.all(
                      color: Colors.black,
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                               Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2001),
                                              lastDate: DateTime(2099))
                                          .then((value) =>
                                              controller.startDate.value =
                                                  DateFormat('dd/MM/yyyy')
                                                      .format(value!));
                                    },
                                    child: Center(
                                      child: Text(
                                        controller.startDate.value,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Icon(Icons.arrow_forward)
                            ],
                          )),
                      Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2001),
                                              lastDate: DateTime(2099))
                                          .then((value) =>
                                              controller.endDate.value =
                                                  DateFormat('dd/MM/yyyy')
                                                      .format(value!));
                                    },
                                    child: Center(
                                      child: Text(
                                        controller.endDate.value,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Icon(Icons.date_range_sharp),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    HealCheckReports.hcReports.add(HealCheckReport(
                      name: controller.selectedValue!.value,
                      createTime: controller.startDate.value,
                      reportTime: controller.endDate.value,
                      dataBase: controller.selectedDataBase!.value,
                    ));
                    showDialog(
                        context: context,
                        builder: (_) {
                          return const AlertDialog(
                            title: Text('Tạo báo cáo thành công'),
                          );
                        });
                  }
                },
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(
                        color: Colors.black,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'Tạo báo cáo',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> users = List.generate(CustomersData.customers.length,
    (index) => CustomersData.customers[index].name);

final List<String> dataBases =
    List.generate(appDataBases.length, (index) => appDataBases[index]['name']);
