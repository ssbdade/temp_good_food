import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/databases_list.dart';

class DailyCreateReportController extends GetxController {
  //TODO: Implement DailyCreateReportController

  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  RxString? selectedValue = ''.obs;

  RxBool? selectAll = false.obs;

  void setAll(bool value) {
    for(int i = 0; i < dataBases.length; i+=1) {
      dataBases[i]['value'] = value;
    }
  }
  bool checkSetAll() {
    for(int i = 0; i < dataBases.length; i+=1) {
      if(dataBases[i]['value'] == false) {
        return false;
      }
    }
    return true;
  }

  List<dynamic> dataBases = appDataBases;


  RxString startDate = 'Chọn ngày báo cáo'.obs;
}
