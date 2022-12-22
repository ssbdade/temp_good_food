import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temp_good_food/app/modules/drawer/views/panl.dart';


class DailyTile extends StatefulWidget {
  DailyTile(
      {Key? key,
        required this.createDate,
        required this.reportTime,
        required this.customerName,
        required this.callBack,
        required this.isExpanded})
      : super(key: key);
  final String createDate;
  final String reportTime;
  final String customerName;
  final VoidCallback callBack;
  bool isExpanded;


  @override
  State<DailyTile> createState() => _DailyTileState();
}

class _DailyTileState extends State<DailyTile> {
  final GlobalKey<AppExpansionTileState> expansionTile = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: AppExpansionTile(
        key: expansionTile,
        onExpansionChanged: (value) {
          widget.isExpanded = value;
          print(value);
          setState(() {

          });
        },
        initiallyExpanded: widget.isExpanded,
        title: const Text('THÔNG TIN BÁO CÁO'),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Colors.black.withOpacity(0.1), width: 1))),
                ),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'Thời gian tạo: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.createDate,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'Thời gian báo cáo: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.reportTime,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'Tên Khách Hàng: ',
                      style: TextStyle(
                        color:  Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.customerName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Hành động: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if(widget.isExpanded) {
                          expansionTile.currentState!.collapse();
                        }
                        widget.callBack();
                      },
                      child: const Icon(Icons.delete,
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
    );
  }
}
