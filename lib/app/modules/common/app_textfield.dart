import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      this.height,
      this.width,
      this.controller,
      this.style,
      this.hintText,
      this.padding,
      this.hintStyle})
      : super(key: key);

  final double? height;
  final double? width;
  final TextEditingController? controller;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: style ??
            Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ??
              Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
          contentPadding: padding,
        ));
  }
}
