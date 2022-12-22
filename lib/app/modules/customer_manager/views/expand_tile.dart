import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temp_good_food/app/modules/drawer/views/panl.dart';

class ExpandTile extends StatefulWidget {
  ExpandTile(
      {Key? key,
      required this.id,
      required this.name,
      required this.sortName,
      required this.email,
      required this.phone,
      required this.note, required this.isActive, required this.callBack, required this.isExpanded})
      : super(key: key);
  final String id;
  final String name;
  final String sortName;
  final String email;
  final String phone;
  final String note;
  final VoidCallback callBack;
  bool isExpanded;
  bool isActive;

  @override
  State<ExpandTile> createState() => _ExpandTileState();
}

class _ExpandTileState extends State<ExpandTile> {
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
        title: const Text('THÔNG TIN KHÁCH HÀNG'),
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
                      text: 'Mã Khách Hàng: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.id,
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
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.name,
                      style: TextStyle(
                        color: widget.isActive ? Colors.lightBlue : Colors.black,
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
                    TextSpan(
                      text: 'Tên ngắn gọn: ',
                      style: TextStyle(
                        color:  Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.sortName,
                      style: TextStyle(
                        color: widget.isActive ? Colors.lightBlue : Colors.black,
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
                    TextSpan(
                      text: 'Email: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.email,
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
                    TextSpan(
                      text: 'SĐT: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.phone,
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
                    TextSpan(
                      text: 'Ghi chú: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.note,
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
                Row(
                  children: [
                    Text('Trạng thái: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                          value: widget.isActive,
                          onChanged: (onChanged) {
                            print('state: ${expansionTile.currentState}');
                            setState(() {
                              widget.isActive = onChanged;
                            });
                          }),
                    )

                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Thao tác: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        if(widget.isExpanded) {
                          expansionTile.currentState!.collapse();
                        }
                        widget.callBack();
                      },
                      child: Icon(Icons.delete,
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
