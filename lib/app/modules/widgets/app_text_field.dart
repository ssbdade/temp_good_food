import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key, required this.hintText, required this.textEditingController, this.textInputType})
      : super(key: key);
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            hintText,
            maxLines: 3,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          width: 150,
          height: 35,
          child: SizedBox(
            child: TextField(
              controller: textEditingController,
              keyboardType: textInputType ?? TextInputType.text,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.w,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
