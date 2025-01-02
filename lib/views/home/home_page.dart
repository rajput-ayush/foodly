import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/custom_appbar.dart';
import 'package:foodly/common/custom_container.dart';
import 'package:foodly/common/heading.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/views/home/food_closer_to_you.dart';
import 'package:foodly/views/home/nearby_restaurants.dart';
import 'package:foodly/views/home/try_something_dart.dart';
import 'package:foodly/views/home/widgets/category_list.dart';
import 'package:foodly/views/home/widgets/food_list.dart';
import 'package:foodly/views/home/widgets/nearby_restaurant_list.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h), child: const CustomAppBar()),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const CategoryList(),

            Heading(
                text: "Try Something New",
                OnTap: () {
                  Get.to(() => const TrySomethingNew(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 900));
                },
              ),

              const FoodList(),


              Heading(
                text: "Nearby Restaurants",
                OnTap: () {
                  Get.to(() => const NearbyRestaurants(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 900));
                },
              ),

              const NearbyRestaurantList(),


              Heading(
                text: "Food Closer to you",
                OnTap: () {
                  Get.to(() => const FoodCloserToYou(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 900));
                },
              ),

              const FoodList(),
            ],
          ),
        ),
      ),
    );
  }
}
