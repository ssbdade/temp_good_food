import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/data/data_bases_data.dart';
import 'package:temp_good_food/app/models/database_model.dart';
import 'package:temp_good_food/app/utils/app_gap.dart';
import 'package:temp_good_food/app/utils/app_style.dart';

import '../../drawer/views/panl.dart';

class DataTableView extends StatefulWidget {
  DataTableView({
    super.key,
    required this.callBack,
    required this.updateStatus,
    required this.data,
    required this.isExpanded,
  });
  final List<DataBase> data;
  bool isExpanded;
  final Function(DataBase dataBase, int index) callBack;
  final Function(DataBase dataBase, int index) updateStatus;

  @override
  State<DataTableView> createState() => _DataTableViewState();
}

class _DataTableViewState extends State<DataTableView> {
  @override
  Widget build(BuildContext context) {
    // return DataTable(
    //   border: TableBorder(
    //     verticalInside: BorderSide(
    //       width: 1,
    //       color: Colors.grey.withOpacity(0.5),
    //       style: BorderStyle.solid,
    //     ),
    //   ),
    //   dividerThickness: 1,
    //   columns: dataColumn,
    //   headingRowHeight: 80,
    //   rows: List.generate(
    //       DataBasesData.dataBasesData.length,
    //       (index) => DataRow(
    //             cells: List.generate(data[index].genList().length + 2, (i) {
    //               if (i == 0) {
    //                 return DataCell(Center(
    //                   child: SizedBox(
    //                     child: Text(
    //                       data[index].genList()[0],
    //                       maxLines: 2,
    //                       overflow: TextOverflow.ellipsis,
    //                     ),
    //                   ),
    //                 ));
    //               } else if (i == 1) {
    //                 return DataCell(Center(
    //                   child: SizedBox(
    //                     child: Text(
    //                       data[index].genList()[1],
    //                       maxLines: 2,
    //                       overflow: TextOverflow.ellipsis,
    //                       style: TextStyle(
    //                         color: data[index].isActive ? Colors.blue : Colors.black,
    //                       ),
    //                     ),
    //                   ),
    //                 ));
    //               } else if (2 <= i && i <= 10) {
    //                 return DataCell(Center(
    //                   child: SizedBox(
    //                     width: 100,
    //                     child: Text(
    //                       data[index].genList()[i],
    //                       maxLines: 2,
    //                       overflow: TextOverflow.ellipsis,
    //                     ),
    //                   ),
    //                 ));
    //               } else if (i == 11) {
    //                 return DataCell(
    //                   CupertinoSwitch(
    //                     value: data[index].isActive,
    //                     onChanged: (onChanged) {
    //                       // data[index].changeStatus(onChanged);
    //                       // setState(() {});
    //                     },
    //                   ),
    //                 );
    //               } else {
    //                 return DataCell(
    //                   Center(
    //                       child: GestureDetector(
    //                           onTap: () {
    //                             showDialog(
    //                                 context: context,
    //                                 builder: (_) {
    //                                   return AlertDialog(
    //                                     title: const Text('Delete Row?'),
    //                                     content: const Text('Are you sure to detele this row?'),
    //                                     actions: [
    //                                       GestureDetector(
    //                                         onTap: () {
    //                                           Get.back();
    //                                         },
    //                                         child: const Text(
    //                                           'NO',
    //                                           style: TextStyle(
    //                                             color: Color(0xFF6200EE),
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       GestureDetector(
    //                                         onTap: () {
    //                                           // DataBasesData.dataBasesData.remove(DataBasesData.dataBasesData[index]);
    //                                           // // setState(() {});
    //                                           // Get.back();
    //                                         },
    //                                         child: const Text(
    //                                           'YES',
    //                                           style: TextStyle(
    //                                             color: Color(0xFF6200EE),
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   );
    //                                 });
    //                           },
    //                           child: const Icon(
    //                             Icons.delete,
    //                             color: Colors.red,
    //                           ))),
    //                 );
    //               }
    //             }),
    //           )),
    // );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: widget.data.map(
          (e) {
            return Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: AppExpansionTile(
                  onExpansionChanged: (value) {
                    widget.isExpanded = value;
                    setState(() {});
                  },
                  initiallyExpanded: widget.isExpanded,
                  title: const Text('THÔNG TIN BÁO CÁO'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 10,
                            decoration: BoxDecoration(
                                border: Border(top: BorderSide(color: Colors.black.withOpacity(0.1), width: 1))),
                          ),
                          WidgetTitle(
                            title: 'ID',
                            data: e.id,
                          ),
                          AppGap.h10,
                          WidgetTitle(
                            title: 'DB Name',
                            data: e.dbName,
                            dataColor: Color(0xff4D7FFD),
                          ),
                          AppGap.h10,
                          WidgetTitle(
                            title: 'DB ID',
                            data: e.dbId,
                          ),
                          AppGap.h10,
                          WidgetTitle(
                            title: 'DB Role	',
                            data: e.dbRole,
                          ),
                          AppGap.h10,
                          WidgetTitle(
                            title: 'DB Version',
                            data: e.dbVersion,
                          ),
                          AppGap.h10,
                          WidgetTitle(
                            title: 'Khách Hàng	',
                            data: e.customer,
                            dataColor: Color(0xff4D7FFD),
                          ),
                          AppGap.h10,
                          WidgetTitle(
                            title: 'Threshold Asm Disk Group',
                            data: e.asmDisk.toString(),
                          ),
                          AppGap.h10,
                          WidgetTitle(
                            title: 'Threshold Fra',
                            data: e.fra.toString(),
                          ),
                          AppGap.h10,
                          WidgetTitle(
                            title: 'Threshold OS Mount Point	',
                            data: e.mountPoint.toString(),
                          ),
                          AppGap.h10,
                          WidgetTitle(
                            title: 'Threshold Tablespace',
                            data: e.tableSpace.toString(),
                          ),
                          AppGap.h10,
                          WidgetTitle(
                            title: 'Ghi Chú',
                            data: e.ghiChu,
                          ),
                          AppGap.h10,
                          Row(
                            children: [
                              Text(
                                'Trạng thái: ',
                                style: baseStyle.copyWith(fontSize: 16),
                              ),
                              Spacer(),
                              Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  activeColor: Color(0xff03A9F4),
                                  value: e.isActive,
                                  onChanged: (onChanged) {
                                    widget.updateStatus.call(e, widget.data.indexOf(e));
                                    setState(() {
                                      e.isActive = onChanged;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          AppGap.h10,
                          Row(
                            children: [
                              Text(
                                'Hành động: ',
                                style: baseStyle.copyWith(fontSize: 16),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  widget.callBack.call(e, widget.data.indexOf(e));
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class WidgetTitle extends StatelessWidget {
  const WidgetTitle({
    Key? key,
    required this.title,
    required this.data,
    this.dataColor,
  }) : super(key: key);
  final String title;
  final String data;
  final Color? dataColor;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${title}: ',
            style: baseStyle.copyWith(fontSize: 16),
          ),
          TextSpan(
            text: data,
            style: titleStyle.copyWith(
              color: dataColor ?? Colors.black87,
            ),
          )
        ],
      ),
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
