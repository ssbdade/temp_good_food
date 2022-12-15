import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:temp_good_food/app/data/customer_data.dart';
import 'package:temp_good_food/app/data/daily_report_data.dart';
import 'package:temp_good_food/app/data/databases_list.dart';
import 'package:temp_good_food/app/models/dailycheck_report.dart';

import '../controllers/daily_create_report_controller.dart';

class DailyCreateReportView extends GetView<DailyCreateReportController> {
  const DailyCreateReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyCreateReportController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Tạo báo cáo'),
          centerTitle: true,
        ),
        body: Center(
            child: Obx(
          () => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Form(
                  key: controller.formKey,
                  child: DropdownButtonFormField2(
                    validator: (value) => value == null ? 'Xin hãy chọn khách hàng' : null,
                    hint: const Text(
                      'Tên Khách Hàng',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      errorBorder: OutlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                    ),
                    items: users
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
                    value: controller.selectedValue!.value == ""
                        ? null
                        : controller.selectedValue!.value,
                    onChanged: (value) {
                      controller.selectedValue!.value = value as String;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Danh sách Databases'.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.black)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        print(value);
                        controller.selectAll!.value = value!;
                        controller.setAll(value);
                        controller.update();
                      },
                      value: controller.selectAll!.value,
                      activeColor: const Color(0xFF6200EE),
                    ),
                    Text(
                      'SELECT ALL',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
                for (var i = 0; i < controller.dataBases.length; i += 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          print(value);
                          controller.dataBases[i]['value'] = value!;
                          if (controller.dataBases[i]['value'] == false) {
                            controller.selectAll!.value = false;
                          } else {
                            if (controller.checkSetAll()) {
                              controller.selectAll!.value = true;
                            }
                          }
                          controller.update();
                        },
                        value: controller.dataBases[i]['value'],
                        activeColor: const Color(0xFF6200EE),
                      ),
                      Text(
                        controller.dataBases[i]['name'],
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                Obx(
                  () => ListTile(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2099))
                          .then((value) => controller.startDate.value =
                              DateFormat('dd/MM/yyyy,')
                                  .add_jms()
                                  .format(value!.add(Duration(hours: 7))));
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    trailing: Icon(Icons.date_range_sharp),
                    title: Text(controller.startDate.value,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if(controller.formKey.currentState!.validate()) {
                      DailyReports.dailyReports.add(
                        DailyReport(
                          name: controller.selectedValue!.value,
                          createTime: DateFormat('dd/MM/yyyy,')
                              .add_jms()
                              .format(DateTime.now()),
                          reportTime: controller.startDate.value,
                        )
                      );
                      showDialog(
                          context: context, builder: (_) {
                            return AlertDialog(
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
                      child: Text('Tạo báo cáo',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black
                      ),
                  ),
                    )),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

final List<String> users = List.generate(CustomersData.customers.length,
    (index) => CustomersData.customers[index].name);
