import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      this.height,
      this.width,
      this.onTap,
      this.borderRadius,
      this.buttonTitle, this.buttonColor, this.textColor, this.style})
      : super(key: key);
  final double? height;
  final double? width;
  final Function()? onTap;
  final BorderRadius? borderRadius;
  final String? buttonTitle;
  final Color? buttonColor;
  final Color? textColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          color: buttonColor ?? Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height ?? 0),
            child: Text(
              buttonTitle ?? "",
              style: style ?? TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: textColor ?? Theme.of(context).colorScheme.background,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
