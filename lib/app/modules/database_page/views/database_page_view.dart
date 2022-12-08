import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temp_good_food/app/data/data_bases_data.dart';
import 'package:temp_good_food/app/models/database_model.dart';

import '../controllers/database_page_controller.dart';

class DatabasePageView extends GetView<DatabasePageController> {
  const DatabasePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          dividerThickness: 1,
          columns: dataColumn,
          headingRowHeight: 80,
          rows: tableRows,

        ),
      )
    );
  }
}

List<String> columnTitle = [
  'ID',
  'DB Name',
  'DB ID',
  'DB Role',
  'DB Version',
  'Khách Hàng',
  'Threshold Asm Disk Group',
  'Threshold Fra',
  'Threshold OS Mount Point',
  'Threshold Tablespace',
  'Ghi Chú',
  'Trạng Thái',
  'Thao Tác',
];

List<String> row3Data = [
  '3',
  'HFT',
  '10064564163',
  'PRIMARY DATABASE',
  '11.2.0.4.0',
  'KBSV',
  '80',
  '80',
  '80',
  '80',
  'Database FrontOffice',
  'true',
  'false',
];


List<DataColumn> dataColumn = List.generate(columnTitle.length, (index) => DataColumn(

  label: Center(
    child: SizedBox(
      width: 90,
      child: Text(
        columnTitle[index],
        maxLines: 4,
        overflow: TextOverflow.ellipsis,

      ),
    ),
  ),
),);

List<DataRow> tableRows = List.generate(DataBasesData.dataBasesData.length, (index) => DataRow(
  cells: List.generate(
      DataBasesData.dataBasesData[index].genList().length+2,
          (i) {
        if(i <= 10) {
          return DataCell(
              SizedBox(
                width: 100,
                child: Text(DataBasesData.dataBasesData[index].genList()[i],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ));
        }
        else if (i == 11) {
          return DataCell(Container(
            color: Colors.blue,
          ));
        }
        else {
          return DataCell(Container(
            color: Colors.red,
          ));
        }
      }),));


