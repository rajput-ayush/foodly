import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/background_container.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/constants/uidata.dart';
import 'package:foodly/views/home/widgets/restaurant_tile.dart';

class NearbyRestaurants extends StatelessWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
          text: "Nearby Restaurants",
          style: appStyle(13, kLightWhite, FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: BackGroundContainer(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                restaurants.length,
                (i) {
                  var restaurant = restaurants[i];
                  return RestaurantTile(
                    restaurant: restaurant,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
