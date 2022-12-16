import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_good_food/app/models/user_model.dart';


class UserTable extends StatefulWidget {
  const UserTable({Key? key, required this.data}) : super(key: key);
  final List<User> data;

  @override
  State<UserTable> createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      border: TableBorder(
        verticalInside: BorderSide(
          width: 1, color: Colors.grey.withOpacity(0.5), style: BorderStyle.solid,
        ),

      ),
      dividerThickness: 1,
      columns: dataColumn,
      headingRowHeight: 80,
      rows: List.generate(widget.data.length, (index) => DataRow(
        cells: List.generate(
            columnTitle.length,
                (i) {
              if(i == 0) {
                return DataCell(
                    Center(
                      child: SizedBox(
                        child: Text(widget.data[index].genList()[0],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: widget.data[index].isActive ? Colors.blue : Colors.black,
                          ),
                        ),
                      ),
                    ));
              }
              else if (1 <= i && i < columnTitle.length-2) {
                return DataCell(
                    Center(
                      child: SizedBox(
                        width: 100,
                        child: Text(widget.data[index].genList()[i],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ));
              }
              else if (i == columnTitle.length-2){
                return DataCell(
                  CupertinoSwitch(
                    value: widget.data[index].isActive,
                    onChanged: (onChanged) {
                      widget.data[index].changeStatus(onChanged);
                      setState(() {
                      });
                    },
                  ),
                );
              }
              else {
                return DataCell(
                  Row(
                    children: [
                      GestureDetector(child: Icon(Icons.refresh,
                        color: Colors.blue,
                      )),
                      GestureDetector(
                          onTap: () {
                            widget.data.removeAt(index);
                            setState(() {

                            });
                          },
                          child: Icon(Icons.delete,
                          color: Colors.blue,

                      )),
                    ],
                  )
                );
              }
            }),)),
    );
  }
}




List<String> columnTitle = [
  'Tên đăng nhập',
  'Tên',
  'Role',
  'Trạng thái',
  'Thao tác',

];


List<DataColumn> dataColumn = List.generate(columnTitle.length, (index) {
  if(index == 0) {
    return DataColumn(
      label: Center(
        child: SizedBox(
          width: 120,
          child: Text(
            columnTitle[index],
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
  else {
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