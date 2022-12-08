import 'package:flutter/material.dart';
import 'package:temp_good_food/app/modules/modules.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

class TextTab extends StatefulWidget {
  TextTab({Key? key, required this.tab, this.onChange,
    // required this.tabView
  }) : super(key: key);

  final Function()? onChange;
  final List<String> tab;
  int currentTab = 0;
  // final List<Widget> tabView;

  @override
  State<TextTab> createState() => _TextTabState();
}

class _TextTabState extends State<TextTab> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.tab.length, (index) =>
          GestureDetector(
            onTap: () {
              setState(() {
                widget.currentTab = index;
              });
              widget.onChange;
            },
            child: Text(
                widget.tab[index],
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w400,
                color: widget.currentTab == index ? AppColors.black : AppColors.grayBottomNav,
              ),
            ),
          )),
    );
  }
}


