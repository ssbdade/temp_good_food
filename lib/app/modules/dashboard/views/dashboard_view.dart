import 'package:temp_good_food/app/modules/common/common.dart';
import 'package:temp_good_food/app/modules/dashboard/views/tabbar_view/featured_tab.dart';
import 'package:temp_good_food/app/utils/constants/app_image.dart';
import 'package:temp_good_food/app/utils/constants/text_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../utils/common/common.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: SingleChildScrollView(
            controller: controller.scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                  height: height(300),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      AppImage.lightDashboardBg,
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.topRight,
                            child: SvgPicture.asset(
                              AppImage.threeDotIcon,
                              height: height(20),
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height(100),
                        ),
                        Text(
                          KeyConst.dashboardMainTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.background,
                            fontSize: size(28),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              KeyConst.dashboardMainDescription,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: size(12),
                              ),
                            ),
                            const Spacer(),
                            AppButton(
                              buttonTitle: KeyConst.viewMore,
                              buttonColor:
                                  Theme.of(context).colorScheme.background,
                              height: height(5),
                              borderRadius: BorderRadius.circular(radius(24)),
                              width: width(100),
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: size(12),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            TabBar(
                tabs: [
              Tab(
                child: Text(
                  KeyConst.featured,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: size(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  KeyConst.popular,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: size(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  KeyConst.newText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: size(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 500,
              child: TabBarView(
                  children: [
                const FeaturedTab(),
                Text(
                  'Popular',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: size(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'new',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: size(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
            )
          ],
        ),
      )),
    );
  }
}
