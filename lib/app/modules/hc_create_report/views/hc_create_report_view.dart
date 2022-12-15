import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:temp_good_food/app/data/customer_data.dart';
import 'package:temp_good_food/app/data/databases_list.dart';
import 'package:temp_good_food/app/data/hc_report_data.dart';
import 'package:temp_good_food/app/models/hc_report.dart';

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
              DropdownButtonFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                isExpanded: true,
                validator: (value) => value == null ? 'Xin hãy chọn khách hàng' : null,
                hint: const Text(
                  'Tên Khách Hàng',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                decoration: const InputDecoration(
                    isDense: true,
                  // contentPadding: EdgeInsets.only(bottom: 20),
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
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField2(
                focusColor: Colors.transparent,

                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value == null ? 'Xin hãy chọn database' : null,
                hint: const Text(
                  'Database',
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
                items: dataBases
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
                value: controller.selectedDataBase!.value == ""
                    ? null
                    : controller.selectedDataBase!.value,
                onChanged: (value) {
                  controller.selectedDataBase!.value = value as String;
                },
              ),
              SizedBox(height: 20,),
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
                    style: const TextStyle(
                      fontSize: 14,
                    ),),
                ),
              ),
              SizedBox(height: 20,),
              Obx(
                    () => ListTile(
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2099))
                        .then((value) => controller.endDate.value =
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
                  title: Text(controller.endDate.value,
                    style: const TextStyle(
                      fontSize: 14,
                    ),),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if(controller.formKey.currentState!.validate()) {
                    HealCheckReports.hcReports.add(
                        HealCheckReport(
                          name: controller.selectedValue!.value,
                          createTime: controller.startDate.value,
                          reportTime: controller.endDate.value,
                          dataBase: controller.selectedDataBase!.value,
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
            ],
          ),
        ),

      ),
    );
  }
}

final List<String> users = List.generate(CustomersData.customers.length,
        (index) => CustomersData.customers[index].name);

final List<String> dataBases = List.generate(appDataBases.length, (index) => appDataBases[index]['name']);
