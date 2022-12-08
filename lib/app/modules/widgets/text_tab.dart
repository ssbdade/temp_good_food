import 'package:flutter/material.dart';
import 'package:temp_good_food/app/utils/theme/app_colors.dart';

class TextTab extends StatefulWidget {
  const TextTab({Key? key, required this.tab,
    // required this.tabView
  }) : super(key: key);

  final List<String> tab;
  // final List<Widget> tabView;

  @override
  State<TextTab> createState() => _TextTabState();
}

class _TextTabState extends State<TextTab> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.tab.length, (index) =>
          GestureDetector(
            onTap: () {
              setState(() {
                currentTab = index;
              });
            },
            child: Text(
                widget.tab[index],
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w400,
                color: currentTab == index ? AppColors.black : AppColors.grayBottomNav,
              ),
            ),
          )),
    );
  }
}


