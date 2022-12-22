import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/data_bases_data.dart';
import 'package:temp_good_food/app/models/database_model.dart';


class DatabasePageController extends GetxController {
  //TODO: Implement DatabasePageController

  RxInt pageIndex = 0.obs;

  RxBool isActive = true.obs;

  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;


  TextEditingController dbNameController = TextEditingController();
  TextEditingController dbIdController = TextEditingController();
  TextEditingController dbRoleController = TextEditingController();
  TextEditingController dbVersionController = TextEditingController();
  TextEditingController customerController = TextEditingController();
  TextEditingController asmDiskController = TextEditingController();
  TextEditingController fraController = TextEditingController();
  TextEditingController mountPointController = TextEditingController();
  TextEditingController tableSpaceController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  List<DataBase> data = DataBasesData.dataBasesData;

  clear() {
    dbNameController.clear();
    dbIdController.clear();
    dbRoleController.clear();
     dbVersionController.clear();
     customerController.clear();
     asmDiskController.clear();
     fraController.clear();
     mountPointController.clear();
     tableSpaceController.clear();
     noteController.clear();
  }


  final count = 0.obs;

}
