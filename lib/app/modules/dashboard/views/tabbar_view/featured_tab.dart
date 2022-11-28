import 'package:temp_good_food/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:temp_good_food/app/utils/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FeaturedTab extends GetView<DashboardController> {
  const FeaturedTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: height(20), bottom: height(20), left: width(20)),
          child: SizedBox(
            height: height(150),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        height: height(150),
                        width: width(280),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(radius(12))
                        ),
                        child: Card(child: Center(child: Text('Entry $index'))),
                      ),
                      SizedBox(
                        width: width(20),
                      )
                    ],
                  );
                }
            ),
          ),
        ),
        ListView(
          controller: controller.scrollController,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: height(150),
              width: width(150),
              color: Colors.red,
              child: const Center(child: Text('Entry 1')),
            ),
            Container(
              height: height(150),
              width: width(150),
              color: Colors.red,
              child: const Center(child: Text('Entry 2')),
            ),
            Container(
              height: height(150),
              width: width(150),
              color: Colors.red,
              child: const Center(child: Text('Entry 3')),
            )
          ],
        ),
      ],
    );
  }
}
