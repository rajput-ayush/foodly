import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/background_container.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/hooks/fetch_all_foods.dart';
import 'package:foodly/models/foods_model.dart';
import 'package:foodly/shimmers/foodlist_shimmer.dart';
import 'package:foodly/views/home/widgets/food_tile.dart';

class TrySomethingNew extends HookWidget {
  const TrySomethingNew({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFood("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
          text: "Recommendations",
          style: appStyle(13, kLightWhite, FontWeight.w600),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading ? const FoodsListShimmer() : Padding(
          padding: EdgeInsets.all(12.h),
          child:  ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              foods!.length,
              (i) {
                FoodsModel food = foods[i];
                return FoodTile(
                  food: food,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}