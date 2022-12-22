import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownField extends StatelessWidget {
  DropDownField({Key? key, required this.hint, required this.items, required this.dropdownValue, required this.validate}) : super(key: key);
  final String hint;
  final List items;
  String? dropdownValue;
  final Function(Object? value) validate;



  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isDense: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validate(value),
      // value == null ? 'Xin hãy chọn database' : null,
      hint: Text(
        hint,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        focusedBorder: OutlineInputBorder( //<-- SEE HERE
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        errorBorder: OutlineInputBorder( //<-- SEE HERE
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder( //<-- SEE HERE
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ))
          .toList(),
      value: dropdownValue,
      // controller.selectedDataBase!.value == ""
      //     ? null
      //     : controller.selectedDataBase!.value,
      onChanged: (value) {
        dropdownValue = value.toString();
      },
    );
  }
}
