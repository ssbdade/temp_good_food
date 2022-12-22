import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      required this.hintText,
      required this.textEditingController,
      this.textInputType,
      required this.compulsory})
      : super(key: key);
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  final bool compulsory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: hintText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              if (compulsory)
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
            ]),
          ),
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (compulsory == true && (value == null || value.isEmpty)) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: textEditingController,
            keyboardType: textInputType ?? TextInputType.text,
            style: TextStyle(
              fontSize: 16,
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(
                fontWeight: FontWeight.w600,
              ),
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
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.w,
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.w,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
