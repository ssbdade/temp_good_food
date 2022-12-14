import 'package:flutter/material.dart';
import 'package:temp_good_food/app/modules/drawer/views/panl.dart';

class ServiceTile extends StatefulWidget {
  ServiceTile(
      {Key? key,
        required this.id,
        required this.name,
        required this.description,
        required this.callBack,
        required this.isExpanded, required this.status})
      : super(key: key);
  final String id;
  final String name;
  final String description;
  final String status;
  final VoidCallback callBack;
  bool isExpanded;


  @override
  State<ServiceTile> createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
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
        title: const Text('THÔNG TIN DỊCH VỤ'),
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
                      text: 'ID: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.id,
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
                      text: 'Tên dịch vụ: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.name,
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
                      text: 'Mô tả: ',
                      style: TextStyle(
                        color:  Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.description,
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
                      text: 'Trạng thái: ',
                      style: TextStyle(
                        color:  Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: widget.status,
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
