import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {Key? key, this.onTap, this.buttonTitle, this.textColor, this.style})
      : super(key: key);

  final Function()? onTap;
  final String? buttonTitle;
  final Color? textColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        buttonTitle ?? "",
        style: style ??
            TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: textColor ?? Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }
}
