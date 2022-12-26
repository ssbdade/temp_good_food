import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/data_bases_data.dart';
import 'package:temp_good_food/app/models/database_model.dart';

class DataTableView extends StatelessWidget {
  DataTableView({
    super.key,
    required this.data,
  });
  final List<DataBase> data;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      border: TableBorder(
        verticalInside: BorderSide(
          width: 1,
          color: Colors.grey.withOpacity(0.5),
          style: BorderStyle.solid,
        ),
      ),
      dividerThickness: 1,
      columns: dataColumn,
      headingRowHeight: 80,
      rows: List.generate(
          DataBasesData.dataBasesData.length,
          (index) => DataRow(
                cells: List.generate(data[index].genList().length + 2, (i) {
                  if (i == 0) {
                    return DataCell(Center(
                      child: SizedBox(
                        child: Text(
                          data[index].genList()[0],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ));
                  } else if (i == 1) {
                    return DataCell(Center(
                      child: SizedBox(
                        child: Text(
                          data[index].genList()[1],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: data[index].isActive ? Colors.blue : Colors.black,
                          ),
                        ),
                      ),
                    ));
                  } else if (2 <= i && i <= 10) {
                    return DataCell(Center(
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          data[index].genList()[i],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ));
                  } else if (i == 11) {
                    return DataCell(
                      CupertinoSwitch(
                        value: data[index].isActive,
                        onChanged: (onChanged) {
                          // data[index].changeStatus(onChanged);
                          // setState(() {});
                        },
                      ),
                    );
                  } else {
                    return DataCell(
                      Center(
                          child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: const Text('Delete Row?'),
                                        content: const Text('Are you sure to detele this row?'),
                                        actions: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: const Text(
                                              'NO',
                                              style: TextStyle(
                                                color: Color(0xFF6200EE),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // DataBasesData.dataBasesData.remove(DataBasesData.dataBasesData[index]);
                                              // // setState(() {});
                                              // Get.back();
                                            },
                                            child: const Text(
                                              'YES',
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
                                Icons.delete,
                                color: Colors.red,
                              ))),
                    );
                  }
                }),
              )),
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
  'Threshold Table Space',
  'Ghi Chú',
  'Trạng Thái',
  'Thao Tác',
];

List<DataColumn> dataColumn = List.generate(columnTitle.length, (index) {
  if (index == 0) {
    return DataColumn(
      label: Center(
        child: SizedBox(
          width: 10,
          child: Text(
            columnTitle[index],
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  } else {
    return DataColumn(
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
    );
  }
});
