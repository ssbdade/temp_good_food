import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:temp_good_food/app/utils/constants/app_image.dart';
import 'package:temp_good_food/app/modules/common/app_button.dart';
import 'package:temp_good_food/app/utils/constants/text_const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/common/common.dart';
import '../controllers/auth_controller.dart';

class SplashView extends GetView<AuthController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: width(12), top: height(30)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  AppImage.threeDotIcon,
                  color: Theme.of(context).colorScheme.onBackground,
                  height: height(24),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My CookBook',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: size(28),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: height(550),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (_, int index) {
                      return InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: height(550),
                          width: width(250),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(radius(18)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: height(400),
                                    decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).colorScheme.primary,
                                        borderRadius:
                                            BorderRadiusDirectional.only(
                                                topEnd:
                                                    Radius.circular(radius(18)),
                                                topStart:
                                                    Radius.circular(radius(18)))),
                                  ),
                                  Text(
                                    'Title $index',
                                    style: TextStyle(
                                      fontSize: size(24),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text('World Food'),
                                      Spacer(),
                                      Text('1,2K'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      RatingBar.builder(
                                          itemBuilder: (_,__) {
                                            return Icon(Icons.star,
                                              color: Colors.amber,
                                            );
                                          },
                                          itemSize: 24,
                                          initialRating: 4,
                                          maxRating: 5,
                                          minRating: 1,
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          }),
                                      Spacer(),
                                      Text('Cooked'),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    }, separatorBuilder: (_, int index) { 
                      return SizedBox(
                        width: width(15),
                      );
                },),
              ),
              Text(
                'Cooked Recipes',
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  itemBuilder: (_, int index)
                  => Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.red,
                      ),
                      Text('Cooked $index')
                    ],
                  ), separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 12,
                    );
                },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
