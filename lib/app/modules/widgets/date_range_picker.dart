import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DateRange extends StatefulWidget {
  DateRange({Key? key, this.startDate, this.endDate}) : super(key: key);
  String? startDate;
  String? endDate;
  @override
  State<DateRange> createState() => _DateRangeState();
}



class _DateRangeState extends State<DateRange> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2099));

                        widget.startDate =
                            DateFormat('dd/MM/yyyy')
                                .format(pickedDate!);
                        setState(() {
                          widget.startDate;
                        });
                      },
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            widget.startDate!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              )),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2099));

                        widget.endDate =
                            DateFormat('dd/MM/yyyy')
                                .format(pickedDate!);
                        setState(() {

                        });
                      },
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            widget.endDate!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.date_range_sharp),
                  SizedBox(
                    width: 15,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
