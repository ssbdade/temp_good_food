import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/data/customer_data.dart';
import 'package:temp_good_food/app/modules/widgets/date_range_picker.dart';
import 'package:temp_good_food/app/modules/widgets/dropdownfield.dart';

import '../../../data/databases_list.dart';
import '../controllers/grew_report_controller.dart';

class GrewReportView extends GetView<GrewReportController> {
  const GrewReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GrewReportView'),
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
                  dropdownValue: controller.selectedCustomer!.value == ""
                      ? null
                      : controller.selectedCustomer!.value,
                  validate: (value) =>
                  value == null ? 'Xin hãy chọn khách hàng' : null),
              SizedBox(
                height: 20,
              ),
              DropDownField(
                  hint: 'Database',
                  items: dataBases,
                  dropdownValue: controller.selectedDataBase!.value == ""
                      ? null
                      : controller.selectedDataBase!.value,
                  validate: (value) =>
                  value == null ? 'Xin hãy chọn Database' : null),
              SizedBox(
                height: 20,
              ),
              DropDownField(
                  hint: 'Instance',
                  items: items,
                  dropdownValue: controller.selectedInstance!.value == ""
                      ? null
                      : controller.selectedInstance!.value,
                  validate: (value) =>
                  value == null ? 'Xin hãy chọn Instance' : null),
              SizedBox(
                height: 20,
              ),
              DropDownField(
                  hint: 'Thông số',
                  items: items,
                  dropdownValue: controller.selectedStats!.value == ""
                      ? null
                      : controller.selectedStats!.value,
                  validate: (value) =>
                  value == null ? 'Xin hãy chọn Thông số' : null),
              SizedBox(
                height: 20,
              ),
              DropDownField(
                  hint: 'Phân vùng',
                  items: items,
                  dropdownValue: controller.selectedStats!.value == ""
                      ? null
                      : controller.selectedStats!.value,
                  validate: (value) =>
                  value == null ? 'Xin hãy chọn Phân vùng' : null),
              SizedBox(
                height: 20,
              ),
              DateRange(
                startDate: controller.startDate.value,
                endDate: controller.endDate.value,
              ),
              SizedBox(
                height: 20,
              ),
          GestureDetector(
            onTap: () {
              if (controller.formKey.currentState!.validate()) {

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
                    width: 1,
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
                )),)
            ],
          ),
        ),
      )
    );
  }
}


final List<String> users = List.generate(CustomersData.customers.length,
        (index) => CustomersData.customers[index].name);

final List<String> dataBases =
List.generate(appDataBases.length, (index) => appDataBases[index]['name']);

final List<String> items = List.generate(5, (index) => '${index+1}');
